
<%@ page import="com.app.domain.security.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<parameter name="menu_User" value="active" />
	</head>
	<body>

		<div class="page-header">
			<h1><i class="icon-briefcase"></i>${entityName} management <small><g:message code="default.show.label" args="[entityName]" /></small></h1>
		</div>
        <div class="row rowbar">
            <div class="span12">
                <div class="pull-left">
                    <g:link class="btn" action="list">
                        <i class="icon-th-list"></i>
                        <g:message code="default.button.list.label" default="List" />
                    </g:link>
                </div>
                <div class="pull-right">
                    <g:form action="delete">
                        <g:hiddenField name="id" value="${userInstance?.id}" />
                        <g:link class="btn" action="edit" id="${userInstance?.id}">
                            <i class="icon-pencil"></i>
                            <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>
                        <button class="btn" type="submit" name="_action_delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <i class="icon-trash"></i>
                            <g:message code="default.button.delete.label" default="Delete" />
                        </button>
                    </g:form>
                </div>
            </div>
        </div>

		<table class="table table-striped property-list user">
		
			<g:if test="${userInstance?.username}">
				<tr>
				<td><span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span></td>
				
					<td><span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.name}">
				<tr>
				<td><span id="name-label" class="property-label"><g:message code="user.name.label" default="Name" /></span></td>
				
					<td><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.email}">
				<tr>
				<td><span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span></td>
				
					<td><span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.lastLogin}">
				<tr>
				<td><span id="lastLogin-label" class="property-label"><g:message code="user.lastLogin.label" default="Last Login" /></span></td>
				
					<td><span class="property-value" aria-labelledby="lastLogin-label"><g:formatDate date="${userInstance?.lastLogin}" /></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.enabled}">
				<tr>
				<td><span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span></td>
				
					<td><span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.accountExpired}">
				<tr>
				<td><span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span></td>
				
					<td><span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.accountLocked}">
				<tr>
				<td><span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span></td>
				
					<td><span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.passwordExpired}">
				<tr>
				<td><span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span></td>
				
					<td><span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.password}">
				<tr>
				<td><span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span></td>
				
					<td><span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.preferences}">
				<tr>
				<td><span id="preferences-label" class="property-label"><g:message code="user.preferences.label" default="Preferences" /></span></td>
				
					<td><span class="property-value" aria-labelledby="preferences-label"><g:fieldValue bean="${userInstance}" field="preferences"/></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.dateCreated}">
				<tr>
				<td><span id="dateCreated-label" class="property-label"><g:message code="user.dateCreated.label" default="Date Created" /></span></td>
				
					<td><span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}" /></span></td>
				
				</tr>
			</g:if>
		
			<g:if test="${userInstance?.lastUpdated}">
				<tr>
				<td><span id="lastUpdated-label" class="property-label"><g:message code="user.lastUpdated.label" default="Last Updated" /></span></td>
				
					<td><span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${userInstance?.lastUpdated}" /></span></td>
				
				</tr>
			</g:if>
		
		</table>


	</body>
</html>
