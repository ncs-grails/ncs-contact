

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Credential List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Credential</g:link></span>
        </div>
        <div class="body">
            <h1>Credential List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="abbreviation" title="Abbreviation" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${credentialInstanceList}" status="i" var="credentialInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${credentialInstance.id}">${fieldValue(bean:credentialInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:credentialInstance, field:'abbreviation')}</td>
                        
                            <td>${fieldValue(bean:credentialInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:credentialInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:credentialInstance, field:'name')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${credentialInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
