

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit PhoneToUnit</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PhoneToUnit List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PhoneToUnit</g:link></span>
        </div>
        <div class="body">
            <h1>Edit PhoneToUnit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${phoneToUnitInstance}">
            <div class="errors">
                <g:renderErrors bean="${phoneToUnitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${phoneToUnitInstance?.id}" />
                <input type="hidden" name="version" value="${phoneToUnitInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToUnitInstance,field:'phoneNumber','errors')}">
                                    <g:select optionKey="id" from="${Phone.list()}" name="phoneNumber.id" value="${phoneToUnitInstance?.phoneNumber?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneType">Phone Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToUnitInstance,field:'phoneType','errors')}">
                                    <g:select optionKey="id" from="${PhoneType.list()}" name="phoneType.id" value="${phoneToUnitInstance?.phoneType?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToUnitInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:phoneToUnitInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToUnitInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${phoneToUnitInstance?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToUnitInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${phoneToUnitInstance?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source">Source:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToUnitInstance,field:'source','errors')}">
                                    <g:select name="source"
from="${Source.list()}"
size="5" multiple="yes" optionKey="id"
value="${phoneToUnitInstance?.source}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unit">Unit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToUnitInstance,field:'unit','errors')}">
                                    <g:select optionKey="id" from="${OrganizationalUnit.list()}" name="unit.id" value="${phoneToUnitInstance?.unit?.id}" ></g:select>
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
