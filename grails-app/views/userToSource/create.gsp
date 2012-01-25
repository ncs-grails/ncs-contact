

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create UserToSource</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UserToSource List</g:link></span>
        </div>
        <div class="body">
            <h1>Create UserToSource</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userToSourceInstance}">
            <div class="errors">
                <g:renderErrors bean="${userToSourceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                                    <g:datePicker name="startDate" value="${userToSourceInstance?.startDate}" noSelection="['':'']" precision="day"></g:datePicker>
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
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
