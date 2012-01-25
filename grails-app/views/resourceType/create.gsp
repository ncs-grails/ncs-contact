

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create ResourceType</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ResourceType List</g:link></span>
        </div>
        <div class="body">
            <h1>Create ResourceType</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${resourceTypeInstance}">
            <div class="errors">
                <g:renderErrors bean="${resourceTypeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
