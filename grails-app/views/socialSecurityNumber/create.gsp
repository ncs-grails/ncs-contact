

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create SocialSecurityNumber</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">SocialSecurityNumber List</g:link></span>
        </div>
        <div class="body">
            <h1>Create SocialSecurityNumber</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${socialSecurityNumberInstance}">
            <div class="errors">
                <g:renderErrors bean="${socialSecurityNumberInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ssn">Ssn:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:socialSecurityNumberInstance,field:'ssn','errors')}">
                                    <input type="text" maxlength="11" id="ssn" name="ssn" value="${fieldValue(bean:socialSecurityNumberInstance,field:'ssn')}"/>
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
