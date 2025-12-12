// Copyright (c) 1999, Oracle Corporation. all Rights Reserved.
// 
// Thin Engine - AGSL Oracle Method and Tools
// 
//
// History
// ----------------------------------------------------------------------------------------------------------
// 27-Dec-1998	Maurizio Papini		- Start Coding
// 08-Sep-1999	Jim Lange			- Set valign="TOP" in publisher row of pop-up table
//									- Fix bad checkbox reference in removeAddin()
// 18-Sep-1999	Jim Lange			- Fix bug in isAddinActive().
//									- fix bug in  setResetAddin when deactivating the
//									  only addin.
// 23-Sep-1999	Jim Lange			- Fixed cookie bug in closeAddin()
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
// addinPage :
// build the addins selection page
//

var numGif = new Array();

numGif[0] = "menu/images/zero.gif";
numGif[1] = "menu/images/one.gif";
numGif[2] = "menu/images/two.gif";
numGif[3] = "menu/images/three.gif";
numGif[4] = "menu/images/four.gif";
numGif[5] = "menu/images/five.gif";
numGif[6] = "menu/images/six.gif";
numGif[7] = "menu/images/seven.gif";
numGif[8] = "menu/images/eight.gif";
numGif[9] = "menu/images/nine.gif";

var newAddinsInstalled = false;

//==================================================================================
function addinPage()
{
	var addinc = getCookie("addins");
methodFrm.SystemOut("AddinPage: Reading Addin Cookie = " + addinc);
	top.selectedAddins = addinc;
	top.selectedAddinsSav = addinc;
	tmp = top.actAddinArry.join("#");			// copy array 
	top.actAddinArrySav = tmp.split("#");

	top.waitScreen("Building Add-In List");

	if (top.newAddinsInstalled == true) {
		methodFrm.refreshAddins();
		top.newAddinsInstalled = false;
	}

	displayAddinList();
	addinFooter();
}

