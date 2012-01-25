

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PersonToPerson List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PersonToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>PersonToPerson List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Related Person</th>
                   	    
                   	        <th>Relationship</th>
                   	    
                   	        <g:sortableColumn property="preferredOrder" title="Preferred Order" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personToPersonInstanceList}" status="i" var="personToPersonInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personToPersonInstance.id}">${fieldValue(bean:personToPersonInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:personToPersonInstance, field:'relatedPerson')}</td>
                        
                            <td>${fieldValue(bean:personToPersonInstance, field:'relationship')}</td>
                        
                            <td>${fieldValue(bean:personToPersonInstance, field:'preferredOrder')}</td>
                        
                            <td>${fieldValue(bean:personToPersonInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:personToPersonInstance, field:'endDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personToPersonInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
