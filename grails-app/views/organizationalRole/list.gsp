

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>OrganizationalRole List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New OrganizationalRole</g:link></span>
        </div>
        <div class="body">
            <h1>OrganizationalRole List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${organizationalRoleInstanceList}" status="i" var="organizationalRoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${organizationalRoleInstance.id}">${fieldValue(bean:organizationalRoleInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:organizationalRoleInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:organizationalRoleInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:organizationalRoleInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${organizationalRoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
