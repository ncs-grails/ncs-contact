

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit PhoneToPerson</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PhoneToPerson List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PhoneToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>Edit PhoneToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${phoneToPersonInstance}">
            <div class="errors">
                <g:renderErrors bean="${phoneToPersonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${phoneToPersonInstance?.id}" />
                <input type="hidden" name="version" value="${phoneToPersonInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone">Phone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'phone','errors')}">
                                    <g:select optionKey="id" from="${Phone.list()}" name="phone.id" value="${phoneToPersonInstance?.phone?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneType">Phone Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'phoneType','errors')}">
                                    <g:select optionKey="id" from="${PhoneType.list()}" name="phoneType.id" value="${phoneToPersonInstance?.phoneType?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:phoneToPersonInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${phoneToPersonInstance?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${phoneToPersonInstance?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${Person.list()}" name="person.id" value="${phoneToPersonInstance?.person?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source">Source:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'source','errors')}">
                                    <g:select name="source"
from="${Source.list()}"
size="5" multiple="yes" optionKey="id"
value="${phoneToPersonInstance?.source}" />

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
