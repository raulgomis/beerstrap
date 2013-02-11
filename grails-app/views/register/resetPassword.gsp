<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="public" />
<title><g:message code="app.security.resetPassword.title" /></title>
</head>
<body>

	<h2 class="section_header">
		<span><i class="icon-info-sign"></i> <g:message code="app.security.forgotPassword.header" /> <small><g:message code="app.security.forgotPassword.description" /></small></span>
		<hr class="right visible-desktop">
	</h2>


	<g:hasErrors bean="${command}">
		<div class="alert-message block-message error">
			<a class="close" href="#">×</a>
			<p>
				<strong>Oh snap! You got an error!</strong> Change this and that and try again.
			</p>
			<g:renderErrors bean="${command}" as="list" />
			<!--  <div class="alert-actions">
			          <a class="btn small" href="#">Take this action</a> <a class="btn small" href="#">Or do this</a>
			        </div>-->
		</div>
	</g:hasErrors>

	<g:form action="resetPassword" class="form-horizontal">
		<g:hiddenField name="t" value="${token}" />

		<div class="control-group">
			<label class="control-label" for="password"><g:message code="app.resetPasswordCommand.password.label"/></label>
			<div class="controls">
				<input type="password" name="password" placeholder="${message(code:'app.resetPasswordCommand.password.label')}" />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="password2"><g:message code="app.resetPasswordCommand.password2.label"/></label>
			<div class="controls">
				<input type="password" name="password2" placeholder="${message(code:'app.resetPasswordCommand.password2.label')}" />
			</div>
		</div>

		<div class="form-actions">
			<button type="submit" class="btn btn-primary"><g:message code="app.security.forgotPassword.submit"/></button>
		</div>
	</g:form>




</body>
</html>