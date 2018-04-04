<!---
NYPHIL - A Simple Application Framework

Copyright 2006 Frank Rothkamm

Licensed under the Apache License, Version 2.0 (the "License");
http://www.apache.org/licenses/LICENSE-2.0

This Simple Application Framework was designed to make the fusion of the XHTML based Presentation layer
designed by Huge and the Coldfusion code designed by Neotix possible.

The Framework greatly simplifies the web application logic. Its only goal is to manage the web application's
complexities for the developers by providing a universal Coldfusion Component _build.cfc that builds each
page.

Methods defined in _build.cfc are invoked by pages derived from a universal template called _Template.cfm. T
his template is an abstraction of the _build.cfc component.

The template describes by name all the presentation layer modules and functional regions of the page. In 
most circumstances, only new content has to be added to create a fully functional new web application page.
The new content can be anything from straight HTML to Coldfusion and can reside anywhere in the directory
structure. Individual modules or regions can be easily switched off or replaced.

The Simple Application Framework separates functionality from presentation for all aspects by data encapsula
tion via CFC, a proven technology used in i.e. in Fusebox 5. It is an example of fluid architecture as 
changes to the underlying functionality - the _build.cfc Coldfusion Component - are automatically applied to any
template derived pages.

Reference:
Fusebox 5
---------
http://www.fusebox.org/
CFC (Coldfusion Components)
---------------------------
http://www.adobe.com/devnet/coldfusion/articles/intro_cfcs.html
--->
<cfcomponent>
<cfif NOT IsDefined('application.inchref')><cfset application.inchref = ''></cfif>
<cfinclude TEMPLATE="#application.inchref#/Application.cfm">
<cfprocessingdirective suppressWhiteSpace = "Yes">
<!------------------------------ Coldfusion HEADER ----------------------------------------------->
<cffunction name="Coldfusion" returntype="ANY">
<cfargument name="page" required="no" default="">
<cfsavecontent variable="results">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="Shortcut Icon" href="<cfoutput>#basehref#</cfoutput>/favicon.ico">
</cfsavecontent>
<cfreturn results />
</cffunction>
<!------------------------------ CascadingStyleSheets ----------------------------------------------->
<cffunction name="CascadingStyleSheets"
RETURNTYPE="ANY">
<cfsavecontent variable="result">
<style TYPE="text/css">
<!--
<cfinclude template="#inchref#/css/main.css.cfm">
-->
</style>
</cfsavecontent>
<cfreturn result />
</cffunction>
<!------------------------------ Javascript ----------------------------------------------->
<cffunction name="Javascript" returntype="ANY">
<cfsavecontent variable="result">
<cfif cgi.https NEQ "on">
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-285871-1";
urchinTracker();
</script>
</cfif>
<!---
<!--[if lt IE 7]>
<script defer type="text/javascript" src="<cfoutput>#inchref#</cfoutput>/j/pngfix.js"></script>
<![endif]-->
--->
<script language="javascript" type="text/javascript">
<cfinclude template="#inchref#/j/global.js">
<cfinclude template="#inchref#/j/liquid.js">
<cfinclude
<cfinclude
<cfinclude
<cfinclude
<cfinclude
<cfinclude
</script>
template="#inchref#/j/prototype.lite.js">
template="#inchref#/j/moo.fx.js">
template="#inchref#/j/rollover.js">
template="#inchref#/j/ajax.js">
template="#inchref#/j/flyout.js">
template="#inchref#/j/collapse.js">
<!---
<script language="javascript" type="text/javascript" src="/j/global.js"></script>
<script language="javascript" type="text/javascript" src="/j/liquid.js"></script>
<script language="javascript" type="text/javascript" src="/j/calendar.js"></script>
<script language="javascript" type="text/javascript" src="/j/calendar-event.js"></script>
<script language="javascript" type="text/javascript" src="/j/calendar-manager.js"></script>
<script language="javascript" type="text/javascript" src="/j/prototype.lite.js"></script>
<script language="javascript" type="text/javascript" src="/j/moo.fx.js"></script>
<script language="javascript" type="text/javascript" src="/j/rollover.js"></script> --->
</cfsavecontent>
<cfreturn result />
</cffunction>
<!------------------------------ ShoppingCart ----------------------------------------------->
<cffunction NAME="ShoppingCart" RETURNTYPE="ANY">
<cfargument name="Page"
required="no" default="">
<cfsavecontent variable="result">
<div id="mainNavTop">
<div class="logoHolder"><a href="<cfoutput>#basehref#/index.cfm</cfoutput>"><img src="<cfoutput>#imghref#<
/cfoutput>/global/nyPhilLogo.gif" align="absmiddle" alt="New York Philharmonic" /></a></div>
<CFINCLUDE TEMPLATE="#inchref#/includes/_acctMgmt.cfm">
</div>
</cfsavecontent>
<cfreturn result />
</cffunction>
<!------------------------------ Calendar ----------------------------------------------->
<cffunction name="Calendar">
<cfsavecontent variable="result">
<!-- NY PHIL NAV STARTS -->
<!--- if it is the home page, don't allow collapse --->
<cfif "http://#cgi.http_host##cgi.script_name#" NEQ "#basehref#/index.cfm">
<!--- if the calendar was used to navigate to this page, don't collapse --->
<cfif IsDefined("Cookie.usedCal") AND #Cookie.usedCal# EQ "1">
<script type="text/javascript">
createCookie("usedCal","0",1);
</script>
<div id="calendarModule">
<cfelse>
<div id="calendarModule" style="height:0px; display:none;">
</cfif>
<cfelse>
<div id="calendarModule">
</cfif>
<div id="calHeader">
<img src="<cfoutput>#imghref#</cfoutput>/calendar/headerThisMonth.gif" />
</div>
<div id="calendarWrapper">
<cfinclude template="#inchref#/includes/ajaxCalendar.cfm">
</div>
<!-- FLYOUT HTML STARTS HERE -->
<div id="flyOut">
<div id="flyOutTop"><img src="<cfoutput>#imghref#</cfoutput>/calendar/flyout/calFlyTop.gif" /></div>
<div id="flyOutContent">
<div id="leftArrow">
<img src="<cfoutput>#imghref#</cfoutput>/calendar/flyout/calFlyLeftArrow.gif" />
</div>
<div id="flyOutEvents">
</div>
</div>
<div id="flyOutBottom"><img src="<cfoutput>#imghref#</cfoutput>/calendar/flyout/calFlyBottom.gif" /></di
v>
</div>
<!-- FLYOUT HTML END HERE -->
<!-- CALENDAR EVENTS HTML ENDS HERE -->
<cfif "http://#cgi.http_host##cgi.script_name#" EQ "#basehref#/index.cfm">
<div id="calScroll">
<a href="<cfoutput>#inchref#</cfoutput>/attend/search/index.cfm?page=home"><img src="<cfoutput>#imghref#
</cfoutput>/calendar/buttonFindConcert.gif" /></a>
</div>
</cfif>
</div> <!-- NY PHIL NAV ENDS -->
<cfif "http://#cgi.http_host##cgi.script_name#" NEQ "#basehref#/index.cfm">
<div id="calCollapse" style="border-top: 5px solid #cc0033; width: 195px; padding: 10px 0 5px 0;">
<a href="#" onClick="toggleCollapse();" id="collapseText" style="background: url('<cfoutput>#imghref#</c
foutput>/calendar/calendarCollapseIcon.gif') no-repeat top left; padding: 1px 5px 10px 20px; margin: 0 0 10p
x 0; line-height: 16px;" onFocus="if(this.blur)this.blur()"><cfif IsDefined("Cookie.usedCal") AND #Cookie.us
edCal# EQ "1">close<cfelse>open</cfif> calendar</a>
</div>
</cfif>
<!---
instead of including all of the calendar details, just put in the blank div
<CFINCLUDE TEMPLATE="#inchref#/includes/_calendar.cfm">
--->
</cfsavecontent>
<div id="calendarEvents">
</div>
<cfreturn result />
</cffunction>
<!------------------------------ eNotes ----------------------------------------------->
<cffunction name="eNotes">
<cfsavecontent variable="result">
<div id="eNotes">
<!--- <form action="/transaction/login/index.cfm?page=donorOrSubscriber&buyerType=&sourceCode=&effortC
ode=">
<input id="eNews" value="<Enter Your Email>" onfocus="initFocus(this.id, '<Enter Your Email>')" />
</form> --->
<img src="<cfoutput>#imghref#</cfoutput>/global/headerENews.gif" id="eNotesHeader" /> <a href="<cfou
tput>#inchref#</cfoutput>/transaction/login/index.cfm?page=donorOrSubscriber&buyerType=&sourceCode=&effortCo
de="><img src="<cfoutput>#imghref#</cfoutput>/global/buttonSignUp.gif" border="0" id="eNotesSignUp" /></a>
</div>
</cfsavecontent>
<cfreturn result />
</cffunction>
<!------------------------------ LeftNavigation ----------------------------------------------->
<cffunction name="LeftNavigation">
<cfargument name="Page"
required="no" default="">
<cfargument name="Active" required="no" default="">
<cfsavecontent variable="result">
<!--- <cftry>
--->
<cfif FileExists(ExpandPath("#inchref#/navigation/#Page#.cfm"))>
<cfinclude template="#inchref#/navigation/#Page#.cfm">
<cfprocessingdirective suppresswhitespace="yes">
<div id="leftNav">
<cfloop from="1" to="#ArrayLen(M)#" index="j">
<cfif M[j][1] NEQ 0>
<cfset S_on = 0>
<cfloop from="1" to="#ArrayLen(S)#" index="i">
<cfparam name="S[i][1]" default="">
<cfparam name="S[i][2]" default="">
<cfif (S[i][2] EQ Active OR M[j][1] EQ Active) AND (S[i][1] EQ M[j][1])><cfset S_on = 1></cfif
>
</cfloop>
<cfif j mod 10 EQ 0>
<div class="navHeader"><img src="<cfoutput>#imghref#</cfoutput>/navigation/<cfoutput>#M[j][3]#</cfout
put>" /></div>
<ul>
</cfif>
<cfparam name="M[j][4]" default="">
<!--- <cfparam name="M[j][2]" default=""> --->
<cfif M[j][2] NEQ "">
<li><cfoutput><a href="#M[j][2]#" <cfif S_on EQ 1 OR M[j][1] EQ Active>class="active"</cfif> #M[j][4]#
>#M[j][1]#</a></cfoutput>
<cfelse>
<li><cfoutput><a href="javascript:alert('information not yet available')" <cfif S_on EQ 1 OR M[j][1] EQ
Active>class="active"</cfif> >#M[j][1]#</a></cfoutput>
</cfif>
<cfif S_on EQ 1 >
<ul class="subNav">
<cfloop from="1" to="#ArrayLen(S)#" index="i">
<cfparam name="S[i][4]" default="">
<cfif M[j][1] EQ S[i][1]>
<cfoutput>
<li><a <cfif S[i][2] EQ Active>class="active"</cfif> href="#S[i][3]#" #S[i][4]# >#S[i][2]#</a
></li>
</cfoutput>
</cfif>
</cfloop>
</ul>
</cfif></li>
</cfif>
<cfif (j+1) mod 10 EQ 0 AND j GT 10></ul></cfif>
</cfloop>
</div>
</cfprocessingdirective>
<cfelse>
<cfinclude TEMPLATE="#inchref#/navigation/whatsnew.cfm">
</cfif>
<!--- <cfcatch type="any">coming soon</div>
<cfmail to="#errorEmailList#" from="notify@nyphil.org" subject="LeftNavigation [soft] failure">
#cfcatch.message#
-----------------
#cfcatch.detail#
-----------------
#CFCATCH.TYPE#
-----------------
</cfmail>
</cfcatch>
</cftry> --->
</cfsavecontent>
<cfreturn result />
</cffunction>
<!------------------------------ Footer ----------------------------------------------->
<cffunction name="Footer">
<cfsavecontent variable="result">
<!-- NY PHIL FOOTER STARTS -->
<div id="footer">
<div class="copyRight">Copyright &copy; 2001 - <cfoutput>#dateFormat(now(), "YYYY")#</cfoutput> New York P
hilharmonic. All rights reserved.</div>
<a href="<cfoutput>#inchref#</cfoutput>/concertsticks/plan_directions.cfm">Directions</a>&nbsp;&nbsp;|&nbs
p;&nbsp;<a href="<cfoutput>#inchref#</cfoutput>/about/directory.cfm">Contact Us</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="<cfoutput>#inchref#</cfoutput>/about/privacyPolicy.cfm">Privacy Policy</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="<cfoutput>#inchref#</cfoutput>/about/photoCredits.cfm">Photo Credits</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
href="<cfoutput>#inchref#</cfoutput>/about/help.cfm">Help</a>
</div><!-- NY PHIL FOOTER ENDS -->
<!--- TIMER --->
<cfif client.loggedIn EQ "true">
<cfif minTilLogout LT 0>
<cfset minRemaining = (1440 + minTilLogout)>
<cfelse>
<cfset minRemaining = minTilLogout>
</cfif>
<cfset client.logoutWarning = "true">
</cfif>
<cfquery name="selTicketTime" datasource="#ds#">
{ Call cart_selTicketTime(#client.currentUserKey#) }
</cfquery>
<cfif (client.perfSeatKeyList NEQ "" OR client.perfReserveKeyList NEQ "") AND (DateCompare(client.ticketExpi
re, selTicketTime.timeNow, "n") GT 0)>
<cfif DateDiff("s", selTicketTime.timeNow, client.ticketExpire) GT 0>
<cfscript>
minutesRemaining = DateDiff("n", selTicketTime.timeNow, client.ticketExpire);
secondsRemaining = DateDiff("s", selTicketTime.timeNow, client.ticketExpire) - (60*minutesRemaining)
;
if(len(secondsRemaining) EQ 1){
secondsRemaining="0" & secondsRemaining;
}
</cfscript>
<div id="mainTimer">
<cfoutput><cfif minutesRemaining GT 0>You have <strong>#minutesRemaining# minutes </strong> remaining un
til your tickets expire.<cfelse>Your tickets have timed out.</cfif></cfoutput>
</div>
</cfif>
</cfif>
<!---
<script language="javascript" type="text/javascript">
var calendarManager = new CalendarManager("calendarWrapper", "calendarEvents", "flyOut", "calBack", "calFo
rward");
</script>
--->
</cfsavecontent>
<cfreturn result />
</cffunction>
</cfprocessingdirective>
</cfcomponent>
