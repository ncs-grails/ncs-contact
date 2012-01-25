

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>SocialSecurityNumber List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New SocialSecurityNumber</g:link></span>
        </div>
        <div class="body">
            <h1>SocialSecurityNumber List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="ssn" title="Ssn" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${socialSecurityNumberInstanceList}" status="i" var="socialSecurityNumberInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${socialSecurityNumberInstance.id}">${fieldValue(bean:socialSecurityNumberInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:socialSecurityNumberInstance, field:'ssn')}</td>
                        
                            <td>${fieldValue(bean:socialSecurityNumberInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:socialSecurityNumberInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${socialSecurityNumberInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