//==================================================================================
function displayAddinList() {

	var s = new String();        // s is a buffer to store the html code for this page

	window.frames["middle-frame"].document.open();

	s = '<html>\n';
	s += '<head>';
    s += '<meta name="copyright" content="' + copyright + '">\n';
	s += '<link rel="STYLESHEET" title="default" media="screen" ';
    s += '  href="menu/style/general.css" type="text/css">\n';
	s += '</head>\n';
	s += '<body>\n';

  	s += '<br><b>Navigation</b>: <a href="javascript:top.menuPage()">main</a> > Add-In Selection\n'
    pagePath =  '<br><b>Navigation</b>: <a href="javascript:top.menuPage()">main</a> > <a href="javascript:top.addinPage()">Add-In Selection</a>';

	//
	// start the addin table
    //

	s += '<form name="addinForm">\n';
	s += '<table width="63%" border="0" cellpadding="0" cellspacing="0">\n';
    s += ' <tr>\n';
    s += '        <td colspan=5 height="46"> <font size="3"><b><font face="Helvetica, san-serif, Arial, verdana">Select the Add-In Components you wish to Activate</font></b></font> </td>\n';
    s += '      </tr>\n'; 
	s += '   <tr bgcolor="' + bar_bground + '">\n';
    s += '     <th colspan="2" height="30">\n'; 
    s += '       <div align="center"><font face="Helvetica, san-serif, Arial, verdana" color="' + bar_textcol + '" size="1">Priority</font> </div>\n';
    s += '     </th>\n';
    s += '     <th width="4%" height="30">\n';
    s += '      <div align="center">&nbsp;</div>\n';
    s += '     </th>\n';
    s += '     <th width="58%" colspan="4" height="30"> \n';
    s += '      <div align="left"><font face="Helvetica, san-serif, Arial, verdana" color="' + bar_textcol + '" size="1"> Add-In</font></div>\n';
    s += '     </th>\n';
    s += '  </tr>\n';

	var commName = "";
	
	alternateColor = false;

    for (var i=0; i< top.methodAddinArry.length; i++) {
		window.status = "Reading " + top.methodAddinArry[i].description + "...";

	    if (top.methodAddinArry[i].base_addin != commName) {		// New base_addin name
		     commName = top.methodAddinArry[i].base_addin;
			 s += '  <tr> \n';
			 s += '    <td width="5%" bgcolor="#FFFFFF">&nbsp;</td>\n';
			 s += '    <td width="4%">&nbsp;</td>\n';
			 s += '    <td width="4%">&nbsp;</td>\n';
			 s += '    <td width="58%"><font face="Helvetica, san-serif, Arial, verdana" size="2"><b>' + top.methodAddinArry[i].base_addin + '</b></font></td>\n';
			 s += '    <td width="12%">&nbsp;</td>\n';
			 s += '    <td width="6%">&nbsp;</td>\n';
			 s += '    <td width="12%">&nbsp;</td>\n';
			 s += '  </tr>\n';
		}

		if (alternateColor == true) {
	       s += '      <tr  bgcolor="#E6E6E6"> \n';
	       alternateColor = false;
	    } else {
	       s += '      <tr>\n';
	       alternateColor = true;
	    }; 
		if (top.addinISActive(i) == true) {
		   s += '    <td width="5%"><div align="center"><img border=0 src="' + top.numGif[top.methodAddinArry[i].priority] + '" width="12" height="12" name="prio' + i + '"></div></td>\n';
		   s += '    <td width="4%"><a href="javascript:top.raisePriority(self, ' + i + ')" name="' + top.methodAddinArry[i].name + '_pri" onMouseOver="self.status=\'Click to increase priority\'" onMouseOut="self.status=\' \'"><img border=0 src="menu/images/priority.gif" width="16" height="11" border="0" name="button' + i + '"></a></td>\n';
		   top.methodAddinArry[i].tmpPriority = top.methodAddinArry[i].priority;
		} else {
		   s += '    <td width="5%"><div align="center"><img border=0 src="menu/images/nothing.gif" width="12" height="12" name="prio' + i + '"></div></td>\n';
		   s += '    <td width="4%"><a href="javascript:top.raisePriority(self, ' + i + ')" name="' + top.methodAddinArry[i].name + '_pri"><img border=0 src="menu/images/nothing.gif" width="16" height="11" border="0" name="button' + i + '"></a></td>\n';
		   top.methodAddinArry[i].priority = 0;
		}

		s += '    <td width="4%"> \n';
		s += '      <div align="center"> \n';
		s += '        <input  type="checkbox" name="CB_' + top.methodAddinArry[i].name + '" OnClick="top.setResetAddin(self,' + sq + 'CB_' + top.methodAddinArry[i].name + sq + ',' + i + ')"';

		if (top.addinISActive(i) == true) {
	       s += ' checked>\n';
		} else {
           s += '>\n';
        }
		s += '      </div>\n';
		s += '    </td>\n';
		s += '    <td width="70%"><font face="Helvetica, san-serif, Arial, verdana" size="1">\n';
		s += '		<a href="javascript:void 0" ';		// basically, a no-op
		s += ' OnMouseOver="top.showLayer(self,' + sq + top.methodAddinArry[i].name + sq + ');self.status=\' \';return true"';
		s += ' OnMouseOut="top.hideLayer(self,' + sq + top.methodAddinArry[i].name + sq + ')">\n';
		s +=		top.methodAddinArry[i].description + ' ';
		s +=		top.methodAddinArry[i].version + ', ';
		if (top.methodAddinArry[i].apps_release != '') {
			s +=		'R' + top.methodAddinArry[i].apps_release + ', ';
		}
		s +=		top.methodAddinArry[i].language + ', ';
		s +=		top.methodAddinArry[i].geography + '</a>\n';
		s += '    </font></td>\n';
		s += '    <td width="12%">&nbsp;</td>\n';
		s += '    <td width="12%">\n'; 

		if (top.methodAddinArry[i].omxfile != "") {		// add-in has deinstall file
			s += '      <div align="center">\n';
			s += '        <font face="Helvetica, san-serif, Arial, verdana" size="1">'
			s += '<input type="button" name="removeAddin" value="Remove" onClick="javascript:top.removeAddin(self,' + i + ')">\n';
			s += '      </font></div>\n';	
		}
		else {
			s +=        '&nbsp;';
		}
		s += '    </td>\n';
		s += '    <td width="6%">&nbsp;</td>\n';
		s += '  </tr>\n';
	}
	s += '</table>\n';
	s += '</form>\n';

	window.frames["middle-frame"].document.write(s);

	window.status = "";
	s = "";

	//
	// create layers for extra info display (hidden)
	//
	for (var i=0; i< top.methodAddinArry.length; i++) {

		s += '<DIV ID="' + top.methodAddinArry[i].name + '" STYLE="position:absolute; left:' + (top.getWindowWidth() - 250) + '; top:50; visibility:hidden">\n';
		s += '   <table BORDER=2 bordercolor="red" width="200">\n';
		s += '       <tr>\n';
		s += '          <td><center><b><font color="#FF6666">' + top.methodAddinArry[i].description + '</font></b></center></td>\n';
		s += '       </tr>\n';
		s += '       <tr>\n';
		s += '          <td>\n';
		s += '              <table BORDER=0>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4" height="1">Add-In Type:</td>\n';
		s += '                     <td class="t4" height="1">' + top.methodAddinArry[i].type + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4">Add-In Version:</td>\n';
		s += '                     <td class="t4">' + top.methodAddinArry[i].version + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4">Apps Release:</td>\n';
		s += '                     <td class="t4">' + top.methodAddinArry[i].apps_release + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4">Language:</td>\n';
		s += '                     <td class="t4">' + top.methodAddinArry[i].language + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4">Geography:</td>\n';
		s += '                     <td class="t4">' + top.methodAddinArry[i].geography + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4">Fast Forward Type:</td>\n';
		s += '                     <td class="t4">' + top.methodAddinArry[i].ffw_type + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4">Industry Segment:</td>\n';
		s += '                     <td class="t4">' + top.methodAddinArry[i].industry_seg + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4">Industry Product:</td>\n';
		s += '                     <td class="t4">' + top.methodAddinArry[i].industry_prod + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr>\n';
		s += '                     <td class="t4">Industry Prod Release:</td>\n';
		s += '                     <td class="t4">' + top.methodAddinArry[i].industry_prod_rel + '</td>\n';
		s += '                 </tr>\n';
		s += '                 <tr valign="TOP">\n';
		s += '                     <td class="t4">Publisher:</td>\n';
		s += '                     <td class="t4" width="100">' + top.methodAddinArry[i].publisher + '</td>\n';
		s += '                 </tr>\n';
		s += '             </table>\n';
		s += '         </td>\n';
		s += '      </tr>\n';
		s += '   </table>\n';
		s += '</DIV>\n';
	}
   
	s += '</body>\n';
	s += '</html>';

	window.frames["middle-frame"].document.write(s);
	window.frames["middle-frame"].document.close();
	
}
//==================================================================================
//
// Change the status of a layer to "visible"
//
function showLayer(win, id) {
	if (document.layers) {				// Netscape
		win.document.layers[id].visibility = "show";
	}
	else {								// IE
		win.document.all[id].style.visibility = "visible";
	}
}

