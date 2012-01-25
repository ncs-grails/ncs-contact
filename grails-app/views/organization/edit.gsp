

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Organization</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Organization List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Organization</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Organization</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${organizationInstance}">
            <div class="errors">
                <g:renderErrors bean="${organizationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${organizationInstance?.id}" />
                <input type="hidden" name="version" value="${organizationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:organizationInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nickName">Nick Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationInstance,field:'nickName','errors')}">
                                    <input type="text" id="nickName" name="nickName" value="${fieldValue(bean:organizationInstance,field:'nickName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="units">Units:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationInstance,field:'units','errors')}">
                                    
<ul>
<g:each var="u" in="${organizationInstance?.units?}">
    <li><g:link controller="organizationalUnit" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="organizationalUnit" params="['organization.id':organizationInstance?.id]" action="create">Add OrganizationalUnit</g:link>

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
