

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>AddressToPerson List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New AddressToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>AddressToPerson List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Delivery Address</th>
                   	    
                   	        <th>Address Type</th>
                   	    
                   	        <g:sortableColumn property="preferredOrder" title="Preferred Order" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${addressToPersonInstanceList}" status="i" var="addressToPersonInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${addressToPersonInstance.id}">${fieldValue(bean:addressToPersonInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:addressToPersonInstance, field:'deliveryAddress')}</td>
                        
                            <td>${fieldValue(bean:addressToPersonInstance, field:'addressType')}</td>
                        
                            <td>${fieldValue(bean:addressToPersonInstance, field:'preferredOrder')}</td>
                        
                            <td>${fieldValue(bean:addressToPersonInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:addressToPersonInstance, field:'endDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${addressToPersonInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
