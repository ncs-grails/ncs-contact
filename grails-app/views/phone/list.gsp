

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Phone List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Phone</g:link></span>
        </div>
        <div class="body">
            <h1>Phone List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="countryCode" title="Country Code" />
                        
                   	        <g:sortableColumn property="phoneNumber" title="Phone Number" />
                        
                   	        <g:sortableColumn property="extension" title="Extension" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${phoneInstanceList}" status="i" var="phoneInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${phoneInstance.id}">${fieldValue(bean:phoneInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:phoneInstance, field:'countryCode')}</td>
                        
                            <td>${fieldValue(bean:phoneInstance, field:'phoneNumber')}</td>
                        
                            <td>${fieldValue(bean:phoneInstance, field:'extension')}</td>
                        
                            <td>${fieldValue(bean:phoneInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:phoneInstance, field:'lastUpdated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${phoneInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
