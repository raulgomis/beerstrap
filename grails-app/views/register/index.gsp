<html>

<head>

<meta name="layout" content="public">

</head>
<body>

	<h2 class="section_header">
		<i class="icon-signin"></i>
		Join <bs:config key="BT_SITE_NAME" /> today <small>
				It's completely free</small>
		
		<hr class="right visible-desktop">
	</h2>

	<g:hasErrors bean="${command}">
		<div class="alert alert-block alert-error">
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
	
	<div class="form-register">
		<g:form action="register" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="name">Name</label>
				<div class="controls">
					<input type="text" name="name" placeholder="Name"
						value="${command?.name }" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="username">Username</label>
				<div class="controls">
					<input type="text" name="username" placeholder="Username"
						value="${command?.username }" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">Email</label>
				<div class="controls">
					<input type="text" name="email" placeholder="Email"
						value="${command?.email}" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">Password</label>
				<div class="controls">
					<input type="password" name="password" placeholder="Password"
						value="${command?.password}" />
				</div>
			</div>

			<div class="control-group">
				<div class="controls">
					<label class="checkbox"> <g:checkBox name="terms"
							value="${true}" checked="${command?.terms}" /> Acepto los
						términos y condiciones
					</label>


				</div>
			</div>

			<div class="form-actions">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
		</g:form>
	</div>



</body>


</html>