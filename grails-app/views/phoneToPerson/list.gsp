

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PhoneToPerson List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PhoneToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>PhoneToPerson List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Phone Number</th>
                   	    
                   	        <th>Phone Type</th>
                   	    
                   	        <g:sortableColumn property="preferredOrder" title="Preferred Order" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${phoneToPersonInstanceList}" status="i" var="phoneToPersonInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${phoneToPersonInstance.id}">${fieldValue(bean:phoneToPersonInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:phoneToPersonInstance, field:'phone')}</td>
                        
                            <td>${fieldValue(bean:phoneToPersonInstance, field:'phoneType')}</td>
                        
                            <td>${fieldValue(bean:phoneToPersonInstance, field:'preferredOrder')}</td>
                        
                            <td>${fieldValue(bean:phoneToPersonInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:phoneToPersonInstance, field:'endDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${phoneToPersonInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
