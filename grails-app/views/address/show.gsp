

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Address</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Address List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Address</g:link></span>
        </div>
        <div class="body">
            <h1>Show Address</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Address:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'streetAddress')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Address 2:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'streetAddress2')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Urbanization:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'urbanization')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">City:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'city')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Province:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'province')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Zipcode:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'zipcode')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Zip4:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'zip4')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Postal Code:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'postalCode')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">County:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'county')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Country:</td>
                            
                            <td valign="top" class="value"><g:link controller="country" action="show" id="${addressInstance?.country?.id}">${addressInstance?.country?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">State:</td>
                            
                            <td valign="top" class="value"><g:link controller="state" action="show" id="${addressInstance?.state?.id}">${addressInstance?.state?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Zp4 Cleaned:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:addressInstance, field:'zp4Cleaned')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${addressInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
