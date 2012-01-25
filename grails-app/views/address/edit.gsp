

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Address</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Address List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Address</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Address</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${addressInstance}">
            <div class="errors">
                <g:renderErrors bean="${addressInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${addressInstance?.id}" />
                <input type="hidden" name="version" value="${addressInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="bottom" class="name">
                                    <label for="address">Address:</label>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'streetAddress','errors')}">
                                    <input type="text" maxlength="40" id="streetAddress" name="streetAddress" value="${fieldValue(bean:addressInstance,field:'streetAddress')}" size="40"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="bottom" class="name">
                                    <label for="address2">Address 2:</label>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'streetAddress2','errors')}">
                                    <input type="text" maxlength="40" id="streetAddress2" name="streetAddress2" value="${fieldValue(bean:addressInstance,field:'streetAddress2')}" size="40"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="bottom" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="bottom" class="name">
                                    <label for="state">State:</label>
                                </td>
                                <td valign="bottom" class="name">
                                    <label for="zipcode">Zipcode:</label>
                                </td>
                                <td valign="bottom" class="name">
                                    <label for="zip4">Zip4:</label>
                                </td>
                            </tr> 
                        
                        
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'city','errors')}">
                                    <input type="text" maxlength="30" id="city" name="city" value="${fieldValue(bean:addressInstance,field:'city')}"/>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'state','errors')}">
                                    <g:select optionKey="id" from="${State.list()}" name="state.id" value="${addressInstance?.state?.id}" ></g:select>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'zipcode','errors')}">
                                    <input type="text" id="zipcode" name="zipcode" value="${fieldValue(bean:addressInstance,field:'zipcode')}" size="6" />
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'zip4','errors')}">
                                    <input type="text" id="zip4" name="zip4" value="${fieldValue(bean:addressInstance,field:'zip4')}" size="5" />
                                </td>
                            </tr> 


                            <tr class="prop">
                                <td valign="bottom" class="name">
                                    <label for="city">Urbanization:</label>
                                </td>
                                <td valign="bottom" class="name">
                                    <label for="state">Province:</label>
                                </td>
                                <td valign="bottom" class="name">
                                    <label for="zipcode">Postal Code:</label>
                                </td>
                                <td valign="bottom" class="name">
                                    <label for="zip4">ZP4 Cleaned:</label>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'urbanization','errors')}">
                                    <input type="text" maxlength="40" id="urbanization" name="urbanization" value="${fieldValue(bean:addressInstance,field:'urbanization')}"/>
                                </td>

                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'province','errors')}">
                                    <input type="text" maxlength="30" id="province" name="province" value="${fieldValue(bean:addressInstance,field:'province')}"/>
                                </td>

                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'postalCode','errors')}">
                                    <input type="text" maxlength="16" id="postalCode" name="postalCode" value="${fieldValue(bean:addressInstance,field:'postalCode')}"/>
                                </td>

                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'zp4Cleaned','errors')}">
                                    <g:checkBox name="zp4Cleaned" value="${addressInstance?.zp4Cleaned}" ></g:checkBox>
                                </td>
                            </tr> 

                        
                        </tbody>
                    </table>
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="bottom" class="name">
                                    <label for="county">County:</label>
                                </td>
                                <td valign="bottom" class="name">
                                    <label for="country">Country:</label>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'county','errors')}">
                                    <input type="text" maxlength="30" id="county" name="county" value="${fieldValue(bean:addressInstance,field:'county')}"/>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'country','errors')}">
                                    <g:select optionKey="id" from="${Country.list()}" name="country.id" value="${addressInstance?.country?.id}" ></g:select>
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
