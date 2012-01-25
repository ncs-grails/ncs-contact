

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit UniformResource</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UniformResource List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New UniformResource</g:link></span>
        </div>
        <div class="body">
            <h1>Edit UniformResource</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${uniformResourceInstance}">
            <div class="errors">
                <g:renderErrors bean="${uniformResourceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${uniformResourceInstance?.id}" />
                <input type="hidden" name="version" value="${uniformResourceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url">Url:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceInstance,field:'url','errors')}">
                                    <input type="text" id="url" name="url" value="${fieldValue(bean:uniformResourceInstance,field:'url')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${uniformResourceInstance?.dateCreated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${uniformResourceInstance?.lastUpdated}" ></g:datePicker>
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
