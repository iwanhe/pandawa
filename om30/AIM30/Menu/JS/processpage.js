// Copyright (c) 1999, Oracle Corpration. all Rights Reserved.
//
// show the list of tasks for the choosen process and phase
// The function accepts the '*' value for either the process or phase parameters
// meaning that no filtering will be applied to process and/or phase
//
// History
// ----------------------------------------------------------------------------------------------------------
// 02-Sep-1999		Jim Lange		- Changed toggleFilter to use setCookie function.
// 08-Sep-1999		Jim Lange		- Do not insert "menu/ome" in file path (now handled during parsing)
// 16-Sep-1999		Jim Lange		- Disabled progressive loading of page to prevent Netscape crash if
//									  user tries to select a task before the page is finished building.
// ==========================================================================================================

// Global variables

var searchArray;					// array of words from Find text box
var cachedRow;						// holds HTML fragments for fast repaint
var cachedHeader1;					// holds header HTML for fast redisplay
var cachedHeader2;					// holds table title row for fast redisplay
var numAddinTypeCols;				// number of addin type columns to reserve
var innerTableWidth;				// width of table containing task details

// Define column width constants and variables
var TYPE_WIDTH = 20;				// width of task type column
var ID_WIDTH = 40;					// width of task ID column
var taskColWidth;					// set dynamically
var SPC_WIDTH = 15					// spacer column
var ICON_WIDTH = 32					// width of template type icon column
var FILTER_WIDTH  = 24;				// dimensions should correspond to ball & line graphic size
var FILTER_HEIGHT = 26;

