

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Title</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Title List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Title</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Title</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${titleInstance}">
            <div class="errors">
                <g:renderErrors bean="${titleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${titleInstance?.id}" />
                <input type="hidden" name="version" value="${titleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:titleInstance,field:'name','errors')}">
                                    <input type="text" maxlength="10" id="name" name="name" value="${fieldValue(bean:titleInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="abbreviation">Abbreviation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:titleInstance,field:'abbreviation','errors')}">
                                    <input type="text" id="abbreviation" name="abbreviation" value="${fieldValue(bean:titleInstance,field:'abbreviation')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:titleInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${titleInstance?.dateCreated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:titleInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${titleInstance?.lastUpdated}" ></g:datePicker>
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
