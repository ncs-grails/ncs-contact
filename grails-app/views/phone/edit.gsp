

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Phone</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Phone List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Phone</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Phone</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${phoneInstance}">
            <div class="errors">
                <g:renderErrors bean="${phoneInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${phoneInstance?.id}" />
                <input type="hidden" name="version" value="${phoneInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countryCode">Country Code:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneInstance,field:'countryCode','errors')}">
                                    <input type="text" maxlength="5" id="countryCode" name="countryCode" value="${fieldValue(bean:phoneInstance,field:'countryCode')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneInstance,field:'phoneNumber','errors')}">
                                    <input type="text" maxlength="10" id="phoneNumber" name="phoneNumber" value="${fieldValue(bean:phoneInstance,field:'phoneNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="extension">Extension:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneInstance,field:'extension','errors')}">
                                    <input type="text" maxlength="16" id="extension" name="extension" value="${fieldValue(bean:phoneInstance,field:'extension')}"/>
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