function processPage(process, phase)
{
	var s = "";										// string to hold output page
	var linkArray = new Array();					// pointer to array of links to pass to standardFooter() function

	//
	// select appropriate context-sensitive links
	//
	if (phase == "*" && process == "*") {			// all tasks
		linkArray = top.methodAttributes.link;
	}
	else if (process != "*") {						// a specific process
		linkArray = top.processes[process].link;	
	}
	else if (phase != "*") {						// a specific phase
		linkArray = top.phases[phase].link;
	}

	//
	// If the current output page is alread saved, display it
	//
	if (top.taskListCache.length > 0) {
		window.frames["middle-frame"].document.open("text/html");
		for (var i = 0; i < top.taskListCache.length; i++) {
			window.frames["middle-frame"].document.write(top.taskListCache[i]);		// progressive build "looks" faster
			window.status = "Building task display (" + Math.round(i / top.taskListCache.length * 100) + "%)";
		}
		window.frames["middle-frame"].document.close();

		standardFooter(linkArray);

		return;
	}

	//---------------------------------
	// No Cache, build and display page
	//---------------------------------

	cachedHeader1 = "";								// clear header caches
	cachedHeader2 = "";
	cachedRow = new Array();						// clear row cache
	for (var i = 0; i < top.mergedAddin.length; i++) {
		cachedRow[i] = "";
	}

	// 
	// Get search text and convert it into an array
	//
	var searchString = "";
	var noNoSeparator = new Array("'", '"', ",");
	searchArray = new Array();
	
	searchString = String(window.frames["header"].document.forms[3].whatToFind.value).toUpperCase();

	for (var i = 0; i < noNoSeparator.length; i++) {
	  if (searchString.indexOf(noNoSeparator[i]) > -1) {
		 alert("The Find feature does not support double or single quotes\nPlease Enter your search word separated with spaces.");
		 return;
	  }
	}

	searchArray = searchString.split(/\s+/);		// split on whitspace using regular expression
//methodFrm.SystemOut("search = '" + searchString + "' (" + searchArray.length + ")");
//methodFrm.dumpObject(searchArray);

	//
	// Adjust width of task column based on available space (screen size)
	//
	numAddinTypeCols = Math.max(top.activeAddinTypes.length, 3);		// reserve at least 3 columns

	var windowWidth = Math.max(750, Math.min(950, top.getWindowWidth()));	// adjust for sizes between 750-950 pixels

	innerTableWidth = windowWidth - (FILTER_WIDTH * top.filterArry.length) - 60;
	taskColWidth = innerTableWidth - (TYPE_WIDTH + ID_WIDTH + SPC_WIDTH + ICON_WIDTH + (ICON_WIDTH * numAddinTypeCols));

	//
	// Build the page header
	//
	s = '<html>\n';
	s += '<head>\n';
	s += '<meta name="copyright" content="' + copyright + '">\n';
	s += '<link rel="STYLESHEET" title="default" media="screen" href="menu/style/general.css" type="text/css">\n';
	s += '</head>\n';
	s += '<body bgcolor="#CCFFCC">\n';
	s += '<div class="navigation">\n';

	if (process + phase == "**") {
		if (searchArray.length > 0 && searchArray[0] != "") {
	  	    s += '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > Search Results\n';
		    pagePath = '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > <a href="javascript:top.processPage(' + sq + process + sq + ',' + sq + phase + sq + ')"> Search Results</a>\n';
		}
		else {
	  	    s += '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > All Tasks\n';
		    pagePath = '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > <a href="javascript:top.processPage(' + sq + process + sq + ',' + sq + phase + sq + ')"> All Tasks</a>\n';
		}
    }
	else if (process == "*" && phase != "*") {
	    s += '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > ' + top.phases[phase].description + '\n';
        pagePath = '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > <a href="javascript:top.processPage(' + sq + process + sq + ',' + sq + phase + sq + ')">' + top.phases[phase].description + '</a>\n';
    } 
	else if (phase == "*" && process != "*") {
  	    s += '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > ' + top.processes[process].description + '\n';
        pagePath = '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > <a href="javascript:top.processPage(' + sq + process + sq + ',' + sq + phase + sq + ')">' + top.processes[process].description + '</a>\n';
	} 
	else {
  	    s += '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > ' + top.phases[phase].description + "/" + top.processes[process].description + '\n';
        pagePath = '<b>Navigation</b>: <a href="javascript:top.menuPage()">Main</a> > <a href="javascript:top.processPage(' + sq + process + sq + ',' + sq + phase + sq + ')">' + top.phases[phase].description + "/" + top.processes[process].description + '</a>\n';
	}

	s += '</div>\n';
	s += '<form name="tabFilter">\n';			// TODO:  Why is this a form?
	s += '  <br><br>\n';

	cachedHeader1 = s;

	//
	// build the filter header
	//

//methodFrm.dumpObject(filterArry);

	s =  '    <table border=0 cellspacing=0 cellpadding=0>\n';
	s += '      <tr bgcolor="' + bar_bground + '">\n';
	s += '        <td align="LEFT">\n';
	s += '          <table width="' + innerTableWidth + '" border=0 cellspacing=0 cellpadding=0>\n';
	s += '            <tr>\n';
	s += '              <td width="' + TYPE_WIDTH + '" height="30"> \n';
	s += '              </td>\n';
	s += '              <td width="' + ID_WIDTH + '" height="30">&nbsp;\n';
	s += '                <div align="left"><font face="Helvetica, san-serif, Arial, verdana" color="' + bar_textcol + '" size="1"><b>Task ID</b></font></div>\n';
	s += '				</td>\n';
	s += '              <td align="LEFT">\n';
	s += '              <table width="'+taskColWidth+'" height=30 cellspacing=0 cellpadding=0 border=0>\n';
    s += '                  <tr>\n';
	s += '                     <td>\n';
	s += '                         <font face="Helvetica, san-serif, Arial, verdana" color="' + bar_textcol + '" size="1">';

	if (process == "*" && phase != "*") {
	   s += 'Process\n';
	} 
	else if (process != "*" && phase=="*") {
	   s += 'Phase\n';
	} 
	else {
	   s += 'Phase / Process \n';
	}
	s += '                       </font>\n';
	s += '                    </td>\n';
	s += '                  </tr>\n';
	s += '                  <tr>\n';
	s += '                     <td>\n';
	s += '                       <font face="Helvetica, san-serif, Arial, verdana" color="' + bar_textcol + '" size="1">\n'; 
	s += '&nbsp;&nbsp;Task Name\n';
	s += '                       </font>\n';
	s += '                     </td>\n';
	s += '                  </tr>\n';
	s += '               </table>\n';
	s += '               </td>\n';

	s += '              <th width="' + SPC_WIDTH + '" height="30">&nbsp;</th>\n';
	s += '              <th width="' + ICON_WIDTH + '" height="30">&nbsp;</th>\n';
	for (var i = 0; i < numAddinTypeCols; i++) {
		s += '              <th width="' + ICON_WIDTH + '" height="30">&nbsp;</th>\n';
	}
	s += '            </tr>\n';
    s += '          </table>\n';
	s += '        </td>\n';

	for (var i = 0; i <top.filterArry.length; i++) {
	   s += '     <th width="' + FILTER_WIDTH + '" height="30" >&nbsp;</th>\n';
	}
	s += '     </tr>\n'
	s += '   </table>\n';			// closing the table here introduces a gap?

	cachedHeader2 = s;				// save this part of output string
	refreshPage(process, phase);	// paint the header + task content
	standardFooter(linkArray);		// display the footer
}

