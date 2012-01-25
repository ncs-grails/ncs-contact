

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Address List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Address</g:link></span>
        </div>
        <div class="body">
            <h1>Address List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="address" title="Address" />
                        
                   	        <g:sortableColumn property="address2" title="Address 2" />
                        
                   	        <g:sortableColumn property="city" title="City" />

                   	        <g:sortableColumn property="state" title="State" />
                        
                   	        <g:sortableColumn property="zipcode" title="Zipcode" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${addressInstanceList}" status="i" var="addressInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean:addressInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:addressInstance, field:'streetAddress')}</td>
                        
                            <td>${fieldValue(bean:addressInstance, field:'streetAddress2')}</td>
                        
                            <td>${fieldValue(bean:addressInstance, field:'city')}</td>

                            <td>${fieldValue(bean:addressInstance, field:'state')}</td>

                            <td>${fieldValue(bean:addressInstance, field:'zipcode')}-${fieldValue(bean:addressInstance, field:'zip4')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${addressInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
