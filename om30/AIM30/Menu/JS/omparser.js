// 
// Thin Engine - AGSL Oracle Method and Tools
// 
// Copyright (c) 1999, Oracle Corporation. all Rights Reserved.
//
// History
// ----------------------------------------------------------------------------------------------------------
// 27-Dec-1998				Maurizio Papini		- Start Coding
// June 1999				Maurizio Papini		- Spit into multiple source files 
// July-Aug 1999			Jim Lange			- Multiple Changes
// 02-Sep-1999				Jim Lange			- Fix deactivated filter problem when cookies not set
// 07-Sep-1999				Jim Lange			- Activate all BASE add-ins by default if cookie is not set
//												- Change add-in reference in link object to add-in name (not index)
// 08-Sep-1999				Jim Lange			- Create new add-in types dynamically if not in known list
// 14-Sep-1999				Jim Lange			- Remove sort of tasks; assume tasks are already sorted in XML
// 15-Sep-1999				Jim Lange			- Put sort back in
// 23-Sep-1999				Jim Lange			- In refreshAddins(), rebuild actAddinArry
//												- Supress duplicate links at main, process, and phases level
//												- Fix missing priorities after refreshing add-ins
//												- Store add-in name as uppercase only
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function systemData() {
   this.drive         = new String();
   this.correctedPath = new String();
   this.codeBase      = new String();
}

function availType() {					// TODO: does not appear to be used
	this.name         = new String();
	this.description  = new String();
	this.iconPath     = new String();
}

function addin_type() {
	this.name              = new String();
	this.description       = new String();
	this.icon              = new String();
}

function methodData() {
	this.name              = new String();
	this.description       = new String();
	this.version           = new String();
	this.updateServer      = new String();
	this.updatePort        = new String();
	this.updateSiteName    = new String();
	this.updateURL         = new String();
	this.link			   = new Array();		// new
}

function addin() {
	this.base_addin        = new String(); 
	this.required_addin    = new String(); 
	this.name              = new String(); 
	this.description       = new String();
	this.type              = new String();
	this.version           = new String();
	this.apps_release      = new String();
	this.language          = new String();
	this.geography         = new String();
	this.ffw_type          = new String();
	this.industry_seg      = new String();
	this.industry_prod     = new String();
	this.industry_prod_rel = new String();
	this.publisher         = new String();
	this.base_path         = new String();
	this.priority          = new String();
	this.omafile           = new String();
	this.omxfile		   = new String();		// new
	this.type_idx;
	this.phases_translated = new Array();
	this.processes_translated = new Array();
	this.tmpPriority       = new String();
}

function filter_criteria() {
	this.name           = new String(); 
	this.description    = new String();
	this.text		    = new String();
	this.empty_icon     = new String();
	this.full_icon      = new String();
	this.act_icon		= new String();
	this.inact_icon		= new String();
	this.status			= new String(); // status is set accordingly to the cookie 
}

function filter_color() {
	this.empty_icon = new String();
	this.full_icon = new String();
}

function method_phase() {
	this.name				= new String(); 
	this.description		= new String();
	this.seq				= 0;
	this.link				= new Array();
}

function method_process() {
	this.name				= new String();
	this.description		= new String();
	this.seq				= 0;
	this.link				= new Array();
}
//function process() {
//	this.name = new String();
//	this.description = new String();
//}

function link() {
	this.icon		= new String();
	this.name		= new String();
	this.url		= new String();
	this.text		= new String();
	this.addin		= new String();		// new
}

function addin_priority() {
   this.idx      = new String();
   this.priority = new String();
}

function task() {
	this.addin				= new String();		// obsolete
	this.addinType			= new String();		// obsolete
	this.tpid				= new String();		// new
	this.taskid				= new String(); 
	this.name				= new String(); 
	this.phase				= new String(); 
	this.process			= new String(); 
	this.deliverable		= new String(); 
	this.filter				= new Array();
	this.template			= new Array();
	this.process_idx		= new String();
	this.addin_idx			= new String();		// obsolete
	this.sort_id			= new String();
	this.filterMask			= 0;					// binary mask of filter membership
	this.link				= new Array();
}

function template() {
	this.file              = new String(); 
	this.description       = new String(); 
	this.name              = new String(); 
	this.type              = new String();
	this.state			   = new String();
	this.note			   = new String();
	this.tpid			   = new String();		// obsolete
	this.addin             = new String();		// new
	this.addinType         = new String();		// new
	this.addin_idx         = new String();		// new (not used)
	this.link              = new Array();
}

function filter() {
	this.name              = new String(); 
}

var statusMsg = "";			// message to display in status line

