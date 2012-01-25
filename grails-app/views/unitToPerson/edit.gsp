

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit UnitToPerson</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UnitToPerson List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New UnitToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>Edit UnitToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${unitToPersonInstance}">
            <div class="errors">
                <g:renderErrors bean="${unitToPersonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${unitToPersonInstance?.id}" />
                <input type="hidden" name="version" value="${unitToPersonInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unit">Unit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToPersonInstance,field:'unit','errors')}">
                                    <g:select optionKey="id" from="${OrganizationalUnit.list()}" name="unit.id" value="${unitToPersonInstance?.unit?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unitRole">Unit Role:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToPersonInstance,field:'unitRole','errors')}">
                                    <g:select optionKey="id" from="${OrganizationalRole.list()}" name="unitRole.id" value="${unitToPersonInstance?.unitRole?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToPersonInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:unitToPersonInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToPersonInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${unitToPersonInstance?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToPersonInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${unitToPersonInstance?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToPersonInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${Person.list()}" name="person.id" value="${unitToPersonInstance?.person?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source">Source:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToPersonInstance,field:'source','errors')}">
                                    <g:select name="source"
from="${Source.list()}"
size="5" multiple="yes" optionKey="id"
value="${unitToPersonInstance?.source}" />

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
