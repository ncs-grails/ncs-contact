

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Group</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Group List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Group</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Group</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${groupInstance}">
            <div class="errors">
                <g:renderErrors bean="${groupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${groupInstance?.id}" />
                <input type="hidden" name="version" value="${groupInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:groupInstance,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:groupInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nickName">Nick Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:groupInstance,field:'nickName','errors')}">
                                    <input type="text" maxlength="50" id="nickName" name="nickName" value="${fieldValue(bean:groupInstance,field:'nickName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category">Category:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:groupInstance,field:'category','errors')}">
                                    <g:select optionKey="id" from="${GroupCategory.list()}" name="category.id" value="${groupInstance?.category?.id}" ></g:select>
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