//================================================================================================
function getXML(waitMsg) {
// Description: Read XML files and load selected add-in data into javascript data structures 
//				(arrays of objects)
//
// Arguments:	waitMsg		Message to display during execution (passed to waitScreen
//
// Called by:	om30\aim30parser.html
//				addinpage.js:closeAddin()

// NOTE: This is the first javascript function called when the OM engine is started

	// make sure we are running inside a frameset
	if (window.parent == window.self) {							// not running in a frame
		alert("Please start method by selecting it from your Windows Start menu.");
		return;
	}

	if (waitMsg != "") {
		top.waitScreen(waitMsg);	// Note: In IE, the screen does not update
	}

	top.methodFrm = this;			//  capture a reference to this page

	//
	// identify system parameters
	//
	var loc = top.location.href;	// Retrieve location of frameset document
									// NOTE: the java parser applet and this code is located in the method.html
									// file that is located in the OM30 (parent) directory so that java can access
									// the shared PJM installation, however, for the purposes of constructing
									// file paths, this directory is what we want.

	while (loc != "" && loc.charAt(loc.length-1) != "/" && loc.charAt(loc.length-1) != "\\") {	// while the last character is not a slash
		loc = loc.substr(0,loc.length-1);		// remove last character
	}

	top.sys          = new systemData();
//	top.sys.codeBase = unescape(document.theParser.thisAppletCodeBase());
	top.sys.codeBase = loc;
	vbarPosition = top.sys.codeBase.indexOf("|");
	if (vbarPosition >= 0) {
		top.sys.drive = top.sys.codeBase.substr(vbarPosition - 1, 1);
		top.sys.correctedPath = top.sys.drive + ":" + top.sys.codeBase.substr(vbarPosition + 1);
	}
	else {
		top.sys.correctedPath = top.sys.codeBase.substr(top.sys.codeBase.lastIndexOf(":") -1);
		top.sys.drive = top.sys.correctedPath.substr(0,1);
	}

dumpObject(top.sys);

	var linkList;
	var addinc = "";				// add-in cookie
	var priorityc = "";				// priority cookie
	var methodFile = top.sys.codeBase + "menu/xml/method.xml";

	window.status = "Parsing method information...";
//systemOut("Getting ready to call parser");
	document.theParser.parse(methodFile);			// call the Java parser
//systemOut("Parser call succeeded");

	window.status = "Loading Method Information...";
	loadMethodProcesses();
	loadAddinTypes();
	loadAddinEntities();
	loadFilterCriteria();
	loadMethodPhases();
	activateFilters();
	loadMethodAttributes();

//SystemOut("Dump of phases object:");
//dumpObject(top.phases);
//SystemOut("Dump of processes object:");
//dumpObject(top.processes);

	// load the addinTask data Structure (as many addin as specified by the user)

	top.addinArry = new Array();		// an array of task arrays
	top.actAddinArry = new Array();		// array of active add-in indexes (1-n)
	count = 0;
	addinc = top.getCookie("addins");
	priorityc = top.getCookie("priority");
SystemOut("GetXML: Addin cookie = " + addinc);
SystemOut("GetXML: Priority cookie = " + priorityc);

	var arry = addinc.split("|");			// list of activated addins
	var parry = priorityc.split("|");
	var addinpri = new Object;			// associative array for priority lookup

	for (var i = 0; i < parry.length; i++) {
		if (parry[i] != "") {
			var prio = parry[i].split("#");		// split priority into its component parts
			addinpri[prio[1]] = prio[0];	// store number indexed by name
		}
	}
dumpObject(addinpri);

	// validate cookies against installed addins (which may change) and rebuild cookie
	addinc = "";
	priorityc = "";
	for (var i = 0; i < arry.length; i++) {
		if (top.addins[arry[i]]) {			// cookie entry is valid
			addinc += arry[i] + "|";
			priorityc += addinpri[arry[i]] + "#" + arry[i] + "|";

			// set priority in addins array (which also set it in methodAddinArry)
			top.addins[arry[i]].priority = Number(addinpri[arry[i]]);
		}
	}
	addinpri = null;					// free memory for this temporary object

	// if new add-in list is blank, default to BASE addins
	var p = 1;							// priority counter
	if (addinc == "") {					// blank
		// activate any addins of BASE type
		for (var i= 0; i< top.methodAddinArry.length; i++) {
			if (top.methodAddinArry[i].type == "BASE") {
				addinc += top.methodAddinArry[i].name + "|";
				priorityc += p + "#" + top.methodAddinArry[i].name + "|";
				top.methodAddinArry[i].priority = p;
				p++;
			}
		}
	}

	top.setCookie("addins", addinc);
	top.setCookie("priority", priorityc);
SystemOut("GetXML: Validated Addin cookie = " + addinc);
SystemOut("GetXML: Validated Priority cookie = " + priorityc);

	arry = addinc.split("|");				// re-split

	top.activeAddinTypes = new Array();

	//
	// Load add-ins that user has selected
	for (var i= 0; i< top.methodAddinArry.length; i++) {
		for (var j = 0; j < arry.length; j++) {
			if (arry[j] == String(top.methodAddinArry[i].name)) {
				statusMsg = "Loading " + arry[j] + " add-in...";
				window.status = statusMsg;

 				top.addinArry[count] = getAddinAttributes(top.sys.codeBase + top.methodAddinArry[i].base_path + "/menu/xml/" + top.methodAddinArry[i].name + ".xml", i);
SystemOut("Loaded " + arry[j] + " into addinArry[" + count + "]");
				top.actAddinArry[count++] = i;

				// check for unique addin type and add to global list
				var alreadyInList = false;
				for (var k = 0; k < top.activeAddinTypes.length; k++) {
					if (top.methodAddinArry[i].type == top.activeAddinTypes[k].name) {
						alreadyInList = true;
						break;
					}
				}
				if (alreadyInList == false && top.methodAddinArry[i].type != "BASE") {
					top.activeAddinTypes[top.activeAddinTypes.length] = top.addinType[top.methodAddinArry[i].type_idx];
//SystemOut("Active Add-in type = " + top.methodAddinArry[i].type);
				}
			}
		}
	}

//SystemOut("BEFORE SORT");
//	for (var i = 0; i < top.addinArry.length; i++) {
//		SystemOut("addinArry["+i+"] tasks:");
//		for (var j in top.addinArry[i]) {
//			SystemOut("     "+top.addinArry[i][j].taskid + "=" + top.addinArry[i][j].sort_id);
//		}	
//	}


//SystemOut("Dump of methodAddinArry object:");
//dumpObject(top.methodAddinArry);

	//
	// Add a dummy task entry to the bottom of each addin array.  This allows us to reference the
	// last entry even after we reach the bottom.
	//
	for (var i = 0; i < top.addinArry.length; i++) {
		last_index = top.addinArry[i].length;
		top.addinArry[i][last_index] = new task();
		top.addinArry[i][last_index].taskid = "dummy";
		top.addinArry[i][last_index].name = "dummy";
		top.addinArry[i][last_index].sort_id = 999999999999;		// must be higher than any other sort id
	}

	//
	// sort addins
	//

	sortAddins();

	//
	// Sort the addins by phase - this is use by the "show all tasks" & "find" - function 
	//
//    top.phase_sorted_key.sort();			// obsolete

	window.status = "";

}

