

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>UnitToUnit List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New UnitToUnit</g:link></span>
        </div>
        <div class="body">
            <h1>UnitToUnit List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Related Unit</th>
                   	    
                   	        <th>Relationship</th>
                   	    
                   	        <g:sortableColumn property="preferredOrder" title="Preferred Order" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${unitToUnitInstanceList}" status="i" var="unitToUnitInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${unitToUnitInstance.id}">${fieldValue(bean:unitToUnitInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:unitToUnitInstance, field:'relatedUnit')}</td>
                        
                            <td>${fieldValue(bean:unitToUnitInstance, field:'relationship')}</td>
                        
                            <td>${fieldValue(bean:unitToUnitInstance, field:'preferredOrder')}</td>
                        
                            <td>${fieldValue(bean:unitToUnitInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:unitToUnitInstance, field:'endDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${unitToUnitInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
