

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create UnitToUnit</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UnitToUnit List</g:link></span>
        </div>
        <div class="body">
            <h1>Create UnitToUnit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${unitToUnitInstance}">
            <div class="errors">
                <g:renderErrors bean="${unitToUnitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