//================================================================================================
function refreshAddins() {

	var methodFile = top.sys.codeBase + "menu/xml/method.xml";

	window.status = "Reading updated addins...";
	document.theParser.parse(methodFile);			// call the Java parser

	loadAddinEntities();		

	// refresh actAddinArry

	var addinc = top.getCookie("addins");
	var arry = addinc.split("|");			// list of activated addins
	var count = 0;
	for (var i= 0; i< top.methodAddinArry.length; i++) {			// for each loaded add-in
		for (var j = 0; j < arry.length; j++) {						// for each active add-in
			if (arry[j] == String(top.methodAddinArry[i].name)) {	// if active
				top.actAddinArry[count++] = i;
			}
		}
	}

	// reassign priorities
	var priorityc = top.getCookie("priority");
	var parry = priorityc.split("|");

	for (var i = 0; i < parry.length; i++) {
		if (parry[i] != "") {
			var prio = parry[i].split("#");		// split priority into its component parts
	
			// set priority in addins array (which also set it in methodAddinArry)
			if (top.addins[prio[1]]) {
				top.addins[prio[1]].priority = Number(prio[0]);
			}
		}
	}
}

//================================================================================================
function sortAddins() {
	// Sort the loaded add-ins in priority order and then merge them into a new global list.
	// This function assumes that methodAddinArry, addinArry, and actAddinArry are already loaded.
	
	var tmp, a;
	var s = new String();

	statusMsg = "Sorting Add-ins..";

	// sort the task lists in top.addinArry by sort_id
	for (var i in top.addinArry) {
		top.addinArry[i].sort(function(a, b) {return a.sort_id - b.sort_id}); 
		statusMsg += ".";			// update progress
		window.status = statusMsg;
	}

	// sort the actAddinArry array by priority

	top.addinPriority = new Array();

	for (var i= 0; i < top.actAddinArry.length; i++) {
		a = new addin_priority();
		a.idx = i;
		a.priority = top.methodAddinArry[top.actAddinArry[i]].priority;
		top.addinPriority[i] = a;
	}

	//
	// reorder actAddinArry
	//
	for (var i =0; i <top.actAddinArry.length - 1; i++) {		// for each active add-in
	  for (var j = i + 1; j < top.actAddinArry.length; j++) {		// compare with other active add-ins
		 if (top.methodAddinArry[top.actAddinArry[i]].priority > top.methodAddinArry[top.actAddinArry[j]].priority) {
			tmp = top.actAddinArry[i];
			top.actAddinArry[i] = top.actAddinArry[j];
			top.actAddinArry[j] = tmp;
		 }
	  }
	}

	//
	// adjust priority numbers ... (from 1 to n ... )
	// save new priorities in a cookie
	// (this is useful if gaps develop in the priority sequence)
	//
	for (var i = 0; i < top.actAddinArry.length; i++) {
      if (i < 9) {
         top.methodAddinArry[top.actAddinArry[i]].priority = i + 1;
      } else {
         top.methodAddinArry[top.actAddinArry[i]].priority = 9;
	  }
      s += top.methodAddinArry[top.actAddinArry[i]].priority + "#" + top.methodAddinArry[top.actAddinArry[i]].name;
	  if (i < top.actAddinArry.length - 1) {
	     s += "|"; // separator
	  }
	}

	top.maxActivePriority = top.actAddinArry.length;

	top.setCookie("priority", s);
SystemOut("SortAddins: Saving resequenced Priority Cookie = " + s);

	//
	// If the top priority add-in has phase and/or processes defined, use them instead
	//

	var firstAddin = top.methodAddinArry[top.actAddinArry[0]];
SystemOut("Highest priority add-in = " + firstAddin.name + " (" + top.actAddinArry[0] + ")");

	if (firstAddin.phases_translated.length > 0) {
		for (var i = 0; i < firstAddin.phases_translated.length; i++ ) {
			if (firstAddin.phases_translated[i].description != "") {
				top.phases[firstAddin.phases_translated[i].name].description = firstAddin.phases_translated[i].description;
			}
		}
	}
	if (firstAddin.processes_translated.length > 0) {
		for (var i = 0; i < firstAddin.processes_translated.length; i++ ) {
			if (firstAddin.processes_translated[i].description != "") {
//SystemOut("translated process = " + firstAddin.processes_translated[i].name +": "+ firstAddin.processes_translated[i].description);

				top.processes[firstAddin.processes_translated[i].name].description = firstAddin.processes_translated[i].description;
			}
		}
	}

	//
	// Merge method, phase, and process-level links from active add-ins
	//
	var found_it;

	for (var i = 0; i < top.actAddinArry.length; i++) {
		var thisAddin = top.methodAddinArry[top.actAddinArry[i]];
//SystemOut("Dump of "+thisAddin.name);
//dumpObject(thisAddin);

		for (var j = 0; j < thisAddin.link.length; j++) {
			found_it = false;
			for (var x = 0; x < top.methodAttributes.link.length; x++ ) {
				if (thisAddin.link[j].name == top.methodAttributes.link[x].name) {
					found_it = true;
					break;
				}
			}
			if (found_it == false) {
				top.methodAttributes.link[top.methodAttributes.link.length] = thisAddin.link[j];
//				SystemOut("Added link "+thisAddin.link[j].name + " to method");
			}
		}

		// copy phase-level links (if any) for this addin
		for (var j in thisAddin.phases_translated) {
			var thisPhase = thisAddin.phases_translated[j];
			var globalPhase = top.phases[thisPhase.name];

			for (var k in thisPhase.link) {
				found_it = false;
				for (var x in globalPhase.link) {
					if (thisPhase.link[k].name == globalPhase.link[x].name) {
						found_it = true;
						break;
					}
				}
				if (found_it == false) {
					globalPhase.link[globalPhase.link.length] = thisPhase.link[k];
//					SystemOut("Added link "+thisPhase.link[k].name + " to phase " + globalPhase.name);
				}
			}
		}

		// copy process-level links (if any) for this addin
		for (var j in thisAddin.processes_translated) {
			var thisProcess = thisAddin.processes_translated[j];
			var globalProcess = top.processes[thisProcess.name];

			for (var k in thisProcess.link) {
				found_it = false;
				for (var x in globalProcess.link) {
					if (thisProcess.link[k].name == globalProcess.link[x].name) {
						found_it = true;
						break;
					}
				}
				if (found_it == false) {
					globalProcess.link[globalProcess.link.length] = thisProcess.link[k];
//					SystemOut("Adding link "+thisProcess.link[k].name + " to process " + globalProcess.name);
				}
			}
		}
	}

	// Rearrange addinArry into priority order
	for (var i = 0; i < top.addinPriority.length - 1; i++) {
		for (var j = i + 1; j < top.addinPriority.length; j++) {
			if (top.addinPriority[j].priority < top.addinPriority[i].priority) {
				var tmp = new addin_priority();
				var tmpArry = new Array();
				tmp = top.addinPriority[i];
				tmpArry = top.addinArry[i];
				top.addinPriority[i] = top.addinPriority[j];
				top.addinArry[i] = top.addinArry[j];
				top.addinPriority[j] = tmp;
				top.addinArry[j] = tmpArry;
			}
		}
	}

	//
	// start task merging
	//
	// Overview:  The best way to explain this algorithm is to imagine N stacks of cards.  each stack
	// corresponds to an addin with each card corresponding to a task.  Our goal is to create a single
	// stack of cards by drawing from the piles in task order.  Whenever we have matching task numbers, 
	// we take only the highest priority task, but merge in the templates and links from the other 
	// matching tasks.  We continue this until all stacks are empty.  The result is a single stack (array)
	// with each task represented once.
	//
	// NOTE: If tasks are not sorted in the same order in each add-in, tasks may appear twice in the 
	// final list.  This is because the algorithm only compares the tasks at the top of each stack and
	// if a task is out of order, that stack will be processes only when its next task has the lowest
	// sort id.
	//

	var pointer = new Array();				// pointer to the task at the top of each stack
	var numAddins = top.addinArry.length;

	var mergeindex = 0;						// the index of the array we are populating
	var moreTasks = true;					// becomes false when we reach the bottom of all stacks
	var lowest;								// track the lowest sort id encoutered

	top.mergedAddin = new Array();			// stores final master array of tasks

	statusMsg = "Merging Add-ins..";

	for (var i = 0; i < top.addinArry.length; i++) {
		pointer[i] = 0;						// initialize pointer to top of array
	}

	//
	// merge add-ins
	//
	while (moreTasks == true) {
		if (mergeindex % 10 == 0) {			// add a period to the status message every 10 iterations
			statusMsg += ".";				// update progress
			window.status = statusMsg;
		}

		//
		// identify the lowest sort id from each stack
		//
		lowest = Number.MAX_VALUE;				// set to artificially high value
		for (var i = 0; i < numAddins; i++) {
			lowest = Math.min(lowest, top.addinArry[i][pointer[i]].sort_id);
		}
		
		//
		// now keep the one with the highest priority (lowest index) and merge in other matching tasks
		// (ignoring tasks that don't match, we'll check those in the next loop
		//
		var first_found;
		var thistask = new task();

		first_found = false;
		for (var i = 0; i < numAddins; i++) {
			thistask = top.addinArry[i][pointer[i]];
			if (thistask.sort_id == lowest) {			// match
				if (first_found == false) {				// this is by definition the one we want
					first_found = true;
					top.mergedAddin[mergeindex] = top.copyObject(thistask);
//SystemOut(mergeindex + ": Adding " + thistask.taskid + " ["+thistask.sort_id+"]from addin " + i + " (" + pointer[i] + ": " + thistask.template.length + " templates, " + thistask.link.length + " links)");

					pointer[i]++;							// increment pointer (go to next item in stack)
				}
				else if (thistask.taskid == top.mergedAddin[mergeindex].taskid) {	// make sure this is really the same task

//SystemOut("   Merging templates and links from " + thistask.taskid + " from addin " + i + " (" + pointer[i] + ": " + thistask.template.length + " templates, " + thistask.link.length + " links)");
					// Merge templates (always a union)
					for (var x = 0; x < thistask.template.length; x++) {
//SystemOut("        Adding template " + thistask.template[x].description);
						top.mergedAddin[mergeindex].template[top.mergedAddin[mergeindex].template.length] = top.copyObject(thistask.template[x]);
					}
					// Merge links (only add those with unique names)
					for (var x = 0; x < thistask.link.length; x++ ) {
						var found_it = false;
						for (var y = 0; y < top.mergedAddin[mergeindex].link.length; y++ ) {
//SystemOut(thistask.link[x].name + "==" + top.mergedAddin[mergeindex].link[y].name + "?");
							if (thistask.link[x].name == top.mergedAddin[mergeindex].link[y].name) {
								found_it = true;
								break;
							}
						}
						if (found_it == false) {
//SystemOut("        Adding link " + thistask.link[x].name);
							top.mergedAddin[mergeindex].link[top.mergedAddin[mergeindex].link.length] = top.copyObject(thistask.link[x]);
						} // if
					} // for

// don't...			// Merge filters
//					for (f = 0; f < thistask.template.length, f++; ) {
//						top.mergedAddin[mergeindex].filter[top.mergedAddin[mergeindex].filter.length] = thistask.filter[f];
//					}

					pointer[i]++;							// increment pointer (go to next item in stack)
				}	// if found

			}	// if sort id is lowest
		}	// for each stack

		moreTasks = false;
		for (i = 0; i < numAddins; i++ ) {	// set to true if still processing any of the addins
			moreTasks = (moreTasks || (pointer[i] < top.addinArry[i].length - 1));
		}

		mergeindex++;						// increment index
   }	// while moreTasks

   top.dirtAddin = false;
   window.status = "";
}

