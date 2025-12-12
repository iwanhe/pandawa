// Copyright (c) 1999, Oracle Corpration. all Rights Reserved.
// 
// Globals.js - Global variables and shared utility functions
// 
// History
// ----------------------------------------------------------------------------------------------------------------------
// 27-Dec-1998				Maurizio Papini		Start Coding
// 15-Mar-1999				Maurizio Papini     End First Prototype
// 29-Mar-1999				Maurizio Papini		Modified Footer
//												Added Link Management
//												Alternate Table Shading
// 02-Apr-1999              Maurizio Papini     Changed images for Filters
// 08-Apr-1999              Maurizio Papini     Bugs Fixed :
//												   One task listed even if all filter were de-selected
//												   Error trying to display deliverables for the last Task
//												   Modified footer for the addins Page : no checkbox for addin request
//
// 10-apr-1999				Maurizio Papini		Activated Dynamic Links for processes, phases
// 11-apr-1999              Maurizio Papini     Added template type icon on template page
// 12-apr-1999 (week)       Maurizio Papini     Created add-in update pages
//												Checked all page aspect for consistency
//												Changed display mechanism for templates
//												Modified Template Page to display template-type icons	
//												Modified addin Page to add delete button on addin rows
// 19-apr-1999 (week)		Maurizio Papini     Modified addin-type management for tasks' page
//                                              Priority Management
//												XML dtd for method modified for addin
// 26-apr-1999 (week)       Maurizio Papini     Added wait screen and improved addin change
//                                              Added search engine
// 28-apr-1999              Maurizio Papini     Changed Priority Management
// 29-apr-1999              Maurizio Papini     modified  addin.dtd file
//											    new views on process page
// 03-may-1999				Maurizio Papini     New sorting for "Show All Tasks" functionality
// 05-may-1999              Maurizio Papini     New images component
// 06-may-1999              Maurizio Papini		Worked on Priority
//    jun-1999              Maurizio Papini     worked on test results, 800 x 600 aspect improvements, 
//												changes on priority mngmnt, different way to handle network
//											    connection for addin updates
//
// Date				Name			Version		File				Description
// -------------	--------------	----------	----------			-----------------------------------------------------
// July-Aug 1999	Jim Lange		3.0.0.0		All					- Too many changes to list in preparation for release.
// 02-Sep-1999		Jim Lange		3.0.0.1		omparser.js			- Fix deactivated filter problem when cookies not set.
// 07-Sep-1999		Jim Lange					standardfooter.js	- Change links to call openWindow function
// 												omparser.js			- Activate all BASE add-ins by default if cookie is not set
//																	- Change add-in reference in link object to add-in name (not index)
// 08-Sep-1999		Jim Lange		3.0.0.1		omparser.js			- Create new add-in types dynamically if not in known list
//												processpage.js		- Do not insert "menu/ome" in file path (now handled during parsing)
//												addinpage.js		- Set valign="TOP" in publisher row of pop-up table
//																	- Fix bad checkbox reference in removeAddin()
// 14-Sep-1999		Jim Lange		3.0.0.2		omparser.js			- Remove task sort; assume that XML files are presorted.
//												menupage.js			- Fix PT/Ops Analysis link bug.
// 15-Sep-1999		Jim Lange		3.0.0.3		omparser.js			- Put task sort back in.
// 16-Sep-1999		Jim Lange		3.0.0.4		processpage.js		- Disabled progressive loading of page to prevent Netscape crash if
//																	  user tries to select a task before the page is finished building.
// 18-Sep-1999		Jim Lange		3.0.0.5		addinpage.js		- Fix bug in isAddinActive().
//																	- Fix bug in setResetAddin when deactivating the
//																	  only addin.
// 23-Sep-1999		Jim Lange		3.0.0.6		addinpage.js		- Fix cookie bug (JavaScript error) in closeAddin()
//												omparser.js			- In refreshAddins(), rebuild actAddinArry
//																	- Supress duplicate links at main, process, and phases level
//																	- Fix missing priorities after refreshing add-ins
//																	- Store add-in name as uppercase only
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
var codeVersion = "3.0.0.6";				// this should be updated with every change

var copyright = new String("Copyright (c) 1999, Oracle Corporation. All Rights Reserved.");

var activeAddinTypes;						// Array of addin_type objects
var sys;									// holds a SystemData object

var methodAttributes;
var addinType         = new Array();
var methodAddinArry   = new Array();       // contain all the addin for the method
var updatedAddin	  = new Array();
var addinArry         = new Array();       // array of addin tasks
var mergedAddin       = new Array();
var filterArry        = new Array();
var phaseArry         = new Array();
var processArry       = new Array();
var methodFrm;                            // reference to the method-frame object
var actAddinArry      = new Array();      // array of indexes of the selected addins
var pagePath          = new String();
var selectedAddins    = new String();
var selectedAddinsSav = new String();
var phase_sorted_key  = new Array();		// obsolete
var addinPriority     = new Array();
var actAddinArrySav   = new Array();
var taskListCache     = new Array();		// saved HTML for task list page
var flatFilter        = new String();
var maxActivePriority  = 0;

