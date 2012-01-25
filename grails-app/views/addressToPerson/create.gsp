<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main" />
	<title>New Address for Person</title>
		<g:javascript library="jquery" />
		<g:javascript library="zp4" />
  </head>
  <body>
	<div class="nav">
	  <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
	  <span class="menuButton"><g:link class="list" action="list">AddressToPerson List</g:link></span>
	</div>
	<div class="body">
	  <h1>Create AddressToPerson</h1>
	  <g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	  </g:if>
	  <g:hasErrors bean="${addressToPersonInstance}">
		<div class="errors">
		  <g:renderErrors bean="${addressToPersonInstance}" as="list" />
		</div>
	  </g:hasErrors>
	  <g:form action="save" method="post" >
		<div class="dialog">
		  <!-- Begin deliveryAddress Properties -->
		  <table>
			<tbody>
			  <tr class="prop">
				<td><label for="enableZP4">Standardize Address</label></td>
				<td><g:checkBox name="enableZP4" value="${true}" /></td>
			  </tr>
			  <tr class="prop">
				<td valign="bottom" class="name">
				  <label for="address">Address:</label> 
			</td>
			</tr>
			<tr class="prop">
			  <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'streetAddress','errors')}">
				<input type="text" maxlength="40" id="Address.streetAddress" name="address.streetAddress" value="${fieldValue(bean:addressInstance,field:'streetAddress')}" size="40"/>
			  </td>
			</tr>

			<tr class="prop">
			  <td valign="bottom" class="name">
				<label for="address2">Address2:</label>
			  </td>
			</tr>
			<tr class="prop">
			  <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'streetAddress2','errors')}">
				<input type="text" maxlength="40" id="address.streetAddress2" name="address.streetAddress2" value="${fieldValue(bean:addressInstance,field:'streetAddress2')}" size="40"/>
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
				  <input type="text" maxlength="30" id="address.city" name="address.city" value="${fieldValue(bean:addressInstance,field:'city')}"/>
				</td>
				<td valign="top" class="value ${hasErrors(bean:addressInstance,field:'state','errors')}">
			<g:select optionKey="id" from="${State.list()}" name="address.state.id" value="${addressInstance?.state?.id}" ></g:select>
			</td>
			<td valign="top" class="value ${hasErrors(bean:addressInstance,field:'zipcode','errors')}">
			  <input type="text" id="address.zipcode" name="address.zipcode" value="${fieldValue(bean:addressInstance,field:'zipcode')}" size="6" />
			</td>
			<td valign="top" class="value ${hasErrors(bean:addressInstance,field:'zip4','errors')}">
			  <input type="text" id="address.zip4" name="address.zip4" value="${fieldValue(bean:addressInstance,field:'zip4')}" size="5" />
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
				<input type="text" maxlength="40" id="address.urbanization" name="address.urbanization" value="${fieldValue(bean:addressInstance,field:'urbanization')}"/>
			  </td>

			  <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'province','errors')}">
				<input type="text" maxlength="30" id="address.province" name="address.province" value="${fieldValue(bean:addressInstance,field:'province')}"/>
			  </td>

			  <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'postalCode','errors')}">
				<input type="text" maxlength="16" id="address.postalCode" name="address.postalCode" value="${fieldValue(bean:addressInstance,field:'postalCode')}"/>
			  </td>

			  <td valign="top" class="value ${hasErrors(bean:addressInstance,field:'zp4Cleaned','errors')}">
			<g:checkBox name="address.zp4Cleaned" value="${addressInstance?.zp4Cleaned}" ></g:checkBox>
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
				  <input type="text" maxlength="30" id="address.county" name="address.county" value="${fieldValue(bean:addressInstance,field:'county')}"/>
				</td>
				<td valign="top" class="value ${hasErrors(bean:addressInstance,field:'country','errors')}">
			<g:select optionKey="id" from="${Country.list()}" name="address.country.id" value="${addressInstance?.country?.id}" ></g:select>
			</td>
			</tr>

			</tbody>
		  </table>

		  <!-- Begin Address to Person Mapping Properties -->

		  <table>
			<tbody>

			  <tr class="prop">
				<td valign="top" class="name">
				  <label for="addressType">Address Type:</label>
				</td>
				<td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'deliveryAddress.addressType','errors')}">
			<g:select optionKey="id" from="${AddressType.list()}" name="addressToPerson.addressType.id" value="${addressToPersonInstance?.addressType?.id}" ></g:select>
			</td>
			</tr>

			<tr class="prop">
			  <td valign="top" class="name">
				<label for="preferredOrder">Preferred Order:</label>
			  </td>
			  <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'deliveryAddress.preferredOrder','errors')}">
				<input type="text" id="addressToPerson.preferredOrder" name="addressToPerson.preferredOrder" value="${fieldValue(bean:addressToPersonInstance,field:'preferredOrder')}" />
			  </td>
			</tr>

			<tr class="prop">
			  <td valign="top" class="name">
				<label for="startDate">Start Date:</label>
			  </td>
			  <td valign="top" class="value ${hasErrors(bean:addressToPersonInstance,field:'deliveryAddress.startDate','errors')}">
			  <calendar:datePicker name="startDate" value="${addressToPerson?.startDate}"/>
			</td>
			</tr>

			<g:hiddenField name="addressToPerson.person.id"  id="addressToPerson.person.id" value="${addressToPersonInstance?.person?.id}" />
			<tr class="prop">
			  <td valign="top" class="name">Person:</td>
			  <td valign="top" class="value"><g:link controller="person" action="show" id="${addressToPersonInstance?.person?.id}">${addressToPersonInstance?.person?.encodeAsHTML()}</g:link></td>
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
