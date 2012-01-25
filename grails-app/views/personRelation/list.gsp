

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PersonRelation List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PersonRelation</g:link></span>
        </div>
        <div class="body">
            <h1>PersonRelation List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <th>Inverse Relation</th>
                   	    
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personRelationInstanceList}" status="i" var="personRelationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personRelationInstance.id}">${fieldValue(bean:personRelationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:personRelationInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:personRelationInstance, field:'inverseRelation')}</td>
                        
                            <td>${fieldValue(bean:personRelationInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:personRelationInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personRelationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