//================================================================================================
function loadAddinEntities() {
   var s = "";
   var objList;
   var a;

   objList = document.theParser.getMethodObjList("addin");
   
   top.methodAddinArry = new Array();

   for (i = 0; i < objList.getLength(); i++) {
	  var attrList = objList.item(i).getAttributes();
	  a = new addin();
	  a.base_addin        = String(attrList.item(0).getNodeValue());
	  a.required_addin    = String(attrList.item(1).getNodeValue());
	  a.name              = String(attrList.item(2).getNodeValue()).toUpperCase();
	  a.description       = String(attrList.item(3).getNodeValue());
	  a.type              = String(attrList.item(4).getNodeValue());
	  a.version           = String(attrList.item(5).getNodeValue());
	  a.apps_release      = String(attrList.item(6).getNodeValue());
	  a.language          = String(attrList.item(7).getNodeValue());
	  a.geography         = String(attrList.item(8).getNodeValue());
	  a.ffw_type          = String(attrList.item(9).getNodeValue());
	  a.industry_seg      = String(attrList.item(10).getNodeValue());
	  a.industry_prod     = String(attrList.item(11).getNodeValue());
	  a.industry_prod_rel = String(attrList.item(12).getNodeValue());
	  a.publisher         = String(attrList.item(13).getNodeValue());
	  a.base_path         = String(attrList.item(14).getNodeValue());
	  a.omxfile			  = String(attrList.item(15).getNodeValue());		// installed add-ins only
	  a.type_idx = getAddinTypeIdx(a.type);				

	  if (a.type_idx == -1) {		// unknown add-in type, dynamically build new type
		  var atype = new addin_type();
	  	  atype.name         = a.type;
	      atype.icon         = a.base_path + "/menu/images/" + a.type + ".gif";
		  atype.description  = a.type;
		  a.type_idx         = top.addinType.length;

		  top.addinType[top.addinType.length] = atype;
	  }

	  linkList = objList.item(i).getElementsByTagName("link");
	  a.link = new Array();
	  for (var j = 0; j < linkList.getLength(); j++) {
		 var c = new link();
		 var attrs = linkList.item(j).getAttributes();
		 c.icon        = String(attrs.item(0).getNodeValue());
		 c.name        = String(attrs.item(1).getNodeValue());
		 c.url         = String(attrs.item(2).getNodeValue());
		 c.text        = String(attrs.item(3).getNodeValue());
		 c.addin       = a.name;
		 a.link[j] = c;
	  }
	  top.methodAddinArry[i] = a;

	  top.addins[a.name] = a;							// store in associative array
SystemOut("Loaded addin " + i + ": " + a.name);
   }

   // sort addins by base_addin and name (this will not affect the addins[] associative array)
   // NOTE:  the "if (x)..." test in the function is to avoid a mysterious "x has no properties" error.

   top.methodAddinArry.sort(function(x, y) { 
								if ((x) && (x.name)) return ((x.base_addin + x.name) < (y.base_addin + y.name))? -1:1
								else return 0 });

}

