

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show GroupToPerson</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">GroupToPerson List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New GroupToPerson</g:link></span>
        </div>
        <div class="body">
            <h1>Show GroupToPerson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:groupToPersonInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Group:</td>
                            
                            <td valign="top" class="value"><g:link controller="group" action="show" id="${groupToPersonInstance?.group?.id}">${groupToPersonInstance?.group?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Preferred Order:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:groupToPersonInstance, field:'preferredOrder')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Start Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:groupToPersonInstance, field:'startDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">End Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:groupToPersonInstance, field:'endDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:groupToPersonInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:groupToPersonInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Person:</td>
                            
                            <td valign="top" class="value"><g:link controller="person" action="show" id="${groupToPersonInstance?.person?.id}">${groupToPersonInstance?.person?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Role:</td>
                            
                            <td valign="top" class="value"><g:link controller="groupRole" action="show" id="${groupToPersonInstance?.role?.id}">${groupToPersonInstance?.role?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Source:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${groupToPersonInstance.source}">
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
                    <input type="hidden" name="id" value="${groupToPersonInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
