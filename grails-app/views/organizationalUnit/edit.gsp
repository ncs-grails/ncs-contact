

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit OrganizationalUnit</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">OrganizationalUnit List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New OrganizationalUnit</g:link></span>
        </div>
        <div class="body">
            <h1>Edit OrganizationalUnit</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${organizationalUnitInstance}">
            <div class="errors">
                <g:renderErrors bean="${organizationalUnitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${organizationalUnitInstance?.id}" />
                <input type="hidden" name="version" value="${organizationalUnitInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:organizationalUnitInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="relatedUnits">Related Units:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'relatedUnits','errors')}">
                                    
<ul>
<g:each var="r" in="${organizationalUnitInstance?.relatedUnits?}">
    <li><g:link controller="unitToUnit" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="unitToUnit" params="['organizationalUnit.id':organizationalUnitInstance?.id]" action="create">Add UnitToUnit</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addresses">Addresses:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'addresses','errors')}">
                                    
<ul>
<g:each var="a" in="${organizationalUnitInstance?.addresses?}">
    <li><g:link controller="addressToUnit" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="addressToUnit" params="['organizationalUnit.id':organizationalUnitInstance?.id]" action="create">Add AddressToUnit</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phones">Phones:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'phones','errors')}">
                                    
<ul>
<g:each var="p" in="${organizationalUnitInstance?.phones?}">
    <li><g:link controller="phoneToUnit" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="phoneToUnit" params="['organizationalUnit.id':organizationalUnitInstance?.id]" action="create">Add PhoneToUnit</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uris">Uris:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'uris','errors')}">
                                    
<ul>
<g:each var="u" in="${organizationalUnitInstance?.uris?}">
    <li><g:link controller="uniformResourceToUnit" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="uniformResourceToUnit" params="['organizationalUnit.id':organizationalUnitInstance?.id]" action="create">Add UniformResourceToUnit</g:link>

                                </td>
                            </tr> 
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nickName">Nick Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'nickName','errors')}">
                                    <input type="text" id="nickName" name="nickName" value="${fieldValue(bean:organizationalUnitInstance,field:'nickName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organization">Organization:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:organizationalUnitInstance,field:'organization','errors')}">
                                    <g:select optionKey="id" from="${Organization.list()}" name="organization.id" value="${organizationalUnitInstance?.organization?.id}" ></g:select>
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
