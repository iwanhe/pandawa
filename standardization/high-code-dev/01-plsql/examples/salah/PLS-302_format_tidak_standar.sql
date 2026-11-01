-- MELANGGAR: PLS-301 (huruf besar), PLS-302 (indentasi tab/tidak konsisten),
-- PLS-304 (koma di belakang), PLS-502 (tanpa alias), PLS-503 (join gaya lama),
-- PLS-504 (ORDER BY posisi), PLS-505 (SELECT *).
SELECT *
FROM APX_PRISM_VENDOR, APX_PRISM_SITE
WHERE APX_PRISM_VENDOR.VENDOR_ID = APX_PRISM_SITE.VENDOR_ID
ORDER BY 2;
