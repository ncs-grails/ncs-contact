

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show DateRange</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">DateRange List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New DateRange</g:link></span>
        </div>
        <div class="body">
            <h1>Show DateRange</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:dateRangeInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Start Month:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:dateRangeInstance, field:'startMonth')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Start Day:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:dateRangeInstance, field:'startDay')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">End Month:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:dateRangeInstance, field:'endMonth')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">End Day:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:dateRangeInstance, field:'endDay')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${dateRangeInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