//==================================================================================
//
// Change the status of a layer to "hidden"
//
function hideLayer(win, id) {

	if (document.layers) {				// Netscape
		win.document.layers[id].visibility = "hide";
	}
	else {								// IE
		win.document.all[id].style.visibility = "hidden";
	}
}

//==================================================================================
function raisePriority(win, addinIDX) {
//
// This changes the priority of the stored addin
// priority is stored in cookies
// priority is increased by diminishing its value

	// if this addin is not active, do nothing
	if (top.methodAddinArry[addinIDX].tmpPriority == 0) {
		return;
	}
	//
	// are we trying to go lower than the minimum priority ? Outta here !
	//
	if (top.methodAddinArry[addinIDX].tmpPriority == 1) {
		alert("This addin already has the top priority");
		return;
	} 
	else {

//methodFrm.SystemOut("Dump of actAddinArrySav");
//methodFrm.dumpObject(top.actAddinArrySav);
//methodFrm.SystemOut("Dump of methodAddinArry");
//for (var i in top.methodAddinArry) {
//	methodFrm.SystemOut(i + " = " + top.methodAddinArry[i].tmpPriority);
//}
		
		// 
		// access the image in the cell
		//
		var img = new Image();
		img = win.document.images['prio' + addinIDX];
		top.methodAddinArry[addinIDX].tmpPriority--;
//alert("Reducing priority of " + top.methodAddinArry[addinIDX].name + "("+addinIDX+" )to " + top.methodAddinArry[addinIDX].tmpPriority);
		img.src = top.numGif[top.methodAddinArry[addinIDX].tmpPriority];


		// renumber any active addins that are equal to or greater that me
		var newPriority = top.methodAddinArry[addinIDX].tmpPriority + 1;

		for (var i = 0; i <top.actAddinArrySav.length; i++) {
//alert("Checking " + top.actAddinArrySav[i] + " != " + addinIDX );
   			if ( Number(top.actAddinArrySav[i]) != addinIDX ) { // exclude self
				var thisAddin = top.methodAddinArry[top.actAddinArrySav[i]];
				if (thisAddin.tmpPriority >= top.methodAddinArry[addinIDX].tmpPriority ) {
					var swapimg = new Image();
					swapimg = win.document.images['prio' + top.actAddinArrySav[i]];
//alert("Reseting priority of " + thisAddin.name + "("+top.actAddinArrySav[i]+") to " + newPriority);
					thisAddin.tmpPriority = newPriority++;
					if (swapimg != null) {
						swapimg.src = top.numGif[thisAddin.tmpPriority];
					}
				}
			}
		}
	}

   
//methodFrm.dumpObject(top.actAddinArrySav);

   top.dirtAddin = true;				// indicate that priorities have changed
}

