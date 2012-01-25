

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Group List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Group</g:link></span>
        </div>
        <div class="body">
            <h1>Group List</h1>
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
                        
                   	        <th>Category</th>
                   	    
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${groupInstanceList}" status="i" var="groupInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${groupInstance.id}">${fieldValue(bean:groupInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:groupInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:groupInstance, field:'nickName')}</td>
                        
                            <td>${fieldValue(bean:groupInstance, field:'category')}</td>
                        
                            <td>${fieldValue(bean:groupInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:groupInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${groupInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
