

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>OrganizationalUnit List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New OrganizationalUnit</g:link></span>
        </div>
        <div class="body">
            <h1>OrganizationalUnit List</h1>
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
                        
                   	        <g:sortableColumn property="nickName" title="Nick Name" />
                        
                   	        <th>Organization</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${organizationalUnitInstanceList}" status="i" var="organizationalUnitInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${organizationalUnitInstance.id}">${fieldValue(bean:organizationalUnitInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:organizationalUnitInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:organizationalUnitInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:organizationalUnitInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:organizationalUnitInstance, field:'nickName')}</td>
                        
                            <td>${fieldValue(bean:organizationalUnitInstance, field:'organization')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${organizationalUnitInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
