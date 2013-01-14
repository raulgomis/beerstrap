<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="public" />
<title>Password recovery</title>
</head>
<body>

	<h2 class="section_header">
		<span><i class="icon-info-sign"></i> Password recovery <small>
				Introduce your new password</small></span>
		<hr class="right visible-desktop">
	</h2>


	<g:hasErrors bean="${command}">
		<div class="alert-message block-message error">
			<a class="close" href="#">×</a>
			<p>
				<strong>Oh snap! You got an error!</strong> Change this and that and
				try again.
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
			<label class="control-label" for="password">Password</label>
			<div class="controls">
				<input type="password" name="password" placeholder="Password" />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="password2">Password2</label>
			<div class="controls">
				<input type="password" name="password2" placeholder="Password2" />
			</div>
		</div>

		<div class="form-actions">
			<button type="submit" class="btn btn-primary">Create</button>
		</div>
	</g:form>




</body>
</html>