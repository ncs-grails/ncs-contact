

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit PersonRelation</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PersonRelation List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PersonRelation</g:link></span>
        </div>
        <div class="body">
            <h1>Edit PersonRelation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personRelationInstance}">
            <div class="errors">
                <g:renderErrors bean="${personRelationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${personRelationInstance?.id}" />
                <input type="hidden" name="version" value="${personRelationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:personRelationInstance,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:personRelationInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inverseRelation">Inverse Relation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:personRelationInstance,field:'inverseRelation','errors')}">
                                    <g:select optionKey="id" from="${PersonRelation.list()}" name="inverseRelation.id" value="${personRelationInstance?.inverseRelation?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:personRelationInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${personRelationInstance?.dateCreated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:personRelationInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${personRelationInstance?.lastUpdated}" ></g:datePicker>
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
