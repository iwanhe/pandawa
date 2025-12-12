// Copyright (c) 1999, Oracle Corpration. all Rights Reserved.
//
// Create the standard footer with link icons.
// Contextual link icons are created using a table.
//
// The basic format of this page is a nested table.  The outer table contains one row and two columns. 
// The left cell contains a subtable with the currently selected add-ins and the copyright message.  
// The right cell contains a right-justified table holding the link icons and labels.
// History
// ----------------------------------------------------------------------------------------------------------
// 07-Sep-99		Jim Lange			- Change links to call openWindow function
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function standardFooter(link) {
// link is an array of link objects

	var s = new String();
	s = '<html>\n';
	s += '<head>';
	s += '<meta name="copyright" content="' + copyright + '">\n';
	s += '<link rel="STYLESHEET" title="default" media="screen" ';
    s += '  href="menu/style/general.css" type="text/css">';
	s += '</head>';
	s += '<body bgcolor="#FFFFFF">\n';

	s += '<img src="menu\images\blueline.gif" width="98%" height=2 border=0 hspace=0 vspace=0><br>\n';
	s += '<DIV CLASS="addinsList"><B>Selected <a href="javascript:top.addinPage()">Add-Ins</a>: </B>';	
	s = showAddin(s);				// append add-in list onto string
	s += '</DIV>\n';

	s += '<table width="95%" border="0" height="60" cellpadding="0" cellspacing="0">\n';
	s += '	<tr valign="TOP">\n';
	s += '		<td width="40%">\n';		// cell 1 of outer table

	s += '			<table width="100%" height="60" align="LEFT" border="0" cellpadding="0" cellspacing="0">\n';

	// Insert copyright
    s += '				<tr valign="BOTTOM"> \n';
    s += '					<td>\n';	// empty cell
	s += '						<div class="copyright">' + copyright + '</div>\n';
	s += '					</td>\n';
	s += '				</tr>\n';
	s += '			</table>\n';
	s += '		</td>\n';

	s += '		<td width="60%">\n';		// cell 2 of outer table, right aligned, containing another table
	s += '			<table width="'+(link.length)*80+'" height="100%" align="RIGHT" border="0" cellpadding="0" cellspacing="0">\n';

	// 
	// create as many cells as needed for links.
	//
    s += '				<tr valign="BOTTOM"> \n';

	var linkpath;
//top.methodFrm.dumpObject(link);

	for (var i = 0; i < link.length; i++) {
		linkpath = link[i].url;
		
		// if link is not absolute (either file or web), then prepend basepath

		if (!(linkpath.substr(0,2) == "\\" || linkpath.substr(1,1) == ":" || linkpath.indexOf("://") > 0)) {
			if (link[i].addin != "" && (top.addins[link[i].addin]) ) {
				linkpath = top.addins[link[i].addin].base_path + '/' + linkpath
			}
		}

		s += '					<td width="60" height="32"> \n';
		s += '						<div align="center"><a href="javascript:top.openWindow(' 
									+ "'" + linkpath + "'"
									+ ')"><img border=0 src="' + link[i].icon 
									+ '" alt="' + link[i].name + '" height="32" width="32"></a></div>\n';
		s += '					</td>\n';
    }
	s += '				</tr>\n';

	//
	// Fill-in descriptive text for the icons with links
	//
    s += '				<tr valign="TOP"> \n';
	for (var i = 0; i < link.length; i++) {
		linkpath = link[i].url;
		
		// if link is not absolute (either file or web), then prepend basepath

		if (!(linkpath.substr(0,2) == "\\" || linkpath.substr(1,1) == ":" || linkpath.indexOf("://") > 0)) {
			if (link[i].addin != "" && (top.addins[link[i].addin]) ) {
				linkpath = top.addins[link[i].addin].base_path + '/' + linkpath
			}
		}
		s += '					<td width="50" height="15" align="center" class="iconText"> \n';
		s += '					<a href="javascript:top.openWindow('
								+ "'" + linkpath + "'"
								+ ')">' + link[i].text + '</a>\n';
		s += '					</td>\n';
	}
    s += '				</tr>\n';
	s += '			</table>\n';			// end of second inner table
	s += '		</td>\n';					// end of second cell of outer table
	s += '	</tr>\n';
	s += '</table>\n';

	s += '</body>\n</html>\n';

	window.frames["footer"].document.open("text/html");
	window.frames["footer"].document.write(s);
	window.frames["footer"].document.close();
}

//=========================================================
function showAddin(s) {
//
// append a comma-delimited list of active addins to string
//

	for (var i=0; i < top.actAddinArry.length; i++) {
	   s += top.methodAddinArry[top.actAddinArry[i]].description + ', ';
    }
	s = s.substr(0, s.length -2);

	return (s);
}

