

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>UnitToPerson List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New UnitToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>UnitToPerson List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Unit</th>
                   	    
                   	        <th>Unit Role</th>
                   	    
                   	        <g:sortableColumn property="preferredOrder" title="Preferred Order" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${unitToPersonInstanceList}" status="i" var="unitToPersonInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${unitToPersonInstance.id}">${fieldValue(bean:unitToPersonInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:unitToPersonInstance, field:'unit')}</td>
                        
                            <td>${fieldValue(bean:unitToPersonInstance, field:'unitRole')}</td>
                        
                            <td>${fieldValue(bean:unitToPersonInstance, field:'preferredOrder')}</td>
                        
                            <td>${fieldValue(bean:unitToPersonInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:unitToPersonInstance, field:'endDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${unitToPersonInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