//=====================================================================
function refreshPage(process, phase) {
// display task list (quick refresh after filter change)

	var s = "";
	taskListCache = new Array();					// clear page cache

	if (document.layers) {							// deal with slight browser differences
		var initX = innerTableWidth;
		var initY = 25;
	}
	else {
		var initX = innerTableWidth - 5;
		var initY = 30;
	}
	var incX =   FILTER_WIDTH;

	for (var i = 0; i < filterArry.length; i++) { 
		// NOTE:  The DIV element with CSS-P style positioning is generally cross-browser
		//		  compatible, but seems to cause unexplained lockups on this page in Netscape, 
		//		  so layers are used in Netscape instead.

		if (document.layers) {		// Netscape
			s += '	<layer id="Layer' + i + '" width="48" height="96" z-index="1" left="' + initX + '" top="' + initY + '">';
		}
		else {
			s += '  <DIV ID="Layer' + i + '" STYLE="position:absolute; width:48; height:96; z-index:1; left:' + initX + 'px; top:' + initY + 'px; visibility:visible">\n';
		}

	    if (filterArry[i].status == true) {
           s += '<img border=0 src="' + filterArry[i].act_icon + '"';
	    } else {
           s += '<img border=0 src="' + filterArry[i].inact_icon + '"';
	    }
	    s += ' width="45" height="96" border="0" alt="'+filterArry[i].text+'" name="filter_' + i + '" usemap="#filter_map' + i + '">';

		if (document.layers) {		// Netscape
			s += '  </layer>\n';
		}
		else {
			s += '  </DIV>\n';
		}
		//
	    // create map definition
	    //
	    s += '  <map name="filter_map' + i + '">\n';
		s += '     <area shape="poly" coords="0,0,18,0,47,100,27,100,0,0" href="javascript:top.toggleFilter(' + i + ', ' + sq + process + sq + ', ' + sq + phase + sq + ')">\n';
		s += '  </map>\n';
	    initX += incX;		// shift position of next label
	}

	window.frames["middle-frame"].document.open("text/html");
    window.frames["middle-frame"].document.write(cachedHeader1 + s + cachedHeader2);		// display header and criteria labels

	taskListCache[taskListCache.length] = cachedHeader1 + s + cachedHeader2;		// save output string for fast repaint when returning from task detail

    phase_name = " ";		// force break on first task
	process_name = " ";
	s = '<table border=0 cellspacing=0 cellpadding=0>\n';
	
	//
	// prepare the list to be displayed 
	//
	alternateColor = false;

// methodFrm.SystemOut("Number of merged tasks is : " + top.mergedAddin.length);

	var c = 0;		// counter for displayed tasks

	for (var i = 0; i < top.mergedAddin.length; i++) {

		if (siftTask(top.mergedAddin[i], phase, process) == true) {
			s += taskDetail(i, top.mergedAddin[i], phase, process);
			c++;

			if (c % 10 == 0)	// flush output to screen every 10 tasks loaded
			{
// NOTE: Changed to disable progressive loading to prevent Netscape crash if
//		 user tries to follow a link while the page is building.
//				s += '</table>\n<table border=0 cellspacing=0 cellpadding=0>\n';		// close table and start a new one
				window.frames["middle-frame"].document.write(s);
				taskListCache[taskListCache.length] = s;		// save output string for fast repaint when returning from task detail
				s = "";

			}
		}

		if (i % 10 == 0) {		// update progress indicator every 10 tasks checked
			window.status = "Building task display (" + Math.round(i / top.mergedAddin.length * 100) + "%)";
		}
	}

	s += '</table>';
	s += '</form>';

	if (c == 0) {			// no matching tasks found
		s += '<div class="navigation"><br><b>No tasks match selected criteria</b></div>\n';
	}

	s += '</body>\n';
	s += '</html>\n';
	
    window.frames["middle-frame"].document.write(s);
    window.frames["middle-frame"].document.close();

	taskListCache[taskListCache.length] = s;		// save output string for fast repaint when returning from task detail

	window.status = "";				// clear status line
}

