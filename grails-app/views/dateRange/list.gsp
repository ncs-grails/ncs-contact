

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>DateRange List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New DateRange</g:link></span>
        </div>
        <div class="body">
            <h1>DateRange List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="startMonth" title="Start Month" />
                        
                   	        <g:sortableColumn property="startDay" title="Start Day" />
                        
                   	        <g:sortableColumn property="endMonth" title="End Month" />
                        
                   	        <g:sortableColumn property="endDay" title="End Day" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dateRangeInstanceList}" status="i" var="dateRangeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${dateRangeInstance.id}">${fieldValue(bean:dateRangeInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:dateRangeInstance, field:'startMonth')}</td>
                        
                            <td>${fieldValue(bean:dateRangeInstance, field:'startDay')}</td>
                        
                            <td>${fieldValue(bean:dateRangeInstance, field:'endMonth')}</td>
                        
                            <td>${fieldValue(bean:dateRangeInstance, field:'endDay')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dateRangeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
