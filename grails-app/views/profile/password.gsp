<%@ page import="com.app.domain.configuration.Configuration"%>
<html>
<head>
	<parameter name="menu_Profile" value="active" />
	<meta name="layout" content="main" />
	<g:set var="entityName"
		value="${message(code: 'profile.label', default: 'Profile')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<g:render template="sidebar" model="['selected':'sb_password']" />

	<g:form action="updatePassword">

		<div class="row">
			<div class="span3">
				<h2>Password</h2>
				<p>¡Sé astuto! Tu contraseña debe tener al menos 6 caracteres y
					no ser una palabra del diccionario o un nombre común. Por favor,
					usa una contraseña que no uses para otras cosas y cámbiala
					ocasionalmente. Nunca escribas tu contraseña en un servicio o
					software que parezca sospechoso.</p>
			</div>
			<div class="span9">
				<div
					class="clearfix ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<label for="password"> <g:message
							code="user.password.label" default="Password" /> <span
						class="required-indicator">*</span>
					</label>
					<div class="input">
						<g:field type="password" name="password" required="" value="" />
					</div>
				</div>

				<div
					class="clearfix ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<label for="password"> <g:message
							code="user.passwordnew.label" default="New password" /> <span
						class="required-indicator">*</span>
					</label>
					<div class="input">
						<g:field type="password" name="passwordNew" required="" value="" />
					</div>
				</div>

				<div
					class="clearfix ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<label for="password"> <g:message
							code="user.passwordrepeat.label" default="Repeat password" /> <span
						class="required-indicator">*</span>
					</label>
					<div class="input">
						<g:field type="password" name="passwordRepeat" required=""
							value="" />
					</div>
				</div>


				<div class="form-actions">
					<button class="btn btn-primary">
						<i class="icon-ok"></i>
						<g:message code="default.button.update.label" default="Update"/>
					</button>
				</div>

			</div>
		</div>

	</g:form>

</body>
</html>
