

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create GroupToPerson</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">GroupToPerson List</g:link></span>
        </div>
        <div class="body">
            <h1>Create GroupToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${groupToPersonInstance}">
            <div class="errors">
                <g:renderErrors bean="${groupToPersonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="group">Group:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:groupToPersonInstance,field:'group','errors')}">
                                    <g:select optionKey="id" from="${Group.list()}" name="group.id" value="${groupToPersonInstance?.group?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:groupToPersonInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:groupToPersonInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:groupToPersonInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${groupToPersonInstance?.startDate}" precision="day" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <g:hiddenField name="person.id"  id="person.id" value="${groupToPersonInstance?.person?.id}" />
                            <tr class="prop">
                                <td valign="top" class="name">Person:</td>
                                <td valign="top" class="value"><g:link controller="person" action="show" id="${groupToPersonInstance?.person?.id}">${groupToPersonInstance?.person?.encodeAsHTML()}</g:link></td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="role">Role:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:groupToPersonInstance,field:'role','errors')}">
                                    <g:select optionKey="id" from="${GroupRole.list()}" name="role.id" value="${groupToPersonInstance?.role?.id}" ></g:select>
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
