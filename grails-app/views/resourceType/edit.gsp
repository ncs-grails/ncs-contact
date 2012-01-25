

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit ResourceType</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ResourceType List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ResourceType</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ResourceType</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${resourceTypeInstance}">
            <div class="errors">
                <g:renderErrors bean="${resourceTypeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${resourceTypeInstance?.id}" />
                <input type="hidden" name="version" value="${resourceTypeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:resourceTypeInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:resourceTypeInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prefix">Prefix:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:resourceTypeInstance,field:'prefix','errors')}">
                                    <input type="text" id="prefix" name="prefix" value="${fieldValue(bean:resourceTypeInstance,field:'prefix')}"/>
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