//==================================================================================
function setResetAddin(win, buttonName, addinIDX) {
    var status;
	var img = new Image();

	status = win.document.forms[0].elements[buttonName].checked;
//methodFrm.SystemOut("status of " + buttonName + " = " + status);

	if (status == true) {				// activate addin
	   //
	   // show icon on the addin line
	   //
       img = win.document.images['button' + addinIDX];
	   img.src = "menu/images/priority.gif";
       img = win.document.images['prio' + addinIDX];

	   // switch mouse actions (doesn't work)
//	   win.document.links[top.methodAddinArry[addinIDX].name + "_pri"].onClick= 'top.raisePriority(self, ' + addinIDX + ');return false';
//	   win.document.links[top.methodAddinArry[addinIDX].name + "_pri"].onMouseOver = 'self.status="Click to increase priority"';
//	   win.document.links[top.methodAddinArry[addinIDX].name + "_pri"].onMouseOut = 'self.status=" "';

	   //
	   // assign the lowest priority
	   //
	   top.methodAddinArry[addinIDX].tmpPriority = ++top.maxActivePriority;
	   img.src = top.numGif[top.methodAddinArry[addinIDX].tmpPriority];
	   top.actAddinArrySav[top.actAddinArrySav.length] = addinIDX;

//methodFrm.SystemOut("Assigned priority " + top.maxActivePriority + " to " + top.methodAddinArry[addinIDX]);

	} 
	else {								// deactivate addin
	   //
	   // drop icons
	   //
	   // if we are trying to de-select the only addin warn the user
	   //
	   if (top.actAddinArrySav.length == 1) {
	      alert("You should have at least one addin selected!");
//		  win.document.forms[0].elements[buttonName].checked = true;
//		  return;
	   }

	   // switch images to blank
	   img = win.document.images['prio' + addinIDX];
	   img.src ="menu/images/nothing.gif"; 
       img = win.document.images['button' + addinIDX];
	   img.src = "menu/images/nothing.gif";

	   // switch mouse actions (doesn't work)
//	   win.document.links[top.methodAddinArry[addinIDX].name + "_pri"].onClick= 'return false';
//	   win.document.links[top.methodAddinArry[addinIDX].name + "_pri"].onMouseOver = 'self.status=" "';

	   //
	   // adjust priority in such a way we do not see gaps in the priority sequence
	   //
	   for (var i = 0; i < top.methodAddinArry.length; i++ ) {
		  if (i != addinIDX) {				// check everyone except me
			  if (top.methodAddinArry[i].tmpPriority > top.methodAddinArry[addinIDX].tmpPriority) {
				 img = win.document.images['prio' + i];
				 if (top.methodAddinArry[i].tmpPriority != 0) {
					top.methodAddinArry[i].tmpPriority--;		// lower priority by 1
//	alert("lowering priority of " + top.methodAddinArry[i].name + " to " + top.methodAddinArry[i].tmpPriority);
					img.src = top.numGif[top.methodAddinArry[i].tmpPriority];
				 }
			  }
	      }
	   }

       // zero flags the addin as deselected
       top.methodAddinArry[addinIDX].tmpPriority = 0;

       //
	   // take the index off the actAddinArrySav
	   //
	   tmp = new String();							// build a string, then convert it back into an array
	   for (var i = 0; i < top.actAddinArrySav.length; i++) {
	      if (Number(top.actAddinArrySav[i]) != addinIDX) {
 		     tmp += top.actAddinArrySav[i] + ",";
		  }
	   }
       tmp = tmp.substring(0, tmp.length - 1);		// remove trailing comma
//methodFrm.SystemOut("deselect, new list = "+tmp);

	   if (tmp == "") {
			top.actAddinArrySav = new Array();		// reset array
	   }
	   else {
			top.actAddinArrySav = tmp.split(",");
	   }
//methodFrm.dumpObject(top.actAddinArrySav);
	}

    top.maxActivePriority = top.actAddinArrySav.length;
	//
    // save a new value in the 'addins' cookie TMP string everytime an addin checkbox is clicked
	//
    top.selectedAddinsSav = new String();
    for (var i = 0; i < top.actAddinArrySav.length; i++) {
	   top.selectedAddinsSav += top.methodAddinArry[top.actAddinArrySav[i]].name + "|";
	}

methodFrm.SystemOut("selectedAddinsSav = " + selectedAddinsSav);

}