//=====================================================================
function siftTask(task, phase, process) {
	var processOK;
	var phaseOK;
	var filterOK = false;
	var searchOK = true;

	processOK = (process == "*") || (task.process == process);
	phaseOK = (phase == "*") || (task.phase == phase);

	if (processOK && phaseOK) {				// don't waste time with other comparisons if these fail
		if (top.searchArray.length > 0 && top.searchArray[0] != "") {	// if there is something to search for
			searchOK = search(task);
		}

		// 
		// if all the filters citeria for this task have been disabled, don't display the row
		//
		// TODO: Convert this to use binary mask compare

		for (var i = 0; i < task.filter.length; i++) {
			if (top.filters[task.filter[i].name].status == true) {	
				filterOK = true;
				break;
			}
		}
	}
//methodFrm.SystemOut(task.taskid + ": " + processOK + phaseOK + searchOK + filterOK);

	return(filterOK && processOK && phaseOK && searchOK);
}

//=====================================================================
function search(t){  
// t is the task object
// returns true if task matches search attributes

	var attrString = String(t.name + "|" + t.taskid + "|" + t.deliverable + "|" + t.description).toUpperCase();

	var allWordsFound = true;
	for (var i = 0; i < top.searchArray.length; i++) {
		allWordsFound = (allWordsFound && (attrString.indexOf(top.searchArray[i]) >= 0));		
	}

	return allWordsFound;
}

