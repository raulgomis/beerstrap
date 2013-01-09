<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<parameter name="menu_${className}" value="active" />
	</head>
	<body>

		<div class="page-header">
			<h1><i class="icon-briefcase"></i>\${entityName} management <small><g:message code="default.show.label" args="[entityName]" /></small></h1>
		</div>
		<table class="table table-striped property-list ${domainClass.propertyName}">
		<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
			allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
			props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
			Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
			props.each { p -> %>
			<g:if test="\${${propertyName}?.${p.name}}">
				<tr>
				<td><span id="${p.name}-label" class="property-label"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></span></td>
				<%  if (p.isEnum()) { %>
					<td><span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span></td>
				<%  } else if (p.oneToMany || p.manyToMany) { %>
					<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
					<td><span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></span></td>
					</g:each>
				<%  } else if (p.manyToOne || p.oneToOne) { %>
					<td><span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></span></td>
				<%  } else if (p.type == Boolean || p.type == boolean) { %>
					<td><span class="property-value" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></span></td>
				<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
					<td><span class="property-value" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></span></td>
				<%  } else if(!p.type.isArray()) { %>
					<td><span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span></td>
				<%  } %>
				</tr>
			</g:if>
		<%  } %>
		</table>
		<g:form action="delete">
		<fieldset>
			<g:hiddenField name="id" value="\${${propertyName}?.id}" />
			<div class="form-actions">
				<g:link class="btn" action="edit" id="\${${propertyName}?.id}">
					<i class="icon-pencil"></i>
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>					
				<button class="btn" type="submit" name="_action_delete" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
					<i class="icon-trash"></i>
					<g:message code="default.button.delete.label" default="Delete" />
				</button>
				<g:link class="btn" action="list">
					<i class="icon-th-list"></i>
					<g:message code="default.button.list.label" default="List" />
				</g:link>
			</div>
		</fieldset>
		</g:form>

	</body>
</html>