//==================================================================================
function addinISActive(addinIDX) {			// TODO:  Change to use actAddinArrySav

	var tmp = "|" + top.selectedAddinsSav + "|";
//alert("looking for '" + top.methodAddinArry[addinIDX].name + "' in " + tmp);
	return (tmp.indexOf("|" + top.methodAddinArry[addinIDX].name + "|") >= 0);
//	return (top.methodAddinArry[addinIDX].priority) > 0);

//   var addinc = new String();
//   addinc = getCookie("addins");
//   arry = addinc.split("|");
//   for (var i = 0; i < arry.length; i++) {
//      if (arry[i] == String(top.methodAddinArry[addinIDX].name)) {
//	     return true;
//	  }
//   }
//   return false;
}

//==================================================================================
function closeAddin(flag) {
//methodFrm.SystemOut(top.selectedAddins + " != " + top.selectedAddinsSav + "?");

   if (top.selectedAddins != top.selectedAddinsSav) {
	  // update the addin configuration

	  top.setCookie("addins", top.selectedAddinsSav);
methodFrm.SystemOut("CloseAddin: Saved Addin Cookie = " + top.selectedAddinsSav);

	  // update priority cookie
	  var s = new String();
	  for (var i = 0; i < top.actAddinArrySav.length; i++) {
	     s += top.methodAddinArry[top.actAddinArrySav[i]].tmpPriority + "#" + top.methodAddinArry[top.actAddinArrySav[i]].name;
         top.methodAddinArry[top.actAddinArrySav[i]].priority = top.methodAddinArry[top.actAddinArrySav[i]].tmpPriority;
		 if (i < top.actAddinArrySav.length - 1) {
		    s += "|"; // separator
		 }
	  }

	  top.setCookie("priority", s);
methodFrm.SystemOut("CloseAddin: Saved Priority Cookie = " + s);

	  // clear footer
	  window.frames["footer"].document.write(top.blankPage);

	  //
      // rerun the parser
	  //
	  methodFrm.getXML("Updating Preferences");

	  top.dirtAddin = false;
   }

   if (top.dirtAddin == true) {			// add-ins have been prioritized, but list is the same
	  //
	  // save new priorities in a cookie
	  //
	  var s = new String();
	  for (var i = 0; i < top.actAddinArrySav.length; i++) {
	     s += top.methodAddinArry[top.actAddinArrySav[i]].tmpPriority + "#" + top.methodAddinArry[top.actAddinArrySav[i]].name;
         top.methodAddinArry[top.actAddinArrySav[i]].priority = top.methodAddinArry[top.actAddinArrySav[i]].tmpPriority;
         if (i < top.actAddinArrySav.length - 1) {
		    s += "|"; // separator
		 }
	  }
	  top.setCookie("priority", s);
methodFrm.SystemOut("CloseAddin: Saving Priority Cookie = " + s);

	  top.methodFrm.sortAddins();			// remerge add-ins only, don't reload
   }
   //
   // Go back to the menu page
   //
   top.menuPage();
}

