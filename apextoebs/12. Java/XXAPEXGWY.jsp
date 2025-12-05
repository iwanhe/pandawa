<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%--
/*===========================================================================+
 |      Copyright (c) 2009, 2014 Oracle Corporation, Redwood Shores, CA, USA       |
 |                         All rights reserved.                              |
 +===========================================================================+
 |  FILENAME                                                                 |
 |    GWY.jsp                                                                |
 |                                                                           |
 |  DESCRIPTION                                                              |
 |    GWY.jsp handles external application URL embedding within              |
 |    E-Business Suite. GWY expects to be invoked only from RF as            |
 |    standard function invocation.                                          |
 |                                                                           |
 |  DEPENDENCIES                                                             |
 |                                                                           |
 |  HISTORY                                                                  |
 |    01-AUG-2009   raghosh     created                                      |
 +===========================================================================*/
--%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="oracle.apps.fnd.common.VersionInfo"%>
<%@ page import="oracle.apps.fnd.services.gwy.XXApexExternalAppManager"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Oracle Applications External Gateway</title>
  </head>
  <body>
  
    <%! public static final String RCS_ID =  "$Header: GWY.jsp 120.3.12020000.3 2014/12/17 08:55:49 vsoolapa ship $"; %>
    <%! public static final boolean RCS_ID_RECORDED =  VersionInfo.recordClassVersion(RCS_ID,"oa_html"); %>
    
    <%
        XXApexExternalAppManager manager = null;
        try {
            Enumeration<String> paramNames = request.getParameterNames();
    
            Map<String, String> params = new HashMap<String, String>();
    
            while(paramNames.hasMoreElements()) {
                String param = paramNames.nextElement();
                String paramVal = request.getParameter(param);
                if (!(paramVal == null || "".equals(paramVal)))
                    paramVal = paramVal.trim();
                params.put(param, paramVal);
            }
    
            //boolean debugMode = "Y".equalsIgnoreCase(params.get("debug")) ? true : false;
            //if (debugMode) {
            //      Iterator iter = params.entrySet().iterator();
            //      while (iter.hasNext()) {
            //              Map.Entry aPair = (Map.Entry) iter.next();
            //              out.println(String.valueOf(aPair.getKey()) + "=" + String.valueOf(aPair.getValue()) + "<br>");
            //      }
            //}
    
            String targetType = params.get(XXApexExternalAppManager.EXTERNAL_APP_TYPE_PARAM);
            if (targetType == null || "".equals(targetType))
                targetType = (String) request.getAttribute(XXApexExternalAppManager.EXTERNAL_APP_TYPE_PARAM);
                
            String handlerClass = params.get(XXApexExternalAppManager.EXTERNAL_APP_HANDLER_PARAM);
            if (handlerClass == null || "".equals(handlerClass))
                handlerClass = (String) request.getAttribute(XXApexExternalAppManager.EXTERNAL_APP_HANDLER_PARAM);
            //String authFunction = params.get(XXApexExternalAppManager.EXTERNAL_APP_AUTH_FUNCTION);
            manager = new XXApexExternalAppManager(request, response, targetType, handlerClass);
            manager.logParams(params);
            
            manager.doForward(params, false);
        }
        finally {
            if (manager != null)
              manager.releaseResources(); //Bug 19814522. Move release to finally block.
        }
        
    %>
  </body>
</html>
