

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create OrganizationalUnit</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">OrganizationalUnit List</g:link></span>
        </div>
        <div class="body">
            <h1>Create OrganizationalUnit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${organizationalUnitInstance}">
            <div class="errors">
                <g:renderErrors bean="${organizationalUnitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:organizationalUnitInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nickName">Nick Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'nickName','errors')}">
                                    <input type="text" id="nickName" name="nickName" value="${fieldValue(bean:organizationalUnitInstance,field:'nickName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organization">Organization:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'organization','errors')}">
                                    <g:select optionKey="id" from="${Organization.list()}" name="organization.id" value="${organizationalUnitInstance?.organization?.id}" ></g:select>
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