//================================================================================================
function transferOMAPackage(omaFile) {		// Obsolete?
   
   document.theParser.getOMAPkg(top.methodAttributes.updateServer
								,parseInt(top.methodAttributes.updatePort)
								,omaFile
								,top.sys.correctedPath + "tmp.oma")
}

//================================================================================================
function loadMethodAttributes() {
	var s = "";
	var objList;
   // get the object list of the <method> entity

	objList = document.theParser.getMethodObjList("method");		// should only have 1
	top.methodAttributes = new methodData();
//SystemOut("Found " + objList.getLength() + " method entity");

	var attrList = objList.item(0).getAttributes();
	top.methodAttributes.name           = String(attrList.item(0).getNodeValue());
	top.methodAttributes.description    = String(attrList.item(1).getNodeValue());
	top.methodAttributes.version        = String(attrList.item(2).getNodeValue());
	top.methodAttributes.updateServer   = String(attrList.item(3).getNodeValue());
	top.methodAttributes.updatePort     = String(attrList.item(4).getNodeValue());
	top.methodAttributes.updateSiteName = String(attrList.item(5).getNodeValue());
	top.methodAttributes.updateURL      = String(attrList.item(6).getNodeValue());
}

//================================================================================================
function loadFilterCriteria() {
   var objList;
   top.flatFilter = new String();

   objList = document.theParser.getMethodObjList("filter_criteria");
   top.filterArry = new Array();
   for (i = 0; i < objList.getLength(); i++) {
	  var attrList = objList.item(i).getAttributes();
	  a = new filter_criteria();
	  a.name              = String(attrList.item(0).getNodeValue());
	  a.description       = String(attrList.item(1).getNodeValue());
	  a.text              = String(attrList.item(2).getNodeValue());
	  a.empty_icon        = String(attrList.item(3).getNodeValue());
	  a.full_icon         = String(attrList.item(4).getNodeValue());
	  a.act_icon          = String(attrList.item(5).getNodeValue());
	  a.inact_icon        = String(attrList.item(6).getNodeValue());
	  top.filterArry[i] = a;
	  top.flatFilter = a.name + "|";

	  top.filters[a.name] = a;
   }
}

