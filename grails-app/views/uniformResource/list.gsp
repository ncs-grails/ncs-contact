

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>UniformResource List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New UniformResource</g:link></span>
        </div>
        <div class="body">
            <h1>UniformResource List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="url" title="Url" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${uniformResourceInstanceList}" status="i" var="uniformResourceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${uniformResourceInstance.id}">${fieldValue(bean:uniformResourceInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:uniformResourceInstance, field:'url')}</td>
                        
                            <td>${fieldValue(bean:uniformResourceInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:uniformResourceInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${uniformResourceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
