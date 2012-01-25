

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Contact Navigator</title>
		<g:javascript library="jquery" />
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'navigate.css')}" type="text/css" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
			<span class="menuButton"><g:link class="list" controller="navigate">Browser</g:link></span>
        </div>
        <div id="container" class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div id="leftnav">
                <div id="navFilter" class="roundrect search navItem">
                    <h1>Search
                        <g:textField size="10" name="navFilter" />
                        <g:actionSubmit value="Go" />
                    </h1>
                </div>
                <div id="groupList" class="roundrect group navItem">
                    <h1>Groups</h1>
                    <ul class="root">
                        <g:each in="${groupCategoryInstanceList}" status="i" var="groupCategoryInstance">
                            <li>
                                ${fieldValue(bean:groupCategoryInstance, field:'name')}
                                <ul>
                                    <g:each in="${groupCategoryInstance.groups.sort{it.name}}" status="j" var="groupInstance">                                        <li style="font-size: 0.85em;">
                                            <g:link action="group" id="${groupInstance.id}">${fieldValue(bean:groupInstance, field:'nickName')}</g:link>
                                        </li>
                                    </g:each>                        
                                </ul>
                            </li>
                        </g:each>                        
                    </ul>
                </div>
                <div id="orgList" class="roundrect institution navItem">
                    <h1>Organizations</h1>
                    <ul class="root">
                        <g:each in="${organizationInstanceList}" status="i" var="organizationInstance">
                            <li style="font-size: 0.9em;">
                                <g:link action="org" id="${organizationInstance.id}">${fieldValue(bean:organizationInstance, field:'name')}</g:link>
                                <ul>
                                    <g:each in="${organizationInstance.units.sort{it.name}}" status="j" var="unitInstance">
                                        <g:if test="${!unitInstance.umbrella}">
                                            <li style="font-size: 0.9em;">
                                                <g:link action="unit" id="${unitInstance.id}">${fieldValue(bean:unitInstance, field:'name')}</g:link>
                                            </li>
                                        </g:if>
                                    </g:each>                        
                                </ul>
                            </li>
                        </g:each>                        
                    </ul>
                
                </div>
            </div>
            <div id="content">
            
                <g:if test="${noneSelected}">
                    <!-- No content -->
                    <div id="contentNone" class="roundrect nonefound entity">
                        <h1>Contact Browser</h1>
                        Please choose a group or organization from the left.  
                        You can also enter an item into the filter field to find a specific item or group.
                    </div>
                </g:if>

                <g:if test="${groupInstance}">
                    <div id="contentGroup" class="roundrect group entity">
                        <h1>${groupInstance.name}</h1>
                        <h2>${groupInstance.nickName}</h2>

						<ul>
							<g:each var="m" in="${groupInstance.members.sort{ it.person.getPreferredName()?.toString()}}">
						        <div class="roundrect person entity">
						            <h1>
	                                    <g:link action="person" id="${m.person.id}">
											${m.person.getPreferredName()?.toString()?.encodeAsHTML()}
										</g:link>
									</h1>
					                <p>${m.role.name}</p>
								</div>
							</g:each>
						</ul>
                    </div>
                </g:if>

                <g:if test="${organizationInstance}">
	                <div id="contentOrganization" class="roundrect institution entity">
	                    <h1>${fieldValue(bean:organizationInstance, field:'name')}</h1>
		                <h2>${fieldValue(bean:organizationInstance, field:'nickName')}</h2>
	                    <ul>
	                        <g:each in="${organizationInstance.units.sort{it.name}}" status="j" var="unitInstance">
	                            <g:if test="${!unitInstance.umbrella}">
					                <div class="roundrect institution entity">
	                                    <h1>${fieldValue(bean:unitInstance, field:'name')}</h1>
	                                    <p>
	                                        <g:if test="${fieldValue(bean:unitInstance, field:'nickName')}">
    		                                    (${fieldValue(bean:unitInstance, field:'nickName')})
		                                    </g:if>
		                                    <g:link action="unit" id="${unitInstance.id}">Unit Details...</g:link>
	                                    </p>
					                </div>
	                            </g:if>
	                        </g:each>                        
	                    </ul>
	                </div>
                </g:if>

                <g:if test="${unitInstance}">
	                <div id="contentUnit" class="roundrect institution entity">
	                    <h1>${fieldValue(bean:unitInstance, field:'name')}</h1>
                        <g:if test="${fieldValue(bean:unitInstance, field:'nickName')}">
    		                <h2>( ${fieldValue(bean:unitInstance, field:'nickName')} ) </h2>
                        </g:if>

	                        <g:each in="${unitInstance.people.sort{it.person.getPreferredName().toString()}}" status="i" var="unitToPersonInstance">
						        <div class="roundrect person entity">
						            <h1>
	                                    <g:link action="person" id="${unitToPersonInstance.person.id}">
											${unitToPersonInstance.person.getPreferredName()?.toString()?.encodeAsHTML()}
										</g:link>
									</h1>
						            
						                <p>
							                ${unitToPersonInstance.unitRole.name}
										</p>
								</div>
	                        </g:each>                        

	                </div>
                </g:if>

                <g:if test="${personInstance}">
                    <div id="contentPerson" class="roundrect person entity">
                        <h1>
                            ${personInstance.getPreferredName()?.toString()?.encodeAsHTML()}
                            <g:link class="editentity" controller="person" action="edit" id="${personInstance.id}">edit</g:link>
                        </h1>
                        
                            <g:if test="${personInstance.gender}">
                                <p>
	    						    <span class="name">Gender:</span>
    							    <span class="value">${personInstance.gender}</span>
							    </p>
                            </g:if>

                            <g:if test="${personInstance.birthDate}">
                                <p>
        							<span class="name">Age:</span>
        							<span class="value">${personInstance.age()}</span>
                                <br/>
        							<span class="name">Birth date:</span>
        							<span class="value"><g:formatDate format="MM/dd/yyyy" date="${personInstance.birthDate}" /></span>
                                </p>
                            </g:if>

                        <g:each in="${personInstance.addresses}" status="i" var="a">
                            <div class="roundrect address entity">
    						<h2>${a?.addressType?.name}</h2>
    						<p>
    						    ${a?.deliveryAddress?.streetAddress} <br/>
    						    ${a?.deliveryAddress?.city}, 
    						    ${a?.deliveryAddress?.state?.abbreviation}
    						    ${a?.deliveryAddress?.zipcode}<g:if test="${a?.deliveryAddress?.zip4}">-${a?.deliveryAddress?.zip4}</g:if>
    						    <br/>
    						    ${a?.deliveryAddress?.country.name}
    						</p>
    						</div>
                        </g:each>                        

                        <g:each in="${personInstance.phones}" status="i" var="p">
                            <div class="roundrect phone entity">
    						<h2>${p?.phoneType?.name}</h2>
    						<p>${p?.phone?.toString()}</p>
    						</div>
                        </g:each>                        

                        <g:each in="${personInstance.uris}" status="i" var="u">
                            <div class="roundrect uri entity">
    						<h2>${u?.uriType?.name}</h2>
    						<p>${u?.toHTML()}</p>
    						</div>
                        </g:each>                        

                    </div>

                    <div id="contentFooter">
                        <div class="roundrect" id="groupMemberships">
                            <h1>Groups:</h1>
	                        <g:each in="${personInstance.groups}" status="i" var="g">
                                <div class="roundrect group entity">
                                	<h1>
                                		<g:link action="group" id="${g.group.id}">${g.group.name}</g:link>
                                	</h1>
                                	<p>${g.role.name}</p>
								</div>
	                        </g:each>                        
                        </div>
                        <div class="roundrect" id="orgMemberships">
                            <h1>Organizations:</h1>
	                        <g:each in="${personInstance.units}" status="i" var="u">
                                <div class="roundrect institution entity">
                                	<h1>
                                		<g:link action="group" id="${u.unit.id}">${u.unit.name}</g:link>
                                	</h1>
                                	<p>${u.unitRole.name}</p>
								</div>                            
	                        </g:each>                        
                        </div>
                    </div>
                </g:if>
            </div>
        </div>
    </body>
</html>
