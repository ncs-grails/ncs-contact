

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit AddressToPerson</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">AddressToPerson List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New AddressToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>Edit AddressToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${addressToPersonInstance}">
            <div class="errors">
                <g:renderErrors bean="${addressToPersonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${addressToPersonInstance?.id}" />
                <input type="hidden" name="version" value="${addressToPersonInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="deliveryAddress">Delivery Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'deliveryAddress','errors')}">
                                    <g:select optionKey="id" from="${Address.list()}" name="deliveryAddress.id" value="${addressToPersonInstance?.deliveryAddress?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addressType">Address Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'addressType','errors')}">
                                    <g:select optionKey="id" from="${AddressType.list()}" name="addressType.id" value="${addressToPersonInstance?.addressType?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:addressToPersonInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${addressToPersonInstance?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${addressToPersonInstance?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${Person.list()}" name="person.id" value="${addressToPersonInstance?.person?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source">Source:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'source','errors')}">
                                    <g:select name="source"
from="${Source.list()}"
size="5" multiple="yes" optionKey="id"
value="${addressToPersonInstance?.source}" />

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
