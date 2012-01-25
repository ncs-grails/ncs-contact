

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create DateRange</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">DateRange List</g:link></span>
        </div>
        <div class="body">
            <h1>Create DateRange</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dateRangeInstance}">
            <div class="errors">
                <g:renderErrors bean="${dateRangeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startMonth">Start Month:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:dateRangeInstance,field:'startMonth','errors')}">
                                    <input type="text" id="startMonth" name="startMonth" value="${fieldValue(bean:dateRangeInstance,field:'startMonth')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDay">Start Day:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:dateRangeInstance,field:'startDay','errors')}">
                                    <input type="text" id="startDay" name="startDay" value="${fieldValue(bean:dateRangeInstance,field:'startDay')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endMonth">End Month:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:dateRangeInstance,field:'endMonth','errors')}">
                                    <input type="text" id="endMonth" name="endMonth" value="${fieldValue(bean:dateRangeInstance,field:'endMonth')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDay">End Day:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:dateRangeInstance,field:'endDay','errors')}">
                                    <input type="text" id="endDay" name="endDay" value="${fieldValue(bean:dateRangeInstance,field:'endDay')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
