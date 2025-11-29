# Run from directory containing Apache access_log.nnnnnnnnn files, See MOS Note 2069190.1
BEGIN {
    mArr["Jan"] = "01"; mArr["Feb"] = "02"; mArr["Mar"] = "03";
    mArr["Apr"] = "04"; mArr["May"] = "05"; mArr["Jun"] = "06";
    mArr["Jul"] = "07"; mArr["Aug"] = "08"; mArr["Sep"] = "09";
    mArr["Oct"] = "10"; mArr["Nov"] = "11"; mArr["Dec"] = "12";

    fixed["/OA_HTML/EbiServlet"] = 1;
    fixed["/OA_HTML/FetchContent"] = 1;
    fixed["/OA_HTML/FNDSSOLoginRedirect"] = 1;
    fixed["/OA_HTML/FNDSSOLogoutRedirect"] = 1;
    fixed["/OA_HTML/FrmReportData"] = 1;
    fixed["/OA_HTML/iem_op_init"] = 1;
    fixed["/OA_HTML/iesAuthorServlet"] = 1;
    fixed["/OA_HTML/iesRuntimeServlet"] = 1;
    fixed["/OA_HTML/IspPunchInServlet"] = 1;
    fixed["/OA_HTML/oramipp_lpr"] = 1;
    fixed["/OA_HTML/MscObieeSrvlt"] = 1;
    fixed["/OA_HTML/MscRPRedirect"] = 1;
    fixed["/OA_HTML/MscUISrvlt"] = 1;
    fixed["/OA_HTML/oags"] = 1;
    fixed["/OA_HTML/olmCatalogImage"] = 1;
    fixed["/OA_HTML/getPhoto"] = 1;
    fixed["/OA_HTML/PonAjaxServlet"] = 1;
    fixed["/OA_HTML/RequestPriceBook"] = 1;
    fixed["/OA_HTML/SCGraphGen"] = 1;
    fixed["/OA_HTML/ServletPing"] = 1;
    fixed["/OA_HTML/Servlet"] = 1;
    fixed["/OA_HTML/SyncServlet"] = 1;
    fixed["/OA_HTML/ibwTrackingServlet"] = 1;
    fixed["/OA_HTML/ibytransmit"] = 1;
    fixed["/OA_HTML/VisDataProvider"] = 1;
    fixed["/OA_HTML/wshRequestRates"] = 1;

    pattern["/OA_HTML/frmservlet/"] = "/OA_HTML/frmservlet/.*";
    pattern["/OA_HTML/help/"] = "/OA_HTML/help/.*";
    pattern["/OA_HTML/HelpServlet/"] = "/OA_HTML/HelpServlet/.*";
    pattern["/OA_HTML/ibyecapp"] = "/OA_HTML/ibyecapp/*";
    pattern["/OA_HTML/oramipp_lop/"] = "/OA_HTML/oramipp_lop/.*";
    pattern["/OA_HTML/MonitorServlet/"] = "/OA_HTML/MonitorServlet/.*";
    pattern["/OA_HTML/OAR/"] = "/OA_HTML/OAR/.*";
    pattern["/OA_HTML/oowa/"] = "/OA_HTML/oowa/.*";
    pattern["/OA_HTML/qprRedirectServlet/"] = "/OA_HTML/qprRedirectServlet/.*";
    pattern["/OA_HTML/qprSvgServlet/"] = "/OA_HTML/qprSvgServlet/.*";
    pattern["/OA_HTML/weboamLocal/"] = "/OA_HTML/weboamLocal/.*";
    pattern["/OA_HTML/weboam/"] = "/OA_HTML/weboam/.*";
  
    h=0;  # counted hits
    f="2038-01-01_00:00";  # first ts
    l="2000-01-01_00:00";  # last  ts;
}

function date2ts(s)
{
   # s: "[09/Dec/2016:16:04:33"  -> ts: "2016-12-09_16:04"
   ts = sprintf( "%s-%s-%s_%s", substr(s,9,4), mArr[substr(s,5,3)], substr(s,2,2), substr(s,14,5) );
   return ts ;
}

function is_jsp (url)  # if url is a jsp return path DB update
{
   if ( url ~ /.*jsp$/ )
     return url
   return ""
}

function is_servlet (url)  # if url is a servlet return pattern for DB update
{
   if(  fixed[ url ] == 1 )  # if simple servlet
     return url

   for( p in pattern )       # if wildcarded servlet 
   {
     if( p == substr(url,1,length(p)) )
       return  pattern[p] ;
   }
   return "" ;
}

# For each access_log line
NF > 9 {
   rc = $9 ;  # position of return code depends on LogFormat!
   if ( rc ~ /HTTP/ ) rc = $10;
   if ( rc < 200 || rc >= 400 ) next;

   url = $7   # assumes the '?' has been mapped to ' '
 
   theurl = is_servlet( url ) ; 
   if( length( theurl ) == 0 )    # if not a servlet
   {
      theurl =  is_jsp( url ) ;   # check if jsp
   }

   if( length( theurl ) > 0 )  # is a servlet or a jsp
   {
      ts  = date2ts( $4 )     # only do for interesting URLs
#     printf "Y %s '%s'\n", ts,  theurl ;
      if( seen[ theurl ] != "1" ) # first time seen
      {
	seen[  theurl ] = 1  ;
	hits[  theurl ] = 1  ;
        first[ theurl ] = ts ;
        last[  theurl ] = ts ;
      }
      else
      {
        hits[ theurl ]  += 1  ;
        if( first[ theurl ] > ts )
            first[ theurl ] = ts ;
        if( last[  theurl ] < ts )
            last[  theurl ] = ts ;
      }
      h++ ;
      if( f > ts ) f = ts ;
      if( l < ts ) l = ts ;
   }
#  else
#     printf "N %s '%s'\n", ts,  url ;

}

END { # print the arrays for seen JSPs and servlets
    printf "=============== WEB USAGE: %d lines, %d counted hits %10.10s - %10.10s\n", NR, h, f, l ;
    print  "First hit seen   Most recent hit     #Hits URL"
    print  "================ ================ ======== =========================="
    for( u in hits )
    {
	printf "%s %s %8d %s\n", first[u], last[u], hits[u], u  | "sort -k4"
    }
}