//================================================================================================
function loadAddinTypes() {
   var objList;

   objList = document.theParser.getMethodObjList("addin_type");
   top.addinType = new Array();
   for (i = 0; i < objList.getLength(); i++) {
	  var attrList = objList.item(i).getAttributes();
	  a = new addin_type();
	  a.name              = String(attrList.item(0).getNodeValue());
	  a.icon              = String(attrList.item(1).getNodeValue());
	  a.description       = String(attrList.item(2).getNodeValue());
	  //SystemOut("Addin type : " + a.name + " " + a.description + " " + a.icon);
	  top.addinType[i] = a;
   }
}

//================================================================================================
function loadMethodPhases() {
	objList = document.theParser.getMethodObjList("method_phases");
	top.phaseArry = new Array();
	var children = objList.item(0).getChildNodes();

	for (var i =0; i < children.getLength(); i++) {
		 var a = new method_phase();
		 var linkList = children.item(i).getElementsByTagName("link");
		 var attrList = children.item(i).getAttributes();
		 a.name             = String(attrList.item(0).getNodeValue());
		 a.description      = String(attrList.item(1).getNodeValue());
		 a.seq				= i;

		 for (var j = 0; j < linkList.getLength(); j++) {
			var c = new link();
			var attrs = linkList.item(j).getAttributes();
			c.icon        = String(attrs.item(0).getNodeValue());
			c.name        = String(attrs.item(1).getNodeValue());
			c.url         = String(attrs.item(2).getNodeValue());
			c.text        = String(attrs.item(3).getNodeValue());
			a.link[j] = c;
		 }
		 top.phaseArry[j] = a;

		 top.phases[a.name] = a;
//SystemOut(i+"-"+j+ ": " + a.name + "  "+ a.description);
	}
}

//================================================================================================
function loadMethodProcesses() {
   var objList = document.theParser.getMethodObjList("method_processes");
   top.processArry = new Array();
   var children = objList.item(0).getChildNodes();

   for (var i = 0; i < children.getLength(); i++) {
	  var a = new method_process();
 	  var linkList = children.item(i).getElementsByTagName("link");
	  var attrs = children.item(i).getAttributes();
	  a.name        = String(attrs.item(0).getNodeValue());
	  a.description = String(attrs.item(1).getNodeValue());
	  a.seq			= i;

	  for (var j = 0; j < linkList.getLength(); j++) {
		 var c = new link();
		 var attrs = linkList.item(j).getAttributes();
		 c.icon        = String(attrs.item(0).getNodeValue());
		 c.name        = String(attrs.item(1).getNodeValue());
		 c.url         = String(attrs.item(2).getNodeValue());
		 c.text        = String(attrs.item(3).getNodeValue());
		 a.link[j] = c;
	  }
	  top.processArry[i] = a;

	  top.processes[a.name] = a;
//SystemOut(i+ ": " + a.name + "  "+ a.description);
   }
}

//================================================================================================
function activateFilters() {
   // activate filters
   var filters = top.getCookie("filters");

   // if cookie doesn'exits create it
   if (filters == null || filters == "") {
	  // set all the filters enabled
	  var s = new String();
	  for (var i=0; i < top.filterArry.length; i++) {
		 s += top.filterArry[i].name + "|";
	  }
	  s = '<filters>' + " " + s + '</filters>';

	  top.setCookie("filters", s);
	  var filters = s;
   }

   // crop cookie tags

   filters = filters.substring(9,filters.length - 10);
   for (var i = 0; i < top.filterArry.length; i++) {
	  if (filters != "") {
		 if (filters.indexOf(top.filterArry[i].name) > -1) {
			top.filterArry[i].status = true;
		 } else {
			top.filterArry[i].status = false;
		 }
	  } else {
		 top.filterArry[i].status = true;
	  }
   }
}

