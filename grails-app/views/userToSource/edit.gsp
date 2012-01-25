

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit UserToSource</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UserToSource List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New UserToSource</g:link></span>
        </div>
        <div class="body">
            <h1>Edit UserToSource</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userToSourceInstance}">
            <div class="errors">
                <g:renderErrors bean="${userToSourceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${userToSourceInstance?.id}" />
                <input type="hidden" name="version" value="${userToSourceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source">Source:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userToSourceInstance,field:'source','errors')}">
                                    <g:select optionKey="id" from="${Source.list()}" name="source.id" value="${userToSourceInstance?.source?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userToSourceInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${userToSourceInstance?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userToSourceInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${userToSourceInstance?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:userToSourceInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="user.id" value="${userToSourceInstance?.user?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
