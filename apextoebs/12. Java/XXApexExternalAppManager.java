package oracle.apps.fnd.services.gwy;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oracle.apps.fnd.common.AppsConsoleLogger;
import oracle.apps.fnd.common.Const;
import oracle.apps.fnd.common.Log;
import oracle.apps.fnd.common.VersionInfo;
import oracle.apps.fnd.common.WebAppsContext;
import oracle.apps.fnd.services.gwy.AbstractExternalAppAccessor;
import oracle.apps.fnd.services.gwy.AuthenticationInfo;
import oracle.apps.fnd.services.gwy.ExternalApp;
import oracle.apps.fnd.services.gwy.ExternalAppManager;
import oracle.apps.fnd.services.gwy.ForwardUrlProhibitedException;
import oracle.apps.fnd.services.gwy.GWYSecurityManager;
import oracle.apps.fnd.services.gwy.ResponsePostProcessor;
import oracle.apps.fnd.services.gwy.URLActionException;
import oracle.apps.fnd.services.gwy.URLActionHandler;
import oracle.apps.fnd.services.gwy.URLActionHandlerFactory;
import oracle.apps.fnd.common.*;

public class XXApexExternalAppManager<T extends AbstractExternalAppAccessor>
{
    public static final String RCS_ID = "$Header: ExternalAppManager.java 120.6.12020000.9 2020/07/01 20:24:38 saarvapa ship $";
    public static final boolean RCS_ID_RECORDED;
    public static final String EXTERNAL_APP_TYPE_PARAM;
    public static final String EXTERNAL_APP_HANDLER_PARAM;
    public static final String EXTERNAL_APP_AUTH_FUNCTION = "authFunction";
    private final HttpServletRequest _request;
    private final HttpServletResponse _response;
    private WebAppsContext _wctx;
    private T _accessor;
    private SecurityManager _securityManager;
    private Log logger;
    
    public XXApexExternalAppManager(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse, final String s) throws SecurityException {
        this(httpServletRequest, httpServletResponse, s, null);
    }
    
    public XXApexExternalAppManager(final HttpServletRequest request, final HttpServletResponse response, final String s, final String accessorClass) throws SecurityException {
        this._request = request;
        this._response = response;
        try {
            final GWYSecurityManager securityManager = new GWYSecurityManager(request, response, "");
            this._securityManager = (SecurityManager)securityManager;
            this._wctx = securityManager.getAppsSecurityContext();
            if (this._wctx == null) {
                throw new NullPointerException("Could not get a context !!");
            }
            final ExternalApp externalApp = ExternalApp.getExternalApp(s);
            if (externalApp == null) {
                throw new IllegalArgumentException("Target Application type " + s + " is invalid or unsupported !!");
            }
            externalApp.setAccessorClass(accessorClass);
            (this._accessor = (T)externalApp.getAccessor()).initialize(this._wctx, (Object)null);
            externalApp.setLogger(this.logger = this._wctx.getLog());
        }
        catch (Throwable t) {
            try {
                if (this._wctx != null) {
                    this._wctx.freeWebAppsContext();
                    this._wctx = null;
                }
            }
            catch (Throwable t2) {}
            if (t instanceof SecurityException) {
                throw (SecurityException)t;
            }
        }
    }
    
    public final void doForward(final Map<String, String> map) throws MalformedURLException, UnsupportedEncodingException, ForwardUrlProhibitedException, URLActionException {
        this.doForward(map, true);
    }
    
