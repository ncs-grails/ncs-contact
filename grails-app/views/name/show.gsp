

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Name</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Name List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Name</g:link></span>
        </div>
        <div class="body">
            <h1>Show Name</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nameInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value"><g:link controller="title" action="show" id="${nameInstance?.title?.id}">${nameInstance?.title?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">First Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nameInstance, field:'firstName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Middle Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nameInstance, field:'middleName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nameInstance, field:'lastName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Suffix:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nameInstance, field:'suffix')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nameInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:nameInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name Type:</td>
                            
                            <td valign="top" class="value"><g:link controller="nameType" action="show" id="${nameInstance?.nameType?.id}">${nameInstance?.nameType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Person:</td>
                            
                            <td valign="top" class="value"><g:link controller="person" action="show" id="${nameInstance?.person?.id}">${nameInstance?.person?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${nameInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
