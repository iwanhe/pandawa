// Copyright (c) 1999, Oracle Corpration. all Rights Reserved.
//
// main menu page
//
// History
// ----------------------------------------------------------------------------------------------------------
// 14-Sep-1999		Jim Lange		- Fixed PT/Ops Analysis link
//
// ----------------------------------------------------------------------------------------------------------

function menuPage() {
    top.taskListCache = new Array();				// force rebuild of task list when processPage is called

	window.frames["header"].document.forms[3].whatToFind.value = "";	// clear search field

    var s = new String();

	s = '<html>\n';
	s += '<head>';
	s += '<meta name="copyright" content="' + copyright + '">\n';
	s += '<link rel="STYLESHEET" title="default" media="screen" ';
    s += '  href="menu/style/general.css" type="text/css">';
	s += '</head>';
	s += '<body bgcolor="#FFFFFF">\n';

  	s += '<div class="navigation"><b>Navigation</b>: Main</div>\n'
	
    
	s += '<img border=0 SRC="menu/images/aimfo30a.gif" USEMAP="#visImageMap" border="0">\n';
	//
    // new map - 04/15/1999
	//
	s += '<MAP NAME="visImageMap">\n';
	s += '<!********Phases*********>        \n';
	s += '<AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + '*' + sq + ',' + sq + 'F' + sq + ')" ALT="Task/Deliverable for the Production phase" COORDS="578,34,643,34,643,10,578,10,578,34">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + '*' + sq + ',' + sq + 'E' + sq + ')" ALT="Task/Deliverables for the Transition phase" COORDS="514,34,575,34,575,10,514,10,514,34">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + '*' + sq + ',' + sq + 'D' + sq + ')" ALT="Task/Deliverables for the Build phase" COORDS="446,34,507,34,507,10,446,10,446,34">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + '*' + sq + ',' + sq + 'C' + sq + ')" ALT="Task/Deliverables of the Solution Design phase" COORDS="376,34,437,34,437,10,376,10,376,34">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + '*' + sq + ',' + sq + 'B' + sq + ')" ALT="Task/Deliverables of the Operations Analysis phase" COORDS="305,34,370,34,370,10,305,10,305,34">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + '*' + sq + ',' + sq + 'A' + sq + ')" ALT="Task/Deliverables of the Definition phase" COORDS="240,34,301,34,301,10,240,10,240,34">\n';

	s += '<!*******Processes*********>\n';
	s += '<AREA SHAPE="POLYGON"  HREF="javascript:top.processPage(' + sq + 'PM' + sq + ',' + sq + '*' + sq + ')" ALT="Access All PM Deliverables" COORDS="8,254,190,254,190,242,8,242,8,254">\n';
	s += '        <AREA SHAPE="POLYGON"  HREF="javascript:top.processPage(' + sq + 'AP' + sq + ',' + sq + '*' + sq + ')" ALT="Access All AP Deliverables" COORDS="8,235,190,235,190,223,8,223,8,235">\n';
	s += '        <AREA SHAPE="POLYGON"  HREF="javascript:top.processPage(' + sq + 'PT' + sq + ',' + sq + '*' + sq + ')" ALT="Access All PT Deliverables" COORDS="8,217,190,217,190,205,8,205,8,217">\n';
	s += '        <AREA SHAPE="POLYGON"  HREF="javascript:top.processPage(' + sq + 'TE' + sq + ',' + sq + '*' + sq + ')" ALT="Access All TE Deliverables" COORDS="8,199,190,199,190,187,8,187,8,199">\n';
	s += '        <AREA SHAPE="POLYGON"  HREF="javascript:top.processPage(' + sq + 'DO' + sq + ',' + sq + '*' + sq + ')" ALT="Access All DO Deliverables" COORDS="8,181,190,181,190,169,8,169,8,181">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'CV' + sq + ',' + sq + '*' + sq + ')" ALT="Access All CV Deliverables" COORDS="8,163,190,163,190,151,8,151,8,163">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'MD' + sq + ',' + sq + '*' + sq + ')" ALT="Access All MD Deliverables" COORDS="8,145,190,145,190,133,8,133,8,145">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TA' + sq + ',' + sq + '*' + sq + ')" ALT="Access All TA Deliverables" COORDS="8,127,206,127,206,115,8,115,8,127">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'BR' + sq + ',' + sq + '*' + sq + ')" ALT="Access All BR Deliverables" COORDS="8,109,190,109,190,97,8,97,8,109">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'RD' + sq + ',' + sq + '*' + sq + ')" ALT="Access All RD Deliverables" COORDS="8,90,190,90,190,78,8,78,8,90">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'BP' + sq + ',' + sq + '*' + sq + ')" ALT="Access All BP Deliverables" COORDS="8,74,190,74,190,62,8,62,8,74">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PJM' + sq + ',' + sq + '*' + sq + ')" ALT="Access All PJM Deliverables" COORDS="8,56,190,56,190,44,8,44,8,56">\n';

	s += '<!********Intersection Points***********>\n';
	s += '<AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TE' + sq + ',' + sq + 'D' + sq + ')" ALT="Deliverables for TE in the BUILD phase" COORDS="445,200,503,200,503,190,445,190,445,200">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'DO' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for DO in the OPERATIONS ANALYSIS phase" COORDS="329,181,341,181,341,171,329,171,329,181">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PT' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for PT in the DEFINITION phase" COORDS="329,218,341,218,341,208,329,208,329,218">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'AP' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for AP in the DEFINITION phase" COORDS="241,236,299,236,299,225,241,225,241,236">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TE' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for TE in the DEFINITION phase" COORDS="243,200,250,200,250,190,243,190,243,200">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'BP' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for BP in the DEFINITION phase" COORDS="243,73,291,73,291,62,243,62,243,73">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'BP' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for BP in the OPERATIONS ANALYSIS phase" COORDS="309,73,317,73,317,62,309,62,309,73">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'AP' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for AP in the OPERATIONS ANALYSIS phase" COORDS="329,236,337,236,337,225,329,225,329,236">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TE' + sq + ',' + sq + 'E' + sq + ')" ALT="Deliverables for TE in the TRANSITION phase" COORDS="543,200,551,200,551,190,543,190,543,200">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'CV' + sq + ',' + sq + 'D' + sq + ')" ALT="Deliverables for CV in the BUILD phase" COORDS="445,163,481,163,481,152,445,152,445,163">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'MD' + sq + ',' + sq + 'D' + sq + ')" ALT="Deliverables for MD in the BUILD phase" COORDS="445,146,481,146,481,135,445,135,445,146">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'RD' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for RD in the DEFINITION phase" COORDS="252,91,264,91,264,80,252,80,252,91">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TA' + sq + ',' + sq + 'C' + sq + ')" ALT="Deliverables for DO in the SOLUTION DESIGN phase" COORDS="383,127,391,127,391,116,383,116,383,127">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TA' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for TA in the OPERATIONS ANALYSIS phase" COORDS="320,127,356,127,356,116,320,116,320,127">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PT' + sq + ',' + sq + 'C' + sq + ')" ALT="Deliverables for PT in the SOLUTION DESIGN phase" COORDS="383,218,419,218,419,208,383,208,383,218">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'AP' + sq + ',' + sq + 'C' + sq + ')" ALT="Deliverables for AP in the SOLUTION DESIGN phase" COORDS="383,236,432,236,432,225,383,225,383,236">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'MD' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for MD in the OPERATIONS ANALYSIS phase" COORDS="320,146,328,146,328,135,320,135,320,146">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PJM' + sq + ',' + sq + '*' + sq + ')" ALT="Deliverables for PJM" COORDS="242,55,633,55,633,45,242,45,242,55">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'AP' + sq + ',' + sq + 'F' + sq + ')" ALT="Deliverables for AP in the PRODUCTION phase" COORDS="586,236,594,236,594,225,586,225,586,236">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'AP' + sq + ',' + sq + 'E' + sq + ')" ALT="Deliverables for AP in the TRANSITION phase" COORDS="520,236,528,236,528,225,520,225,520,236">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PM' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for PM in the OPERATIONS ANALYSIS phase" COORDS="329,254,337,254,337,244,329,244,329,254">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PT' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for PT in the	OPERATIONS SNALYSIS phase" COORDS="243,218,250,218,250,208,243,208,243,218">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'CV' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for CV in the DEFINITION phase" COORDS="243,163,250,163,250,152,243,152,243,163">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'MD' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for MD in the DEFINITION phase" COORDS="243,146,250,146,250,135,243,135,243,146">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'BP' + sq + ',' + sq + 'C' + sq + ')" ALT="Deliverables for BP in the SOLUTION DESIGN phase" COORDS="380,73,388,73,388,62,380,62,380,73">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PM' + sq + ',' + sq + 'D' + sq + ')" ALT="Deliverables for PM in the BUILD phase" COORDS="445,254,457,254,457,244,445,244,445,254">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'AP' + sq + ',' + sq + 'D' + sq + ')" ALT="Deliverables for AP in the BUILD phase" COORDS="445,236,457,236,457,225,445,225,445,236">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'BR' + sq + ',' + sq + 'C' + sq + ')" ALT="Deliverables for BR in the SOLUTION DESIGN phase" COORDS="383,109,395,109,395,98,383,98,383,109">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'CV' + sq + ',' + sq + 'E' + sq + ')" ALT="Deliverables for CV in the TRANSITION phase" COORDS="520,163,532,163,532,152,520,152,520,163">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TA' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for TA in the DEFINITION phase" COORDS="243,127,272,127,272,116,243,116,243,127">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'DO' + sq + ',' + sq + 'D' + sq + ')" ALT="Deliverables for DO in the BUILD phase" COORDS="445,181,481,181,481,171,445,171,445,181">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TE' + sq + ',' + sq + 'C' + sq + ')" ALT="Deliverables for TE in the SOLUTION DESIGN phase" COORDS="383,200,419,200,419,190,383,190,383,200">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'DO' + sq + ',' + sq + 'A' + sq + ')" ALT="Deliverables for DO in the DEFINITION phase" COORDS="243,181,272,181,272,171,243,171,243,181">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'BR' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for BR in the OPERATIONS ANALYSIS phase" COORDS="309,109,367,109,367,98,309,98,309,109">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PT' + sq + ',' + sq + 'D' + sq + ')" ALT="Deliverables for PT in the BUILD phase" COORDS="445,218,503,218,503,208,445,208,445,218">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'TA' + sq + ',' + sq + 'D' + sq + ')" ALT="Deliverables for TA in the BUILD phase" COORDS="445,127,503,127,503,116,445,116,445,127">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PM' + sq + ',' + sq + 'F' + sq + ')" ALT="Deliverables for PM in the PRODUCTION phase" COORDS="586,254,635,254,635,244,586,244,586,254">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'PM' + sq + ',' + sq + 'E' + sq + ')" ALT="Deliverables for PM in the TRANSITION phase" COORDS="520,254,569,254,569,244,520,244,520,254">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'CV' + sq + ',' + sq + 'C' + sq + ')" ALT="Deliverables for CV in the SOLUTION DESIGN phase" COORDS="383,163,432,163,432,152,383,152,383,163">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'MD' + sq + ',' + sq + 'C' + sq + ')" ALT="Deliverables for MD in the SOLUTION DESIGN phase" COORDS="383,146,432,146,432,135,383,135,383,146">\n';
	s += '        <AREA SHAPE="POLYGON" HREF="javascript:top.processPage(' + sq + 'RD' + sq + ',' + sq + 'B' + sq + ')" ALT="Deliverables for RD in the OPERATIONS ANALYSIS phase" COORDS="316,91,365,91,365,80,316,80,316,91">\n';

	s += '</MAP>\n';

	// end new map

	s += '<BR>\n';

	s += '<form>\n';
	s += '   <table align="CENTER" border=3 bgcolor="#222222" cellpadding=0 cellspacing=0>\n';
	s += '      <tr align=LEFT valign=TOP>\n';
	s += '         <td>\n';
	s += '            <table cellpadding=0 cellspacing=0 border=0>\n';
	s += '               <tr align=LEFT valign=CENTER>\n';
	s += '                  <td><font face=ARIAL size=-2>\n';
    s += '                     <input type="button" onclick="top.processPage(' + sq + '*' + sq + ',' + sq + '*' + sq + ')" value="Show All Tasks">\n';
    s += '                  </font></td>\n';
	s += '               </tr>\n';
	s += '            </table>\n';
	s += '         </td>\n';
	s += '      </tr>\n';
	s += '   </table>\n';
//    s += '  </table>\n';
	s += '</form>\n';
	s += '</BODY></HTML>';

    window.frames["middle-frame"].document.open("text/html");
    window.frames["middle-frame"].document.write(s);
    window.frames["middle-frame"].document.close();
    
	standardFooter(top.methodAttributes.link);

}
