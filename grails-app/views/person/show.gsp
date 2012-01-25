

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main" />
		<title>Show Person</title>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
			<span class="menuButton"><g:link class="list" action="list">Person List</g:link></span>
			<span class="menuButton"><g:link class="create" action="create">New Person</g:link></span>
		</div>
		<div class="body">
			<h1>Show Person</h1>
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<div class="dialog">
				<table>
					<tbody>

						<g:if test="${personInstance.image}">
							<tr class="prop">
								<td valign="top" class="value" colspan="2">
									<g:if test="${personInstance.image}">
										<img class="avatar" src="${createLink(controller:'image', action:'show', id: personInstance?.image?.id)}" />
									</g:if>
								</td>
							</tr>
						</g:if>

						<tr class="prop">
							<td valign="top" class="name">Names:</td>

							<td  valign="top" style="text-align:left;" class="value">
								<ul>
									<g:each var="n" in="${personInstance.names}">
										<li><g:link controller="name" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
									</g:each>
								</ul>
							</td>

						</tr>

						<g:if test="${personInstance.gender}">
							<tr class="prop">
								<td valign="top" class="name">Gender:</td>

								<td valign="top" class="value"><g:link controller="gender" action="show" id="${personInstance?.gender?.id}">${personInstance?.gender?.encodeAsHTML()}</g:link></td>
							</tr>
						</g:if>

						<g:if test="${personInstance.ethnicities}">
							<tr class="prop">
								<td valign="top" class="name">Ethnicities:</td>

								<td  valign="top" style="text-align:left;" class="value">
									<ul>
										<g:each var="e" in="${personInstance.ethnicities}">
											<li><g:link controller="ethnicity" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
								</td>
							</tr>
						</g:if>

						<g:if test="${personInstance.credentials}">
							<tr class="prop">
								<td valign="top" class="name">Credentials:</td>

								<td  valign="top" style="text-align:left;" class="value">
									<ul>
										<g:each var="c" in="${personInstance.credentials}">
											<li><g:link controller="credential" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
								</td>
							</tr>
						</g:if>

						<g:if test="${personInstance.birthDate}">
							<tr class="prop">
								<td valign="top" class="name">Born:</td>

								<td valign="top" class="value"><g:formatDate format="MM/dd/yyyy" date="${personInstance.birthDate}"/></td>

							</tr>
						</g:if>

						<g:if test="${personInstance.deathDate}">
							<tr class="prop">
								<td valign="top" class="name">Died:</td>

								<td valign="top" class="value"><g:formatDate format="MM/dd/yyyy" date="${personInstance.deathDate}"/></td>

							</tr>
						</g:if>

						<g:if test="${personInstance.units}">
							<tr class="prop">
								<td valign="top" class="name">Organizations:</td>

								<td  valign="top" style="text-align:left;" class="value">
									<ul class="">
										<g:each var="u" in="${personInstance.units}">
											<li><g:link controller="unitToPerson" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
								</td>

							</tr>
						</g:if>

						<g:if test="${personInstance.addresses}">
							<tr class="prop">
								<td valign="top" class="name">Addresses:</td>

								<td  valign="top" style="text-align:left;" class="value">
									<ul>
										<g:each var="a" in="${personInstance.addresses}">
											<li><g:link controller="addressToPerson" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
								</td>

							</tr>
						</g:if>

						<g:if test="${personInstance.phones}">
							<tr class="prop">
								<td valign="top" class="name">Phone Numbers:</td>

								<td  valign="top" style="text-align:left;" class="value">
									<ul>
										<g:each var="p" in="${personInstance.phones}">
											<li><g:link controller="phoneToPerson" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
								</td>
							</tr>
						</g:if>

						<g:if test="${personInstance.uris}">
							<tr class="prop">
								<td valign="top" class="name">URIs:</td>

								<td  valign="top" style="text-align:left;" class="value">
									<ul>
										<g:each var="u" in="${personInstance.uris}">
											<li><g:link controller="uniformResourceToPerson" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
								</td>
							</tr>
						</g:if>

						<g:if test="${personInstance.groups}">
							<tr class="prop">
								<td valign="top" class="name">Groups:</td>

								<td  valign="top" style="text-align:left;" class="value">
									<ul>
										<g:each var="g" in="${personInstance.groups}">
											<li><g:link controller="groupToPerson" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
								</td>
							</tr>
						</g:if>

						<g:if test="${personInstance.relatedPersons}">
							<tr class="prop">
								<td valign="top" class="name">Related People:</td>

								<td  valign="top" style="text-align:left;" class="value">
									<ul>
										<g:each var="r" in="${personInstance.relatedPersons}">
											<li><g:link controller="personToPerson" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
								</td>
							</tr>
						</g:if>

						<g:if test="${personInstance.ssn}">
							<tr class="prop">
								<td valign="top" class="name">Ssn:</td>

								<td valign="top" class="value"><g:link controller="socialSecurityNumber" action="show" id="${personInstance?.ssn?.id}">${personInstance?.ssn?.encodeAsHTML()}</g:link></td>

							</tr>
						</g:if>

						<tr class="prop">
							<td valign="top" class="name">Date Created:</td>

							<td valign="top" class="value"><g:formatDate format="M/d/yyyy h:mm a" date="${personInstance.dateCreated}"/></td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name">Last Updated:</td>

							<td valign="top" class="value"><g:formatDate format="M/d/yyyy h:mm a" date="${personInstance.lastUpdated}"/></td>

						</tr>

					</tbody>
				</table>
			</div>
			<div class="buttons">
				<g:form>
					<input type="hidden" name="id" value="${personInstance?.id}" />
					<span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
					<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
				</g:form>
			</div>
		</div>
	</body>
</html>