//=====================================================================
function taskDetail(idx, t, phase, process) {
	var s = "";
	var displayText = "";		// text for process/phase row
	var detl = "";				// output content returned as function result
	var templateIcon = "";		// name of template icon

	//
	// Determine if process and/or phase has changed
	//
	if ((process == "*") && (phase != "*")) { // show all the processes for a phase, break for process
		if (t.process != process_name) {
			process_name = t.process;

			displayText = String(top.processes[process_name].description).bold();
	   }
	} else if (((phase == "*") && (process != "*")) || ((phase != "*") && (process != "*")))  { // show all tasks for a process : break for phase
		if (t.phase != phase_name ) {
			phase_name = t.phase;

			displayText = String(top.phases[phase_name].description).bold();
	   }
	} else if ((phase == "*") && (process == "*"))  { // show all tasks case : break for phase or process
		if ((t.phase != phase_name) || (t.process != process_name)) {
			phase_name = t.phase;
			process_name = t.process

			displayText = String(top.phases[phase_name].description).bold() + ' / ' + String(top.processes[process_name].description).italics();
	   }
	}

	if (displayText != "") {
		//
		// build Process/Phase row
		//

		detl += '      <tr>\n';
		detl += '        <td>\n';
		detl += '          <table width="' + innerTableWidth + '" border=0 cellspacing=0 cellpadding=0>\n';
		detl += '            <tr>\n';
		detl += '              <td width="' + TYPE_WIDTH + '" height="24">&nbsp;</td>\n';
		detl += '              <td width="' + ID_WIDTH + '" height="24">&nbsp;</td>\n';
		detl += '              <td width="'+taskColWidth+'" height="24" nowrap>'
								+ '<font face="Helvetica, Arial" size="1" color=#990000>'
								+ displayText + '</font></td>\n';
		detl += '              <td width="' + SPC_WIDTH + '" height="24">&nbsp;</td>\n'; // for spacing
		detl += '              <td width="' + ICON_WIDTH + '" height="24">&nbsp;</td>\n'; // for template type

		// create the addin-type columns

		for (var i = 0; i < numAddinTypeCols; i++) {
			detl += '              <td width="' + ICON_WIDTH + '" height="24">&nbsp;</td>\n';
		}
		detl += '            </tr>\n';
		detl += '          </table>\n';
		detl += '        </td>\n';

		// create criteria indicators (lines only)

		for (var j = 0; j < filterArry.length; j++) {
			if (filterArry[j].status == true) {
				detl += '        <td width="' + FILTER_WIDTH + '" height="26"><img border=0 width="' + FILTER_WIDTH + '" height="' + FILTER_HEIGHT + '" src="' + top.filterArry[j].empty_icon + '" ></td>\n';					
			} 
			else {
				detl += '        <td width="' + FILTER_WIDTH + '" height="26"><img border=0 width="' + FILTER_WIDTH + '" height="' + FILTER_HEIGHT + '" src="menu/images/gray0.gif" ></td>\n';
			}   
		}
		detl += '      </tr>\n';
	}	// end of phase/process name row

	//------------------------------------
	// Build task row
	//------------------------------------

	if (alternateColor == true) {
	   detl += '      <tr  bgcolor="#E6E6E6"> \n';
	   alternateColor = false;
	} else {
	   detl += '      <tr>\n';
	   alternateColor = true;
	}

	if (cachedRow[idx] != "") {				// if row is cached, use it
		detl += cachedRow[idx];
	}
	else {									// build it
		s += '          <td>\n';
		s += '             <table width="' + innerTableWidth + '" border=0 cellspacing=0 cellpadding=0>\n';
		s += '               <tr valign=top>\n';
		s += '	              <td width="' + TYPE_WIDTH + '" height="24">\n';
		s += '                     <img border=0 src="menu/images/' + t.template[0].tpid + '.gif" width="15" height="16">\n';
		s += '                 </td>\n';
		s += '                 <td width="' + ID_WIDTH + '" height="24" valign=top>\n';
		s += '                   <div align="left"><font face="Helvetica, san-serif, Arial, verdana" size="1">'
			+ '<a href="javascript:top.templatePage(' + idx + ')" >' + t.taskid + '</a></font></div>\n';
		s += '                 </td>\n';
		s += '                 <td width="'+taskColWidth+'" height="24"><font face="Helvetica, san-serif, Arial, verdana" size="1"><a href="javascript:top.templatePage(' + idx + ')" >' + t.name + '</a></font></td>\n';
		s += '                 <td width=15 height="24">&nbsp;</td>\n';

		//
		// insert template type icon
		//
		if (t.template.length == 0 || t.template[0].type == "") {
			templateIcon = "notemp.gif";
		}
		else {
			templateIcon = t.template[0].type + ".gif";

			// determine if multiple template types are included
			for (var i = 1; i < t.template.length; i++) {		// compare 2nd and beyond templates with 1st
				if (t.template[i].type != t.template[0].type) {
					templateIcon = "multi.gif";
					break;
				}
			}
		}

		if (templateIcon == "notemp.gif" || templateIcon.toLowerCase() == "note.gif") {
			s += '        <td width="' + ICON_WIDTH + '" height="24">'
				+ '<a href="javascript:top.templatePage(' + idx + ')" >'
				+ '<img src="menu/images/'
				+ templateIcon + '" border=0 width="15" height="16" alt="'
			if (templateIcon == "notemp.gif") {
				s += 'No Template"></td>\n';
			}
			else {
				s += 'Note"></td>\n';
			}
		}
		else if (t.template.length > 1 ) {	// link to template list page
			s += '        <td width="' + ICON_WIDTH + '" height="24">'
				+ '<a href="javascript:top.templatePage(' + idx + ')" >'
				+ '<img src="menu/images/'
				+ templateIcon + '" border=0 width="13" height="16" alt="'
				+ t.template[0].description + ' ('+t.template[0].type+')"></td>\n';
		} 
		else {							// only one real template, link directly to document
			s += '        <td width="' + ICON_WIDTH + '" height="24"><a href="' 
				+ top.methodAddinArry[t.template[0].addin_idx].base_path + "/"
				+ t.template[0].file 
				+ '"><img src="menu/images/'
				+ templateIcon + '" border="0" width="15" height="16" alt="';
			if (templateIcon == "notemp.gif") {
				s += 'No Template"></td>\n';
			}
			else {
				s += t.template[0].description + ' ('+t.template[0].type+')"></td>\n';
			}
		}

		//
		// build columns for addin types active in this task
		//
		var taskAddinTypes = "";						// temporary list of addins for this task
		var numAddins = 0;

		for (var i=0; i < t.template.length; i++) {		// build string list of addin types
			taskAddinTypes += t.template[i].addinType + "|";
		}

		for (var i = 0; i < top.activeAddinTypes.length; i++) {	// for each active type (and display column)
			if (taskAddinTypes.indexOf(top.activeAddinTypes[i].name) >= 0) {	// task includes active type
				s += '                  <td width="' + ICON_WIDTH + '" height="24"><img border=0 src="' + top.activeAddinTypes[i].icon + '" width="16" height="16" alt="'+ top.activeAddinTypes[i].description + '"></td>\n';
			}
			else{
				s += '                  <td width="32">&nbsp;</td>\n';
			}
		}
		// build blank filler columns
		for (var i = top.activeAddinTypes.length; i < numAddinTypeCols; i++) {
			s += '                  <td width="' + ICON_WIDTH + '">&nbsp;</td>\n';		
		}

		s += '           </tr>\n';
		s += '        </table>\n';
		s += '      </td>\n';

		cachedRow[idx] = s;					// save this HTML for refreshes
		detl += s;							// add to task detail
	}

	//
	// Build criteria indicators (balls and lines)
	//
	// TODO:  Use binary mask
	var fflag = new Array();

	fnum = top.filterArry.length;
	for (var j = 0; j < fnum; j++) {				// for each criteria
		fflag[j] = false;
		for (var k = 0; k < t.filter.length; k++) {
			if (t.filter[k].name == top.filterArry[j].name) {
				fflag[j] = true;						// this task is included in criteria
				break;
			}
		}

		detl += '        <td width="' + FILTER_WIDTH + '" height="26"><img border=0 width="' + FILTER_WIDTH + '" height="' + FILTER_HEIGHT + '" src="';

		if (fflag[j] == true) {
			if (top.filterArry[j].status == true) {
				detl += top.filterArry[j].full_icon;
			} 
			else {
				detl += 'menu/images/gray1.gif';
			}
			detl += '" alt="' + filterArry[j].description;
		} 
		else {
			if (top.filterArry[j].status == true) {
				detl += top.filterArry[j].empty_icon;
			} 
			else {
				detl += 'menu/images/gray0.gif';
			}
		}
		detl += '"></td>\n';
	}	    
	detl += '      </tr>\n';

	return detl;
}

