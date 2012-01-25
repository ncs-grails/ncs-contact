

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Phone</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Phone List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Phone</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${phoneInstance}">
            <div class="errors">
                <g:renderErrors bean="${phoneInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countryCode">Country:</label>
                                </td>
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="name">
                                    <label for="extension">Extension:</label>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean:phoneInstance,field:'countryCode','errors')}">
                                    <input type="text" maxlength="5" id="countryCode" name="countryCode" value="${fieldValue(bean:phoneInstance,field:'countryCode')}" size="4"/>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneInstance,field:'phoneNumber','errors')}">
                                    <input type="text" maxlength="10" id="phoneNumber" name="phoneNumber" value="${fieldValue(bean:phoneInstance,field:'phoneNumber')}" size="11"/>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneInstance,field:'extension','errors')}">
                                    <input type="text" maxlength="16" id="extension" name="extension" value="${fieldValue(bean:phoneInstance,field:'extension')}" size="6"/>
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
