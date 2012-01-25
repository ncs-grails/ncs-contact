

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit State</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">State List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New State</g:link></span>
        </div>
        <div class="body">
            <h1>Edit State</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stateInstance}">
            <div class="errors">
                <g:renderErrors bean="${stateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${stateInstance?.id}" />
                <input type="hidden" name="version" value="${stateInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stateInstance,field:'name','errors')}">
                                    <input type="text" maxlength="30" id="name" name="name" value="${fieldValue(bean:stateInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="abbreviation">Abbreviation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stateInstance,field:'abbreviation','errors')}">
                                    <input type="text" maxlength="2" id="abbreviation" name="abbreviation" value="${fieldValue(bean:stateInstance,field:'abbreviation')}"/>
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
