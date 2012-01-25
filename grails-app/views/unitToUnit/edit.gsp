

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit UnitToUnit</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UnitToUnit List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New UnitToUnit</g:link></span>
        </div>
        <div class="body">
            <h1>Edit UnitToUnit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${unitToUnitInstance}">
            <div class="errors">
                <g:renderErrors bean="${unitToUnitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${unitToUnitInstance?.id}" />
                <input type="hidden" name="version" value="${unitToUnitInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="relatedUnit">Related Unit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToUnitInstance,field:'relatedUnit','errors')}">
                                    <g:select optionKey="id" from="${OrganizationalUnit.list()}" name="relatedUnit.id" value="${unitToUnitInstance?.relatedUnit?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="relationship">Relationship:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToUnitInstance,field:'relationship','errors')}">
                                    <g:select optionKey="id" from="${UnitRelation.list()}" name="relationship.id" value="${unitToUnitInstance?.relationship?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToUnitInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:unitToUnitInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToUnitInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${unitToUnitInstance?.startDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToUnitInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${unitToUnitInstance?.endDate}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organizationalUnit">Organizational Unit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToUnitInstance,field:'organizationalUnit','errors')}">
                                    <g:select optionKey="id" from="${OrganizationalUnit.list()}" name="organizationalUnit.id" value="${unitToUnitInstance?.organizationalUnit?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="source">Source:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:unitToUnitInstance,field:'source','errors')}">
                                    <g:select name="source"
from="${Source.list()}"
size="5" multiple="yes" optionKey="id"
value="${unitToUnitInstance?.source}" />

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
