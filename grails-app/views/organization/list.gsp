

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Organization List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Organization</g:link></span>
        </div>
        <div class="body">
            <h1>Organization List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />

                   	        <g:sortableColumn property="nickName" title="Nick Name" />

							<g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${organizationInstanceList}" status="i" var="organizationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${organizationInstance.id}">${fieldValue(bean:organizationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:organizationInstance, field:'name')}</td>

                            <td>${fieldValue(bean:organizationInstance, field:'nickName')}</td>

                            <td>${fieldValue(bean:organizationInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:organizationInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${organizationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