var phases			= new Object();			// Associative array keyed on phase id
var processes		= new Object();			// Associative array keyed on process id
var addins			= new Object();			// Associative array keyed on addin name
var filters			= new Object();			// Associative array keyed on criterion filter id

var alternateColor;

// The next two vars are used to configure the color of the header bar for all the tables of the application

var bar_bground      = new String("#990000");
var bar_textcol      = new String("#FFFFFF");

var onlineFlag; // on line indication flag

var	sq = "'"; // used to build command/parameter string in javascript
var dq = '"'; // sq = single quote , dq = double quoote

var dirtAddin = false;	

var cookieArray = new Array();
var cookiesString = new String();

function getWindowWidth() {
	if (document.all) {				// MSIE
		return document.body.clientWidth;
	}
	else {
		return window.innerWidth;
	}
}
//
// Return a string containing the description of a the pIdth phase
//
function phaseDescription(pID) {			// obsolete
   if (pID == "*") {
      return "All Phases";
   }
   for (var i = 0; i < top.phaseArry.length; i++) {
      if (top.phaseArry[i].name == pID) {
	     return top.phaseArry[i].description;
	  }
   }
   return (pID);
}
function processDescription(pID) {			// obsolete
   if (pID == "*") {
      return "All Tasks";
   }
   for (var i = 0; i < top.processArry.length; i++) {
      if (top.processArry[i].name == pID) {
	     return top.processArry[i].description;
	  }
   }
   return (pID);
}
function getCookieVal(offset) {
   var endstr = document.cookie.indexOf(";", offset);
   if (endstr == -1) {
      endstr = document.cookie.lenght;
   }
   return unescape(document.cookie.substring(offset,endstr));
}

function getCookie(name) {
   var cookieString = document.cookie;
   var cookieArray = cookieString.split(";")
   for (i in cookieArray) {
      if (cookieArray[i].indexOf(name) != -1) {
         return cookieArray[i].substring(cookieArray[i].indexOf("=") + 2, cookieArray[i].length - 1);
      }
   }
   return "";
}

function setCookie(name, value) {
	var now = new Date();
	var expires = new Date(now.getTime() + 60 * 60 * 1000 * 24 * 365 * 2);

	document.cookie = name + '="' + value + '" ; expires=' + expires.toGMTString();
}

function downloadAddin(what) {
   window.frames["middle-frame"].location.href = what;
   window.history.length = 0;
}
function checkHistory() {
   obj = window.history;
   for (var i=0; i < obj.length; i++) {
      methodFrm.SystemOut(obj + "." + i + " is " + obj[i]);
   }
}

function updateAddin(omaFile) {
   //waitScreen("Downloading and Installing Add-in Package");
   //methodFrm.transferOMAPackage(omaFile);
   //window.frames["middle-frame"].document.location.href = top.sys.codeBase + "tmp.oma";
methodFrm.SystemOut("Downloading Add-in " + omaFile);
//   window.frames["middle-frame"].document.location.href = "ftp://" + top.methodAttributes.updateServer + ":" + top.methodAttributes.updatePort + omaFile;
   window.frames["middle-frame"].document.location.href = "ftp://" + top.methodAttributes.updateServer + omaFile;

	newAddinsInstalled = true;
}

function openWindow(url) {
	var newWindow;

	if (url.indexOf("://") >= 0) {		// if a web address, include toolbar
		newWindow = window.open(url, "help", "resizable,menubar,scrollbars,toolbar,left=10,top=10,height=500,width=700", true);
	}
	else {								// local file, no toolbar
		newWindow = window.open(url, "help", "resizable,menubar,scrollbars,left=10,top=10,height=500,width=700", true);
	}
    newWindow.focus();
}

//
// This function is triggered by the find button in the header frame
//
function findInTaskList() {
    top.taskListCache = new Array();	// force rebuild of task list when processPage is called
	top.processPage('*' ,'*');
}

//
// Recursively create a copy any arbitrarily complex object
//
function copyObject (o) {
	var n;									// variable to hold new object or array

	n = new o.constructor();				// create new object of same type

	for (var prop in o) {					// for each property in object
		if (typeof o[prop] == "object") {
			n[prop] = copyObject(o[prop]);	// recursively copy child object (or array)
		}
		else {
			n[prop] = o[prop];				// assign property value
		}
	}

	return n;
}
