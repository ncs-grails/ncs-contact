

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show UnitToPerson</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">UnitToPerson List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New UnitToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>Show UnitToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:unitToPersonInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Unit:</td>
                            
                            <td valign="top" class="value"><g:link controller="organizationalUnit" action="show" id="${unitToPersonInstance?.unit?.id}">${unitToPersonInstance?.unit?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Unit Role:</td>
                            
                            <td valign="top" class="value"><g:link controller="organizationalRole" action="show" id="${unitToPersonInstance?.unitRole?.id}">${unitToPersonInstance?.unitRole?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Preferred Order:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:unitToPersonInstance, field:'preferredOrder')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Start Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:unitToPersonInstance, field:'startDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">End Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:unitToPersonInstance, field:'endDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:unitToPersonInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:unitToPersonInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Person:</td>
                            
                            <td valign="top" class="value"><g:link controller="person" action="show" id="${unitToPersonInstance?.person?.id}">${unitToPersonInstance?.person?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Source:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${unitToPersonInstance.source}">
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
                    <input type="hidden" name="id" value="${unitToPersonInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
