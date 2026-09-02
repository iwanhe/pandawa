// netlify/functions/token.js
// Proxy server-side untuk exchange OAuth2 client_credentials ke ORDS,
// supaya CLIENT_SECRET tidak pernah dikirim/disimpan di browser.
// Env vars di-set di Netlify Dashboard (server-side only, tidak pakai prefix VITE_):
//   ORDS_BASE_URL, OAUTH_CLIENT_ID, OAUTH_CLIENT_SECRET

export async function handler(event) {
  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, body: 'Method Not Allowed' };
  }

  const { ORDS_BASE_URL, OAUTH_CLIENT_ID, OAUTH_CLIENT_SECRET } = process.env;

  try {
    const basicAuth = Buffer.from(`${OAUTH_CLIENT_ID}:${OAUTH_CLIENT_SECRET}`).toString('base64');

    const resp = await fetch(`${ORDS_BASE_URL}/oauth/token`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        Authorization: `Basic ${basicAuth}`,
      },
      body: 'grant_type=client_credentials',
    });

    const data = await resp.json();

    if (!resp.ok) {
      return { statusCode: resp.status, body: JSON.stringify(data) };
    }

    // Token dikembalikan ke frontend untuk dipakai memanggil ORDS langsung dari browser.
    // Token client_credentials ini scope-nya terbatas ke privilege apx_vault_privilege,
    // jadi walau ada di browser, tidak membuka akses lain.
    return {
      statusCode: 200,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    };
  } catch (err) {
    return { statusCode: 500, body: JSON.stringify({ error: String(err) }) };
  }
}
