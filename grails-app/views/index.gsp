<html>
    <head>
        <title>National Children's Study Contact Management</title>
		<meta name="layout" content="main" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
			<span class="menuButton"><a class="list" href="controllers.gsp">Controller List</a></span>
			<span class="menuButton"><g:link class="list" controller="navigate">Browser</g:link></span>
		</div>
        <h1 style="margin-left:20px;">Contact Management</h1>
        <p style="margin-left:20px;width:80%">Please Choose an Item to View/Edit</p>

        <div class="dialog" style="margin-left:20px;width:60%;">
            <ul>

              <li class="controller roundrect person entity"><g:link controller="person">People</g:link></li>
              <li class="controller roundrect institution entity"><g:link controller="organization">Organizations</g:link></li>
              <li class="controller roundrect group entity"><g:link controller="group">Groups</g:link></li>
            </ul>
        </div>

    </body>
</html>