    public final void doForward(final Map<String, String> map, final boolean b) throws MalformedURLException, UnsupportedEncodingException, ForwardUrlProhibitedException, URLActionException {
        assert this.logger != null;
        assert this._wctx != null;
        assert this._accessor != null;
        if (this.logger.test((Object)this, 2)) {
            this.logger.write((Object)this, "Begin doForward(Map, boolean)", 2);
        }
        if (b) {
            this._wctx.validateSession();
        }
        map.remove(ExternalAppManager.EXTERNAL_APP_TYPE_PARAM);
        map.remove(ExternalAppManager.EXTERNAL_APP_HANDLER_PARAM);
        map.remove("authFunction");
        final HashMap hashMap = new HashMap();
        final HashMap<String, String> substituteTokens = this.substituteTokens(map);
        if (!this._accessor.isAuthorized(this._wctx)) {
            throw new ForwardUrlProhibitedException("Current session is not authorized to access this application !!");
        }
        final String accessURL = this._accessor.makeAccessURL(this._wctx, (Map)substituteTokens);
        if (this.logger.test((Object)this, 1)) {
            this.logger.write((Object)this, "Forward URL is : " + accessURL, 1);
        }
        final int actionType = this._accessor.getActionType(this._wctx, (Map)substituteTokens);
        final Map postParams = this._accessor.getPOSTParams(this._wctx, (Map)substituteTokens);
        final ResponsePostProcessor[] responsePostProcessor = this._accessor.getResponsePostProcessor(this._wctx, (Map)substituteTokens);
        final AuthenticationInfo authenticationInfo = this._accessor.getAuthenticationInfo(this._wctx, (Map)substituteTokens);
        substituteTokens.remove("targetAppAuthToken");
        substituteTokens.remove("targetAppAuthRealm");
        URLActionHandler actionInstance = null;
        try {
            actionInstance = URLActionHandlerFactory.getActionInstance(this._request, this._response, actionType);
            actionInstance.initialize();
            actionInstance.setResponsePostProcessor(responsePostProcessor);
            actionInstance.doAction(accessURL, postParams, authenticationInfo);
        }
        catch (URLActionException ex) {
            if (this.logger.test((Object)this, 4)) {
                this.logger.write((Object)this, "Exception while invoking action handler " + ex.getMessage(), 4);
            }
            throw ex;
        }
        catch (Exception ex2) {
            if (this.logger.test((Object)this, 4)) {
                this.logger.write((Object)this, "Exception while invoking action handler " + ex2.getMessage(), 4);
            }
            throw new URLActionException(ex2);
        }
        finally {
            if (actionInstance != null) {
                try {
                    actionInstance.releaseResources();
                }
                catch (Exception ex3) {}
            }
        }
        if (this.logger.test((Object)this, 2)) {
            this.logger.write((Object)this, "End doForward(Map, boolean)", 2);
        }
    }
    
    public void releaseResources() {
        final AppsConsoleLogger appsConsoleLogger = new AppsConsoleLogger(this.getClass().getName());
        final String string = this.getClass().getName() + ".releaseResources";
        if (((AppsLog)appsConsoleLogger).isEnabled(2)) {
            ((AppsLog)appsConsoleLogger).procedure(string, new Object[] { "BEGIN" });
        }
        try {
            if (this._accessor != null) {
                this._accessor.releaseResources();
                this._accessor = null;
                if (((AppsLog)appsConsoleLogger).isEnabled(string, 1)) {
                    ((AppsLog)appsConsoleLogger).statement(string, new Object[] { "Accessor relased" });
                }
            }
            else if (((AppsLog)appsConsoleLogger).isEnabled(string, 6)) {
                ((AppsLog)appsConsoleLogger).unexpected(string, new Object[] { "accessor was already null" });
            }
        }
        catch (Throwable t) {
            if (((AppsLog)appsConsoleLogger).isEnabled(string, 6)) {
                ((AppsLog)appsConsoleLogger).write(string, "Accessor release failed-" + t.toString(), 6);
            }
        }
        try {
            if (this._wctx != null) {
                this._wctx.freeWebAppsContext();
                this._wctx = null;
                if (((AppsLog)appsConsoleLogger).isEnabled(string, 1)) {
                    ((AppsLog)appsConsoleLogger).statement(string, new Object[] { "WebAppsContext relased" });
                }
            }
            else if (((AppsLog)appsConsoleLogger).isEnabled(string, 6)) {
                ((AppsLog)appsConsoleLogger).unexpected(string, new Object[] { "WebAppsContext was already null" });
            }
        }
        catch (Throwable t2) {
            if (((AppsLog)appsConsoleLogger).isEnabled(string, 6)) {
                ((AppsLog)appsConsoleLogger).write(string, "_wctx release failed-" + t2.toString(), 6);
            }
        }
        if (this.logger != null) {
            this.logger = null;
            if (((AppsLog)appsConsoleLogger).isEnabled(string, 1)) {
                ((AppsLog)appsConsoleLogger).statement(string, new Object[] { "Logger relased" });
            }
        }
        else if (((AppsLog)appsConsoleLogger).isEnabled(string, 6)) {
            ((AppsLog)appsConsoleLogger).unexpected(string, new Object[] { "Logger was already null" });
        }
        if (((AppsLog)appsConsoleLogger).isEnabled(string, 2)) {
            ((AppsLog)appsConsoleLogger).procedure(string, new Object[] { "END" });
        }
    }
    
