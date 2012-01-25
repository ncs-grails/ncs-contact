

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit UniformResourceToPerson</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UniformResourceToPerson List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New UniformResourceToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>Edit UniformResourceToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${uniformResourceToPersonInstance}">
            <div class="errors">
                <g:renderErrors bean="${uniformResourceToPersonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${uniformResourceToPersonInstance?.id}" />
                <input type="hidden" name="version" value="${uniformResourceToPersonInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uri">Uri:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToPersonInstance,field:'uri','errors')}">
                                    <g:select optionKey="id" from="${UniformResource.list()}" name="uri.id" value="${uniformResourceToPersonInstance?.uri?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uriType">Uri Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToPersonInstance,field:'uriType','errors')}">
                                    <g:select optionKey="id" from="${ResourceType.list()}" name="uriType.id" value="${uniformResourceToPersonInstance?.uriType?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToPersonInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:uniformResourceToPersonInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToPersonInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${uniformResourceToPersonInstance?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToPersonInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${uniformResourceToPersonInstance?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="person">Person:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToPersonInstance,field:'person','errors')}">
                                    <g:select optionKey="id" from="${Person.list()}" name="person.id" value="${uniformResourceToPersonInstance?.person?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source">Source:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceToPersonInstance,field:'source','errors')}">
                                    <g:select name="source"
from="${Source.list()}"
size="5" multiple="yes" optionKey="id"
value="${uniformResourceToPersonInstance?.source}" />

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
