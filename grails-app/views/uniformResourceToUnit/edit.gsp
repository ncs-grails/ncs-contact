

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit UniformResourceToUnit</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UniformResourceToUnit List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New UniformResourceToUnit</g:link></span>
        </div>
        <div class="body">
            <h1>Edit UniformResourceToUnit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${uniformResourceToUnitInstance}">
            <div class="errors">
                <g:renderErrors bean="${uniformResourceToUnitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${uniformResourceToUnitInstance?.id}" />
                <input type="hidden" name="version" value="${uniformResourceToUnitInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uri">Uri:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToUnitInstance,field:'uri','errors')}">
                                    <g:select optionKey="id" from="${UniformResource.list()}" name="uri.id" value="${uniformResourceToUnitInstance?.uri?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uriType">Uri Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToUnitInstance,field:'uriType','errors')}">
                                    <g:select optionKey="id" from="${ResourceType.list()}" name="uriType.id" value="${uniformResourceToUnitInstance?.uriType?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToUnitInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:uniformResourceToUnitInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToUnitInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${uniformResourceToUnitInstance?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToUnitInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${uniformResourceToUnitInstance?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source">Source:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToUnitInstance,field:'source','errors')}">
                                    <g:select name="source"
from="${Source.list()}"
size="5" multiple="yes" optionKey="id"
value="${uniformResourceToUnitInstance?.source}" />

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unit">Unit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToUnitInstance,field:'unit','errors')}">
                                    <g:select optionKey="id" from="${OrganizationalUnit.list()}" name="unit.id" value="${uniformResourceToUnitInstance?.unit?.id}" ></g:select>
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
