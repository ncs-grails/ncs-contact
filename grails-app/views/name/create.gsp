

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Name</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Name List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Name</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${nameInstance}">
            <div class="errors">
                <g:renderErrors bean="${nameInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nameInstance,field:'title','errors')}">
                                    <g:select optionKey="id" from="${Title.list()}" name="title.id" value="${nameInstance?.title?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nameInstance,field:'firstName','errors')}">
                                    <input type="text" maxlength="30" id="firstName" name="firstName" value="${fieldValue(bean:nameInstance,field:'firstName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="middleName">Middle Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nameInstance,field:'middleName','errors')}">
                                    <input type="text" maxlength="20" id="middleName" name="middleName" value="${fieldValue(bean:nameInstance,field:'middleName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName">Last Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nameInstance,field:'lastName','errors')}">
                                    <input type="text" maxlength="30" id="lastName" name="lastName" value="${fieldValue(bean:nameInstance,field:'lastName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="suffix">Suffix:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nameInstance,field:'suffix','errors')}">
                                    <input type="text" maxlength="10" id="suffix" name="suffix" value="${fieldValue(bean:nameInstance,field:'suffix')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nameType">Name Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:nameInstance,field:'nameType','errors')}">
                                    <g:select optionKey="id" from="${NameType.list()}" name="nameType.id" value="${nameInstance?.nameType?.id}" ></g:select>
                                </td>
                            </tr> 
							<g:hiddenField name="person.id"  id="person.id" value="${nameInstance?.person?.id}" />
                        
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
