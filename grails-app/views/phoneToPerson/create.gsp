

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main" />
		<title>Create PhoneToPerson</title>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
			<span class="menuButton"><g:link class="list" action="list">PhoneToPerson List</g:link></span>
		</div>
		<div class="body">
			<h1>Create PhoneToPerson</h1>
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${phoneToPersonInstance}">
				<div class="errors">
					<g:renderErrors bean="${phoneToPersonInstance}" as="list" />
				</div>
			</g:hasErrors>
			<g:form action="save" method="post" >
				<div class="dialog">
					<table>
						<tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countryCode">Country:</label>
                                </td>
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="name">
                                    <label for="extension">Extension:</label>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'phone.countryCode','errors')}">
                                    <input type="text" maxlength="5" id="phone.countryCode" name="phone.countryCode" value="${fieldValue(bean:phoneToPersonInstance,field:'phone.countryCode')}" size="4"/>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'phone.phoneNumber','errors')}">
                                    <input type="text" maxlength="10" id="phone.phoneNumber" name="phone.phoneNumber" value="${fieldValue(bean:phoneToPersonInstance,field:'phone.phoneNumber')}" size="11"/>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'phone.extension','errors')}">
                                    <input type="text" maxlength="16" id="phone.extension" name="phone.extension" value="${fieldValue(bean:phoneToPersonInstance,field:'phone.extension')}" size="6"/>
                                </td>
                            </tr> 

						</tbody>
					</table>
					<table>
						<tbody>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="phoneType">Phone Type:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'phoneType','errors')}">
									<g:select optionKey="id" from="${PhoneType.list()}" name="phoneType.id" value="${phoneToPersonInstance?.phoneType?.id}" ></g:select>
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="preferredOrder">Preferred Order:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'preferredOrder','errors')}">
									<input type="text" id="preferredOrder" name="preferredOrder" value="${fieldValue(bean:phoneToPersonInstance,field:'preferredOrder')}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="startDate">Start Date:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:phoneToPersonInstance,field:'startDate','errors')}">
									<g:datePicker name="startDate" value="${phoneToPersonInstance?.startDate}" noSelection="['':'']" precision="day"></g:datePicker>
								</td>
							</tr>

                            <g:hiddenField name="person.id"  id="person.id" value="${phoneToPersonInstance?.person?.id}" />
                            <tr class="prop">
                                <td valign="top" class="name">Person:</td>
                                <td valign="top" class="value"><g:link controller="person" action="show" id="${phoneToPersonInstance?.person?.id}">${phoneToPersonInstance?.person?.encodeAsHTML()}</g:link></td>
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
