// Copyright (c) 1999, Oracle Corpration. all Rights Reserved.

function waitScreen(message) {
   var s = "";
   s += '<html>\n';
   s += '<head>\n';
   s += '<title>Thin Engine Start</title>\n';
   s += '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\n';
   s += '<meta name="copyright" content="' + copyright + '">\n';
   s += '<link rel="STYLESHEET" title="default" media="screen"   href="menu/style/general.css" type="text/css">\n';
   s += '</head>\n';
   s += '<body bgcolor="#FFFFFF">\n';
   s += '<br>\n';
   s += '<br>\n';
   s += '<br>\n';
   s += '<center>\n';
   s += '<table width="400" border="1" height="150">\n';
   s += '  <tr> \n';
   s += '    <td> \n';
   s += '      <div class="waitMessage">' + message + '</div>\n';
   s += '    </td>\n';
   s += '  </tr>\n';
   s += '  <tr bgcolor="#FFFFFF"> \n';
   s += '    <td> \n';
   s += '      <div align="center"> \n';
   s += '        <img border=0 src="menu/images/wait1.gif">\n';
   s += '      </div>\n';
   s += '    </td>\n';
   s += '  </tr>\n';
   s += '</table>\n';
   s += '</center>\n';
   s += '</body>\n';
   s += '</html>\n';

   window.frames["middle-frame"].document.open();
   window.frames["middle-frame"].document.write(s);
   window.frames["middle-frame"].document.close();

}
