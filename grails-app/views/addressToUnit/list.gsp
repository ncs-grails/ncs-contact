

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>AddressToUnit List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New AddressToUnit</g:link></span>
        </div>
        <div class="body">
            <h1>AddressToUnit List</h1>
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
                    <g:each in="${addressToUnitInstanceList}" status="i" var="addressToUnitInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${addressToUnitInstance.id}">${fieldValue(bean:addressToUnitInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:addressToUnitInstance, field:'deliveryAddress')}</td>
                        
                            <td>${fieldValue(bean:addressToUnitInstance, field:'addressType')}</td>
                        
                            <td>${fieldValue(bean:addressToUnitInstance, field:'preferredOrder')}</td>
                        
                            <td>${fieldValue(bean:addressToUnitInstance, field:'startDate')}</td>
                        
                            <td>${fieldValue(bean:addressToUnitInstance, field:'endDate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${addressToUnitInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
