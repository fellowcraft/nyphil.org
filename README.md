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
