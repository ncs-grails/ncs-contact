

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Name List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Name</g:link></span>
        </div>
        <div class="body">
            <h1>Name List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Title</th>
                   	    
                   	        <g:sortableColumn property="firstName" title="First Name" />
                        
                   	        <g:sortableColumn property="middleName" title="Middle Name" />
                        
                   	        <g:sortableColumn property="lastName" title="Last Name" />
                        
                   	        <g:sortableColumn property="suffix" title="Suffix" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${nameInstanceList}" status="i" var="nameInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${nameInstance.id}">${fieldValue(bean:nameInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:nameInstance, field:'title')}</td>
                        
                            <td>${fieldValue(bean:nameInstance, field:'firstName')}</td>
                        
                            <td>${fieldValue(bean:nameInstance, field:'middleName')}</td>
                        
                            <td>${fieldValue(bean:nameInstance, field:'lastName')}</td>
                        
                            <td>${fieldValue(bean:nameInstance, field:'suffix')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${nameInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
