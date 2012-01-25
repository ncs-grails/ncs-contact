<html>
    <head>
        <title>National Children's Study Contact Management</title>
		<meta name="layout" content="main" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		</div>
        <h1 style="margin-left:20px;">Contact Controllers</h1>
        <p style="margin-left:20px;width:80%">Please Choose a Controller to View/Edit</p>
        <div class="dialog" style="margin-left:20px;width:60%;">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses.sort{it.name}}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName.replace("Controller", "")}</g:link></li>
              </g:each>
            </ul>
        </div>
    </body>
</html>