//==================================================================================
function removeAddin(win, i) {
methodFrm.SystemOut("Removing " + top.methodAddinArry[i].name);

	if (addinISActive(i) == true) {		// deactivate; this takes care of updating variables that track active status
methodFrm.SystemOut("Deactivating addin");
		win.document.forms[0].elements["CB_" + top.methodAddinArry[i].name].checked = false;		// uncheck box
		top.setResetAddin(win, "CB_" + top.methodAddinArry[i].name, i);			// deselect addin
	}

	// launch OMX file to deinstall
	top.location.href = sys.codeBase + top.methodAddinArry[i].base_path + "/" + top.methodAddinArry[i].omxfile;

	// Delete addin from global list (NOTE: if addin was active before we deleted it, the closeAddin()
	// function will force a reload of method information;

	for (var j = i; j < top.methodAddinArry.length; j++) {
		if (j == top.methodAddinArry.length - 1) {
			top.methodAddinArry[j] = null;							// dereference last entry
		}
		else {
			top.methodAddinArry[j] = top.methodAddinArry[j + 1];	// shift entries down
		}
	}
	top.methodAddinArry.length--;									// shorten array by one

	// Adjust indexes in actAddinArrySav
	for (var j = 0; j < top.actAddinArrySav.length; j++) {
		if (top.actAddinArrySav[i] > i) {
			top.actAddinArrySav[i]--;								// decrease index
		}
	}

	// Adjust indexes in actAddinArry
	for (var j = 0; j < top.actAddinArry.length; j++) {
		if (top.actAddinArry[i] > i) {
			top.actAddinArry[i]--;									// decrease index
		}
	}

	displayAddinList();			// repaint this page

}

