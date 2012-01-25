

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show PhoneToPerson</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PhoneToPerson List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PhoneToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>Show PhoneToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:phoneToPersonInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Phone Number:</td>
                            
                            <td valign="top" class="value"><g:link controller="phone" action="show" id="${phoneToPersonInstance?.phone?.id}">${phoneToPersonInstance?.phone?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Phone Type:</td>
                            
                            <td valign="top" class="value"><g:link controller="phoneType" action="show" id="${phoneToPersonInstance?.phoneType?.id}">${phoneToPersonInstance?.phoneType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Preferred Order:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:phoneToPersonInstance, field:'preferredOrder')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Start Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:phoneToPersonInstance, field:'startDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">End Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:phoneToPersonInstance, field:'endDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:phoneToPersonInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:phoneToPersonInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Person:</td>
                            
                            <td valign="top" class="value"><g:link controller="person" action="show" id="${phoneToPersonInstance?.person?.id}">${phoneToPersonInstance?.person?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Source:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${phoneToPersonInstance.source}">
                                    <li><g:link controller="source" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${phoneToPersonInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
