<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <title><g:layoutTitle default="Contact Manager" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" type="text/css" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <calendar:resources lang="en" theme="tiger"/>
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir:'images', file:'spinner.gif')}" alt="Spinner" />
        </div>	
        <div class="logo">
		  <img src="${createLinkTo(dir:'images', file:'ncs_logo_145.png')}" alt="National Children's Study" />
		  National Children's Study
		</div>
        <g:layoutBody />

				<div id="footer">
			<div id="footer_inner">
				<p class="copyright">&copy; 2009 Regents of the University of Minnesota. All rights reserved.<br />
					The University of Minnesota is an equal opportunity educator and employer<br />
					Last modified on 08/12/2009
				</p>
			</div>
			<div id="footer_right">
				<ul class="footer_links">
					<li><a href="http://www.privacy.umn.edu/">Privacy</a> | </li>
					<li><a href="mailto:webmaster@ncs.umn.edu">Webmaster</a></li>
				</ul>
				<br class="clearabove" />
			</div>
		</div>

    </body>	
</html>
