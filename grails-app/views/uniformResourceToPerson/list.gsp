

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>UniformResourceToPerson List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New UniformResourceToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>UniformResourceToPerson List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Uri</th>
                   	    
                   	        <th>Uri Type</th>
                   	    
                   	        <g:sortableColumn property="preferredOrder" title="Preferred Order" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${uniformResourceToPersonInstanceList}" status="i" var="uniformResourceToPersonInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${uniformResourceToPersonInstance.id}">${fieldValue(bean:uniformResourceToPersonInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:uniformResourceToPersonInstance, field:'uri')}</td>
                        
                            <td>${fieldValue(bean:uniformResourceToPersonInstance, field:'uriType')}</td>
                        
                            <td>${fieldValue(bean:uniformResourceToPersonInstance, field:'preferredOrder')}</td>
                        
                            <td>${fieldValue(bean:uniformResourceToPersonInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:uniformResourceToPersonInstance, field:'endDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${uniformResourceToPersonInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