    public void logParams(Map paramMap) {
    assert this.logger != null;
    assert this._wctx != null;
    if (this.logger.test(this, 2))
      this.logger.write(this, "Begin printParams(Map)", 2); 
    if (this.logger.test(this, 1)) {
      this.logger.write(this, "Character set used to decode : " + this._wctx.getClientEncoding(), 1);
      Iterator<Map.Entry> iterator = paramMap.entrySet().iterator();
      while (iterator.hasNext()) {
        Map.Entry entry = iterator.next();
        try {
          this.logger.write(this, String.valueOf(entry.getKey()) + "=" + String.valueOf(entry.getValue()), 1);
        } catch (Exception exception) {}
      } 
    } 
    if (this.logger.test(this, 2))
      this.logger.write(this, "End printParams(Map)", 2); 
  }
    
    private HashMap<String, String> substituteTokens(final Map<String, String> map) {
        assert this.logger != null;
        assert this._wctx != null;
        if (this.logger.test((Object)this, 2)) {
            this.logger.write((Object)this, "Begin substituteTokens(Map)", 2);
        }
        final HashMap<String, String> hashMap = new HashMap<String, String>();
        final String string = Integer.toString(this._wctx.getRespId());
        final String string2 = Integer.toString(this._wctx.getRespApplId());
        final String string3 = Integer.toString(this._wctx.getSecurityGroupID());
        final String currLangCode = this._wctx.getCurrLangCode();
		final String string4 = Integer.toString(this._wctx.getUserId());
        for (final Map.Entry<String, String> entry : map.entrySet()) {
            final String s = entry.getKey();
            String s2 = (entry.getValue() == null) ? null : entry.getValue();
            if (s2 == null) {
                hashMap.put(s, s2);
            }
            else {
                if (s2.indexOf("[RESPONSIBILITY_ID]") >= 0) {
                    s2 = s2.replaceFirst("\\[RESPONSIBILITY_ID\\]", string);
                }
                if (s2.indexOf("[RESP_APPL_ID]") >= 0) {
                    s2 = s2.replaceFirst("\\[RESP_APPL_ID\\]", string2);
                }
                if (s2.indexOf("[SECURITY_GROUP_ID]") >= 0) {
                    s2 = s2.replaceFirst("\\[SECURITY_GROUP_ID\\]", string3);
                }
                if (s2.indexOf("[LANGUAGE_CODE]") >= 0) {
                    s2 = s2.replaceFirst("\\[LANGUAGE_CODE\\]", currLangCode);
                }
				if (s2.indexOf("[USER_ID]") >= 0) {
                    s2 = s2.replaceFirst("\\[USER_ID\\]", string4);
                }
                hashMap.put(s, s2);
            }
        }
        if (this.logger.test((Object)this, 2)) {
            this.logger.write((Object)this, "End substituteTokens(Map)", 2);
        }
        return hashMap;
    }
    
    static {
        RCS_ID_RECORDED = VersionInfo.recordClassVersion("$Header: ExternalAppManager.java 120.6.12020000.9 2020/07/01 20:24:38 saarvapa ship $", "oracle.apps.fnd.services.gwy");
        EXTERNAL_APP_TYPE_PARAM = Const.GWY_APP_TYPE_PARAM;
        EXTERNAL_APP_HANDLER_PARAM = Const.GWY_APP_HANDLER_PARAM;
    }
}