//==================================================================================
function addinFooter()
{

    var s = new String();
   	s += '<html>\n';
	s += '<body bgcolor="#FFFFFF">\n';
	s += '<form name="footer">\n';
	s += '<center>\n';
	s += '<br>\n';
	s += '<table border=3 bgcolor="#222222" cellpadding=0 cellspacing=0>\n'
	s += ' <tr>\n';
	s += '   <td>\n';
	s += '     <table cellpadding=0 cellspacing=0 border=0>\n';
	s += '      <tr>\n';
	s += '        <td>\n';
    s += '          <font face=ARIAL size=-2>\n';
	s += '               <input type="button" value="&nbsp;&nbsp;OK&nbsp;&nbsp;" onClick="top.closeAddin()" name="button">\n';
	s += '          </font>\n';
	s += '        </td>\n';
	s += '        <td> \n';
    s += '          <font face=ARIAL size=-2>\n';
	s += '          <input type="button" value="&nbsp;Cancel&nbsp;" onClick="top.menuPage();return true;" name="button1">\n';
	s += '          </font>\n';
	s += '        </td>\n';

	//
	// if there is a remote update server defined, display button
	//
	if (top.methodAttributes.updateURL != "") {
		s += '        <td> \n';	
		s += '          <font face=ARIAL size=-2>\n';
		s += '          <input type="button" value="Check For Add-Ins and Updates" onClick="top.serverAddinPage();return true;" name="button3">\n';
		s += '          </font>\n';
		s += '        </td>\n';
	}

	s += '      </tr>\n';
    s += '     </table\n';
	s += '   </td>\n';
	s += ' </tr>\n';
	s += '</table>\n';
	s += '    </table>\n';
    s += '</center>\n';
	s += '<div align="left">\n';
	s += '<font face="Arial, Helvetica, sans-serif" size="1" color="#000000">' + copyright + '</font>\n';
	s += '</div>\n';
	s += '</form></body></html>\n';
	
	window.frames["footer"].document.open("text/html");
	window.frames["footer"].document.write(s);
	window.frames["footer"].document.close();
}

//==================================================================================
function serverAddinPage() {
	top.waitScreen("Connecting to " + top.methodAttributes.updateSiteName);
	serverAddinFooter();
	window.frames["middle-frame"].location.href = top.methodAttributes.updateURL;

	top.newAddinsInstalled = true;		// assume new addins installed (called page can reset)
}

//==================================================================================
function serverAddinFooter()
{
    var s = new String();

   	s += '<html>\n';
	s += '<head>';
    s += '<meta name="copyright" content="' + copyright + '">\n';
	s += '<link rel="STYLESHEET" title="default" media="screen" ';
    s += '  href="menu/style/general.css" type="text/css">\n';
	s += '</head>\n';
	s += '<body bgcolor="#FFFFFF">\n';
	s += '<form name="footer">\n';
	s += '<center>\n';
	s += '<br>\n';
	s += '<table width="30%">\n';
	s += '  <tr>\n';
	s += '    <td>\n';
	s += '      <table border=3 bgcolor="#222222" cellpadding=0 cellspacing=0>\n';
	s += '        <tr align=LEFT valign=TOP>\n';
	s += '          <td>\n';
	s += '            <table border=0 cellpadding=0 cellspacing=0>\n';
	s += '              <tr align=LEFT valign=CENTER>\n';
	s += '                <td><font face=ARIAL size=-2>\n';
	s += '                   <input type="button" value="&nbsp;&nbsp;Back&nbsp;&nbsp;" onClick="javascript:top.addinPage()" name="button1">\n';
	s += '                </td>\n';
	s += '              </tr>\n';
	s += '            </table>\n';
	s += '          </td>\n';
	s += '        </tr>\n';
	s += '      </table>\n';
	s += '    </td>\n';
	s += '  </tr>\n';
	s += '</table>\n';
    s += '</center>\n';
	s += '<div class="copyright">\n';
	s += copyright;
	s += '</div>\n';
	s += '</form></body></html>\n';
	
	window.frames["footer"].document.open("text/html");
	window.frames["footer"].document.write(s);
	window.frames["footer"].document.close();
}
