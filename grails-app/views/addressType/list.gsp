

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>AddressType List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New AddressType</g:link></span>
        </div>
        <div class="body">
            <h1>AddressType List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${addressTypeInstanceList}" status="i" var="addressTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${addressTypeInstance.id}">${fieldValue(bean:addressTypeInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:addressTypeInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:addressTypeInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:addressTypeInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${addressTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