//=====================================================================
function toggleFilter(idx, process, phase) {
//
// Contains the logic to switch the filter-criteria on or off
//
	var img;

   //
   // toggle selected filter value
   //
   top.filterArry[idx].status = !top.filterArry[idx].status;
   //
   // change image
   //
   if (document.all) {					// IE4
		img = window.frames["middle-frame"].document.images["filter_" + idx];
   }
   else {								// NN4
		img = eval('window.frames["middle-frame"].document.Layer' + idx + '.document.images[0]');
   }

   if (top.filterArry[idx].status == true) {
      img.src = top.filterArry[idx].act_icon;
   } else {
      img.src = top.filterArry[idx].inact_icon;
   }
   //
   // Prepare the new string to store into the cookie
   //
   var s = new String();
   for (var i = 0; i < filterArry.length; i++) {
      if (filterArry[i].status == true) {
		    s += filterArry[i].name + "|";  
	  }  
   }
   //top.methodFrm.SystemOut("Debug % Filter Cookie String -> " + s);
   //
   // update and store the filter cookie
   //
   s = '<filters>' + " " + s + '</filters>';
   top.setCookie("filters", s);
   //
   // redisplay the process page
   //
   
   refreshPage(process, phase);			// NOTE: this uses teh cached header and row data
}
