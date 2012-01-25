

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>GroupToPerson List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New GroupToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>GroupToPerson List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Group</th>
                   	    
                   	        <g:sortableColumn property="preferredOrder" title="Preferred Order" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${groupToPersonInstanceList}" status="i" var="groupToPersonInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${groupToPersonInstance.id}">${fieldValue(bean:groupToPersonInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:groupToPersonInstance, field:'group')}</td>
                        
                            <td>${fieldValue(bean:groupToPersonInstance, field:'preferredOrder')}</td>
                        
                            <td>${fieldValue(bean:groupToPersonInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:groupToPersonInstance, field:'endDate')}</td>
                        
                            <td>${fieldValue(bean:groupToPersonInstance, field:'dateCreated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${groupToPersonInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
