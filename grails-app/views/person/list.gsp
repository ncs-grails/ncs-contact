

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Person List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Person</g:link></span>
        </div>
        <div class="body">
            <h1>Person List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="preferredName" title="Name" />

                   	        <th>Gender</th>

                   	        <g:sortableColumn property="birthDate" title="Birth Date" />
                        
                   	        <g:sortableColumn property="deathDate" title="Death Date" />
                        
                   	        <th>Image</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personInstance.id}">${fieldValue(bean:personInstance, field:'id')}</g:link></td>
                        
                            <td>${personInstance.preferredName}</td>
                        
                            <td>${fieldValue(bean:personInstance, field:'gender')}</td>

                            <td><g:formatDate format="MM/dd/yyyy" date="${personInstance.birthDate}"/></td>
                        
                            <td>${fieldValue(bean:personInstance, field:'deathDate')}</td>
                        
                            <td>${fieldValue(bean:personInstance, field:'image')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