//================================================================================================
function getAddinAttributes(fileName, addin_idx) {
// returns an array of task objects for the indicated addin file

   var s = "";
   var objList = null;
   var filterList = null;
   var templateList = null;
   var attrList = null;
   var linkList = null;
   var attrs = null;

   // get the object list of the <addin> entity

   document.theParser.parse(fileName);

   objList = document.theParser.getMethodObjList("addin");
   attrList = objList.item(0).getAttributes();
   var addin = String(attrList.item(0).getNodeValue());
   addin = top.methodAddinArry[addin_idx].name;			// override since XML may have wrong value

   //
   // check for translation and/or other addin-elements to overwrite their method analogues
   //
   methodPhaseList = objList.item(0).getElementsByTagName("method_phases");
   if (methodPhaseList.getLength() > 0) {
       var phaseList = methodPhaseList.item(0).getElementsByTagName("phase");
	   var pp = new Array();
	   for (var i = 0; i < phaseList.getLength() ; i++ ) {
	      attrList = phaseList.item(i).getAttributes();
 		  linkList = phaseList.item(i).getElementsByTagName("link");
	      var p = new method_phase();
		  p.name        = String(attrList.item(0).getNodeValue());
		  p.description = String(attrList.item(1).getNodeValue());
		  p.seq			= i;

		  for (var j = 0; j < linkList.getLength(); j++) {
			 var c = new link();
			 attrs = linkList.item(j).getAttributes();
			 c.icon        = String(attrs.item(0).getNodeValue());
			 c.name        = String(attrs.item(1).getNodeValue());
			 c.url         = String(attrs.item(2).getNodeValue());
			 c.text        = String(attrs.item(3).getNodeValue());
			 c.addin       = addin;
			 p.link[j] = c;
		  }
          pp[i] = p;
	   }
	   top.methodAddinArry[addin_idx].phases_translated = pp;
   }
   
   methodProcessList = objList.item(0).getElementsByTagName("method_processes");
   if (methodProcessList.getLength() > 0) {
       var processList = methodProcessList.item(0).getElementsByTagName("process");
	   var pp = new Array();
	   for (var i = 0; i < processList.getLength() ; i++ ) {
	      attrList = processList.item(i).getAttributes();
 		  linkList = processList.item(i).getElementsByTagName("link");
	      var p = new method_process();
		  p.name        = String(attrList.item(0).getNodeValue());
	      p.description = String(attrList.item(1).getNodeValue());
		  p.seq			= i;

		  for (var j = 0; j < linkList.getLength(); j++) {
			 var c = new link();
			 attrs = linkList.item(j).getAttributes();
			 c.icon        = String(attrs.item(0).getNodeValue());
			 c.name        = String(attrs.item(1).getNodeValue());
			 c.url         = String(attrs.item(2).getNodeValue());
			 c.text        = String(attrs.item(3).getNodeValue());
			 c.addin       = addin;
			 p.link[j] = c;
		  }
          pp[i] = p;
	   }
	   top.methodAddinArry[addin_idx].processes_translated = pp;
   }

   objList = document.theParser.getMethodObjList("task");
   aa = new Array();
   for (i = 0; i < objList.getLength(); i++) {
	  if (i % 10 == 0)	// add a period to the status message every 10 items
	  {
			statusMsg += ".";
			window.status = statusMsg;
	  }
	  attrList = objList.item(i).getAttributes();
	  filterList = objList.item(i).getElementsByTagName("filter");
	  templateList = objList.item(i).getElementsByTagName("template");
	  linkList = objList.item(i).getElementsByTagName("link");
	  a = new task();
	  a.taskid            = String(attrList.item(0).getNodeValue());
	  a.name              = String(attrList.item(1).getNodeValue());
	  a.phase             = String(attrList.item(2).getNodeValue());
	  a.process           = String(attrList.item(3).getNodeValue());
	  a.deliverable       = String(attrList.item(4).getNodeValue());
	  a.description       = String(attrList.item(5).getNodeValue());
	  // 
	  // set sort_id
	  // 
	  a.sort_id = top.phases[a.phase].seq		* 1000000000 
				+ top.processes[a.process].seq	* 10000000 
				+ a.taskid.charCodeAt(0)		* 100000
				+ a.taskid.charCodeAt(1)		* 1000
				+ Number(a.taskid.substr(a.taskid.indexOf('.')+1));
//SystemOut("read " + a.taskid + "  (" + a.sort_id + ")");

	  for (k = 0; k < filterList.getLength(); k++) {
		 b = new filter();
		 var attrs = filterList.item(k).getAttributes();
		 b.name = String(attrs.item(0).getNodeValue());
		 a.filter[k] = b;
	  }
	  if (filterList.getLength() == 0) {		// no filters defined
		 a.filter[0] = new filter();			// define a default filter
		 a.filter[0].name = "CORE";
	  }

	  for (k = 0; k < templateList.getLength(); k++) {
		 c = new template();
		 var attrs = templateList.item(k).getAttributes();
		 c.file        = String(attrs.item(0).getNodeValue());
		 c.description = String(attrs.item(1).getNodeValue());
		 c.name        = String(attrs.item(2).getNodeValue());
		 c.type        = String(attrs.item(3).getNodeValue());
		 c.state       = String(attrs.item(4).getNodeValue());
		 c.note        = String(attrs.item(5).getNodeValue());
		 c.tpid        = String(attrs.item(6).getNodeValue());
		 c.addin       = addin;
	     c.addin_idx   = addin_idx;
		 c.addinType   = top.methodAddinArry[addin_idx].type;

		 // adjust attributes
		 if (c.file.toLowerCase() == ".ome") {
			c.file = "";
		 }
		 if (c.note != "" && (c.type == "" || c.file == "")) {
			c.type = "note";
		 }

		 // adjust ome file path for backward compatibility
		 // if file is an OME file and does not include a directory path, prepend "menu/ome"
		 if (c.file.toLowerCase().substr(c.file.length-4, 4) == ".ome"
		     && c.file.indexOf("/") < 0 && c.file.indexOf("\\") < 0) {
			c.file = "menu/ome/" + c.file;
		 }

		 a.template[k] = c;

	  }
	  for (var k = 0; k < linkList.getLength(); k++) {
		 var d = new link();
		 var attrs = linkList.item(k).getAttributes();
		 d.icon        = String(attrs.item(0).getNodeValue());
		 d.name        = String(attrs.item(1).getNodeValue());
		 d.url         = String(attrs.item(2).getNodeValue());
		 d.text        = String(attrs.item(3).getNodeValue());
		 d.addin       = addin;
		 a.link[k] = d;
	  }
	  aa[i] = a;
   }
   return aa;
}
//================================================================================================
// NOTE:  The functions onLine() and getUpdate() are called by updateaddinpage.js.  The java code 
// (theParser applet) is a bit messay since the XML appears to be parsed 3 times!  This needs to be
// cleaned up.  
// The DOMparser class (called by both theParser.parse and theParser.parseRemote) does accept a valid
// URL, so I am hoping that I can just call it with the URL of the remote XML file and not have to 
// mess with privileges or sockets.
//================================================================================================
function onLine() {
	var returnCode;

	SystemOut("Attempting to establish a connection with " + top.methodAttributes.updateServer);
	returnCode = String(document.theParser.updateServerOnLine(top.methodAttributes.updateServer, 
								                          parseInt(top.methodAttributes.updatePort), 
                                                          top.methodAttributes.updateURL));
	SystemOut("Server return code = " + returnCode);

	top.onLineFlag = (returnCode == "Connected");
}

