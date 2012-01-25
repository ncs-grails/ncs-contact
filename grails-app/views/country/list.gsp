

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Country List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Country</g:link></span>
        </div>
        <div class="body">
            <h1>Country List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="abbreviation" title="Abbreviation" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${countryInstanceList}" status="i" var="countryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${countryInstance.id}">${fieldValue(bean:countryInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:countryInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:countryInstance, field:'abbreviation')}</td>
                        
                            <td>${fieldValue(bean:countryInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:countryInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${countryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
