

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create PersonToPerson</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PersonToPerson List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Relationship</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personToPersonInstance}">
            <div class="errors">
                <g:renderErrors bean="${personToPersonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean:personToPersonInstance,field:'relatedPerson','errors')}">
                                    <g:select optionKey="id" from="${Person.list()}" name="relatedPerson.id" value="${personToPersonInstance?.relatedPerson?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="relationship">... is ...</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:personToPersonInstance,field:'relationship','errors')}">
                                    <g:select optionKey="id" from="${PersonRelation.list()}" name="relationship.id" value="${personToPersonInstance?.relationship?.id}" ></g:select>
                                </td>
                            </tr> 

                            <g:hiddenField name="person.id"  id="person.id" value="${personToPersonInstance?.person?.id}" />
                            <tr class="prop">
                                <td valign="top" class="name">... of ...</td>
                                <td valign="top" class="value"><g:link controller="person" action="show" id="${personToPersonInstance?.person?.id}">${personToPersonInstance?.person?.encodeAsHTML()}</g:link></td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preferredOrder">Preferred Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:personToPersonInstance,field:'preferredOrder','errors')}">
                                    <input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:personToPersonInstance,field:'preferredOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:personToPersonInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${personToPersonInstance?.startDate}" precision="day" noSelection="['':'']"></g:datePicker>
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
