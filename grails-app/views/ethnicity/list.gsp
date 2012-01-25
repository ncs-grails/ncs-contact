

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Ethnicity List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Ethnicity</g:link></span>
        </div>
        <div class="body">
            <h1>Ethnicity List</h1>
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
                    <g:each in="${ethnicityInstanceList}" status="i" var="ethnicityInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ethnicityInstance.id}">${fieldValue(bean:ethnicityInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:ethnicityInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:ethnicityInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:ethnicityInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ethnicityInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
