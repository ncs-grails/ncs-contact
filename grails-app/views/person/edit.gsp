<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main" />
		<title>Edit Person</title>
		<g:javascript library="jquery" />
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
			<span class="menuButton"><g:link class="list" action="list">Person List</g:link></span>
			<span class="menuButton"><g:link class="create" action="create">New Person</g:link></span>
		</div>
		<div class="body">
			<h1>Edit Person</h1>
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personInstance}">
				<div class="errors">
					<g:renderErrors bean="${personInstance}" as="list" />
				</div>
			</g:hasErrors>
			<g:form method="post" >
				<input type="hidden" name="id" value="${personInstance?.id}" />
				<input type="hidden" name="version" value="${personInstance?.version}" />
				<div class="dialog">
					<table>
						<tbody>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="image">Image:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'image','errors')}">
									<g:if test="${personInstance?.image}">
										<img class="avatar" src="${createLink(controller:'image', action:'show', id: personInstance?.image?.id)}" />
									</g:if>	

									<g:link controller="person" params="['id':personInstance?.id]" action="select_image">Upload Image</g:link>
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="names">Names:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'names','errors')}">
									<ul>
										<g:each var="n" in="${personInstance?.names?}">
											<li><g:link controller="name" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
									<g:link controller="name" params="['person.id':personInstance?.id]" action="create">Add Name</g:link>
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="gender">Gender:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'gender','errors')}">
									<g:select optionKey="id" from="${Gender.list()}" name="gender.id" value="${personInstance?.gender?.id}" noSelection="['null':'']"></g:select>
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="ethnicities">Ethnicities:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'ethnicities','errors')}">
									<g:select name="ethnicities"
				   from="${Ethnicity.list()}"
				   size="5" multiple="yes" optionKey="id"
				   value="${personInstance?.ethnicities}" />

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="credentials">Credentials:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'credentials','errors')}">
									<g:select name="credentials"
				   from="${Credential.list()}"
				   size="5" multiple="yes" optionKey="id"
				   value="${personInstance?.credentials}" />

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="birthDate">Birth Date:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'birthDate','errors')}">
									<calendar:datePicker name="birthDate" value="${personInstance?.birthDate}" years="1850,2099" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="deathDate">Death Date:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'deathDate','errors')}">
									<calendar:datePicker name="deathDate" value="${personInstance?.deathDate}" years="1850,2099"  />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="addresses">Addresses:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'addresses','errors')}">

									<ul>
										<g:each var="a" in="${personInstance?.addresses?}">
											<li><g:link controller="addressToPerson" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
									<g:link controller="addressToPerson" params="['person.id':personInstance?.id]" action="create">Add AddressToPerson</g:link>

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="phones">Phones:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'phones','errors')}">

									<ul>
										<g:each var="p" in="${personInstance?.phones?}">
											<li><g:link controller="phoneToPerson" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
									<g:link controller="phoneToPerson" params="['person.id':personInstance?.id]" action="create">Add Phone</g:link>

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="uris">Uris:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'uris','errors')}">

									<ul>
										<g:each var="u" in="${personInstance?.uris?}">
											<li><g:link controller="uniformResourceToPerson" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
									<g:link controller="uniformResourceToPerson" params="['person.id':personInstance?.id]" action="create">Add Internet Contact</g:link>

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="groups">Groups:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'groups','errors')}">

									<ul>
										<g:each var="g" in="${personInstance?.groups?}">
											<li><g:link controller="groupToPerson" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
									<g:link controller="groupToPerson" params="['person.id':personInstance?.id]" action="create">Add Group</g:link>

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="relatedPersons">Related Persons:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'relatedPersons','errors')}">

									<ul>
										<g:each var="r" in="${personInstance?.relatedPersons?}">
											<li><g:link controller="personToPerson" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
									<g:link controller="personToPerson" params="['person.id':personInstance?.id]" action="create">Add Relation</g:link>

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="units">Units:</label>
								</td>
								<td valign="top" class="value ${hasErrors(bean:personInstance,field:'units','errors')}">

									<ul>
										<g:each var="u" in="${personInstance?.units?}">
											<li><g:link controller="unitToPerson" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
									<g:link controller="unitToPerson" params="['person.id':personInstance?.id]" action="create">Add Unit</g:link>

								</td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="buttons">
					<span class="button">
					    <g:link class="show" action="show" id="${personInstance.id}">Cancel</g:link>
					</span>
					<span class="button"><g:actionSubmit class="save" value="Update" /></span>
					<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
				</div>
			</g:form>
		</div>
	</body>
</html>
