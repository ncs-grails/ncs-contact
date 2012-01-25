

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Credential</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Credential List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Credential</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Credential</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${credentialInstance}">
            <div class="errors">
                <g:renderErrors bean="${credentialInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${credentialInstance?.id}" />
                <input type="hidden" name="version" value="${credentialInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="abbreviation">Abbreviation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:credentialInstance,field:'abbreviation','errors')}">
                                    <input type="text" maxlength="8" id="abbreviation" name="abbreviation" value="${fieldValue(bean:credentialInstance,field:'abbreviation')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:credentialInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:credentialInstance,field:'name')}"/>
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
