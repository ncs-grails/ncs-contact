

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create UniformResourceToPerson</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UniformResourceToPerson List</g:link></span>
        </div>
        <div class="body">
            <h1>Create UniformResourceToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${uniformResourceToPersonInstance}">
            <div class="errors">
                <g:renderErrors bean="${uniformResourceToPersonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">

                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uri.url">URL:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:uniformResourceInstance,field:'uri.url','errors')}">
                                    <input type="text" id="uri.url" name="uri.url" value="${fieldValue(bean:uniformResourceInstance,field:'uri.url')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>


                    <table>
                        <tbody>
                        
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
                                    <g:datePicker name="startDate" value="${uniformResourceToPersonInstance?.startDate}" precision="day" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <g:hiddenField name="person.id"  id="person.id" value="${uniformResourceToPersonInstance?.person?.id}" />
                            <tr class="prop">
                                <td valign="top" class="name">Person:</td>
                                <td valign="top" class="value"><g:link controller="person" action="show" id="${uniformResourceToPersonInstance?.person?.id}">${uniformResourceToPersonInstance?.person?.encodeAsHTML()}</g:link></td>
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