//================================================================================================
function getRemoteXML() {			// TEST

	var url = "http://" + top.methodAttributes.updateServer + ":" 
		+ top.methodAttributes.updatePort + top.methodAttributes.updateURL;

//systemOut("Parsing " + url);
	document.theParser.parse(url);
	loadUpdatedAddins();
}

//================================================================================================
function getUpdate() {

   document.theParser.parseRemote(top.methodAttributes.updateServer, 
								  parseInt(top.methodAttributes.updatePort), 
                                  top.methodAttributes.updateURL);
SystemOut("Parse of remote addin list successfull");
   loadUpdatedAddins();
}

//================================================================================================
function loadUpdatedAddins() {
   var objList;
   var a;

   // get the object list of the <addin> entities

   objList = document.theParser.getMethodObjList("addin");
SystemOut("Found " + objList.getLength() + " addins");

   top.updatedAddin = new Array();
   for (i = 0; i < objList.getLength(); i++) {
	  var attrList = objList.item(i).getAttributes();
	  a = new addin();
	  a.base_addin        = String(attrList.item(0).getNodeValue());
	  a.required_addin    = String(attrList.item(1).getNodeValue());
	  a.name              = String(attrList.item(2).getNodeValue());
	  a.description       = String(attrList.item(3).getNodeValue());
	  a.type              = String(attrList.item(4).getNodeValue());
	  a.version           = String(attrList.item(5).getNodeValue());
	  a.apps_release      = String(attrList.item(6).getNodeValue());
	  a.language          = String(attrList.item(7).getNodeValue());
	  a.geography         = String(attrList.item(8).getNodeValue());
	  a.ffw_type          = String(attrList.item(9).getNodeValue());
	  a.industry_seg      = String(attrList.item(10).getNodeValue());
	  a.industry_prod     = String(attrList.item(11).getNodeValue());
	  a.industry_prod_rel = String(attrList.item(12).getNodeValue());
	  a.publisher         = String(attrList.item(13).getNodeValue());
	  a.base_path         = String(attrList.item(14).getNodeValue());
	  a.omafile           = String(attrList.item(15).getNodeValue());		// only for addins on server
//	  a.omxfile			  = String(attrList.item(16).getNodeValue());
	  top.updatedAddin[i] = a;
   }

   top.updatedAddin.sort(function tmp(a, b) { return (a.base_addin + a.name < b.base_addin + b.name) ? -1:1});

}

//================================================================================================
function dumpObject(Object) {
// Debugging function to print the contents of an object to the Java Console
	for (var element in Object) {
		if (typeof Object[element] == "object") {
			document.theParser.printOndebug("<"+element);
			dumpObject(Object[element]);
			document.theParser.printOndebug(element+">");
		}
		else {
			document.theParser.printOndebug(element + ":  " + Object[element]);
		}	
	}
}

//================================================================================================
function SystemOut(s) {
   document.theParser.printOndebug(s);
}

//================================================================================================
function getAddinTypeIdx(addType) {
   for (var i = 0; i<top.addinType.length; i++) {
	  if (top.addinType[i].name == addType ) {
		 return i;
	  }
   }
   return -1;

}

//================================================================================================
function phaseIdx(pID) {
   for (var i = 0; i < top.phaseArry.length; i++) {
	  if (top.phaseArry[i].name == pID) {
		 var str_i = new String(i);
		 var str_ii = str_i;
		 for (var j = 0; j < (2 - str_i.length); j++) {
			str_ii = "0" + str_ii;
		 }
		 return str_ii;
	  }
   }
   return (pID + "not known");
}

//================================================================================================
function processIdx(pID) {   
   for (var i = 0; i < top.processArry.length; i++) {
	  if (top.processArry[i].name == pID ) {
		 var str_i = new String(i);
		 var str_ii = str_i;
		 for (var j = 0; j < (2 - str_i.length); j++) {
			str_ii = "0" + str_ii;
		 }
		 return str_ii;
	  }
   }
//   return (pID + " not known");
	return 0;
}

//================================================================================================
function calcProcessIdx(taskid) {
   var p = new String();
   p = taskid.substring(0, taskid.indexOf('.'));
   for (var i = 0; i < top.processArry.length; i++) {
	   if (top.processArry[i].name == p) {
		  return i;
	   }
   }
   return 0;
}

//================================================================================================
function calculateTaskidValue(t) {		// OBSOLETE
   var n = 0;
   //
   // SystemOut("Calculate Taskid Value for " + t.taskid);
   //
   n = t.taskid.substring(t.taskid.indexOf('.') + 1, t.taskid.length);	// extract number
   return eval(t.process_idx + n);										// prepend process seq number
}

