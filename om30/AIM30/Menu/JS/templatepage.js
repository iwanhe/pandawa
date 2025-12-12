// Copyright (c) 1999, Oracle Corpration. all Rights Reserved.
//
// show the task description and list of available templates
//
// 19-Jul-99	Jim Lange		- Changed template type display logic
// 08-Sep-99	Jim Lange		- Don't prepend ome_path to file link (coordinated with
//								  omparser.js changes)
//
//==============================================================================

function templatePage(tIDX) {
//    checkHistory();

    var s = new String();
    var task_id = top.mergedAddin[tIDX].taskid;
	var template = top.mergedAddin[tIDX].template;		// array

//methodFrm.SystemOut(tIDX+": "+top.mergedAddin[tIDX].taskid + " has " + top.mergedAddin[tIDX].link.length + " links");

	// determine whether task includes templates and/or notes

	var numNotes = 0;
	var numTemplates = 0;
	for (var t in template) {
		numNotes += (template[t].note != ""? 1 : 0);
		numTemplates += (template[t].file != ""? 1 : 0);
	}

	// Set heading text based on what will be displayed

	var headingText;
	if (numTemplates > 0 && numNotes > 0) {
		headingText = "Template / Instructions";
	}
	else if (numNotes > 0) {
		headingText = "Instructions";
	}
	else {				// includes the case of no template or note
		headingText = "Template";
	}

	s = '<html>\n';
	s += '<head>\n';
	s += '<meta name="copyright" content="' + copyright + '">\n';
	s += '<link rel="STYLESHEET" title="default" media="screen" ';
    s += '  href="menu/style/general.css" type="text/css">';
	s += '</head>';
	s += '<body bgcolor="#FFFFFF">\n';
	s += '<div class="navigation">';
	s += pagePath + ' > ' + task_id;
	s += '</div>\n';
	s += '<p>\n';
	s += '  <table width="75%" border="0">\n';
	s += '    <tr> \n';
	s += '      <td colspan="3"><span class="taskHeader">' + task_id + " " + top.mergedAddin[tIDX].name + '\n';
	s += '        </span></td>\n';
	s += '    </tr>\n';
	s += '    <tr> \n';
	s += '      <td colspan="2" class="taskDescription">' + top.mergedAddin[tIDX].description + '\n';
	s += '      <td width="20%">&nbsp;</td>\n';
	s += '    </tr>\n';
	s += '	    <tr>\n';
	s += '      <td width="61%">&nbsp;</td>\n';
	s += '      <td width="19%"></td>\n';
	s += '      <td width="20%"></td>\n';
	s += '    </tr>\n';
	s += '    <tr> \n';
	s += '      <td width="61%" colspan="2"><b><font color="#000000" size="3" class="deliverableName">Deliverable \n';
	s += '        : ' + top.mergedAddin[tIDX].deliverable;
	if (template[0].state != "" && template[0].state != null) {
		s += ' ' + template[0].state;
	}
	s += '</font></b></td>\n';
	s += '      <td width="20%">&nbsp;</td>\n';
	s += '    </tr>\n';
	s += '  </table>\n';
    s += '  <table width="75%" border="0" cellpadding="0" cellspacing="0">\n';
    s += '    <tr bgcolor="' + bar_bground + '"> \n';
    s += '      <th height="30" width="3%"> \n';	
    s += '        <div align="center"> <img border=0 src="menu/images/priority.gif" width="16" height="11"></div>\n';
    s += '      </th>\n';
    s += '      <th height="30">\n';
    s += '        <div align="left"><font face="Helvetica, san-serif, Arial, verdana" color="' 
		+ bar_textcol + '" size="1"><b>' + headingText + '</b></font></div>\n';
    s += '      </th>\n';
    s += '      <th height="30">&nbsp;</th>\n';
    s += '      <th height="30" width="33%"> \n';
    s += '        <div align="left"><font face="Helvetica, san-serif, Arial, verdana" color="' + bar_textcol + '" size="1"><b>Add-in</b></div>\n';
    s += '      </th>\n';
    s += '    </tr>\n';
	//
    // start dynamic table build
	// list all the templates for the selected addins
	//
	var thisAddin;

	alternateColor = false;

	for (var i = 0; i < template.length; i++) {
//methodFrm.SystemOut("template " + i + " addin = " + template[i].addin);

		thisAddin = top.addins[template[i].addin];

		if (alternateColor == true) {
			s += '      <tr  bgcolor="#E6E6E6"> \n';
			alternateColor = false;
		} else {
			s += '      <tr>\n';
			alternateColor = true;
		}
		s += '	  <td width="3%" height="24">\n';
		s += '        <div align="center"><img border=0 src="' 
			+ top.numGif[thisAddin.priority] 
			+ '" width="12" height="12"></div>\n';
		s += '      </td>\n';
		s += '      <td width="44%" height="24"><font face="Helvetica, san-serif, Arial, verdana" size="1">';
		
		// display note text as needed
		if (template[i].file == "" && template[i].note == "") {
			s += 'No template available';			// no template or note
		}
		else if (template[i].file == "") {			// note != "" is implied
			s += template[i].note;
		}
		else {										// show template and (perhaps) note
			s += '<a href="' + thisAddin.base_path + "/" + template[i].file + '">' 
				+ template[i].description + '</a>';
			if (template[i].note != "") {
				s += "<br>Note: " + template[i].note;
			}
		
		}
		s += '</font></td>\n';
		s += '      <td><div align="center">\n';

		s += '<img border=0 src="menu/images/' + template[i].type + '.gif">\n';

		s += '      </div></td>\n';
		s += '      <td width="45%"><font face="Helvetica, san-serif, Arial, verdana" size="1">' 
					+ thisAddin.description 
					+ ', Rel. ' + thisAddin.apps_release 
					+ ',' + thisAddin.language 
					+ ',' + thisAddin.geography 
					+ '</font></td>';
		s += '    </tr>\n';
	}

	s += '  </table>\n';
	s += '</body>\n';

	window.frames["middle-frame"].document.open();
	window.frames["middle-frame"].document.write(s);
	window.frames["middle-frame"].document.close();

	standardFooter(top.mergedAddin[tIDX].link);	
}