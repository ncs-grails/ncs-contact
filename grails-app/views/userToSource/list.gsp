

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>UserToSource List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New UserToSource</g:link></span>
        </div>
        <div class="body">
            <h1>UserToSource List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Source</th>
                   	    
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userToSourceInstanceList}" status="i" var="userToSourceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${userToSourceInstance.id}">${fieldValue(bean:userToSourceInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:userToSourceInstance, field:'source')}</td>
                        
                            <td>${fieldValue(bean:userToSourceInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:userToSourceInstance, field:'endDate')}</td>
                        
                            <td>${fieldValue(bean:userToSourceInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:userToSourceInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userToSourceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
