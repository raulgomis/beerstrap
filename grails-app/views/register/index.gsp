<html>

<head>

	<meta name="layout" content="public">

</head>
<body>

<div class="row">
	
	<div class="span4">
		<h3>Register</h3>
	</div>
	
	<div class="span12">
		<g:hasErrors bean="${command}">
		<div class="alert-message block-message error">
		        <a class="close" href="#">×</a>
		        <p><strong>Oh snap! You got an error!</strong> Change this and that and try again.</p>
		        <g:renderErrors bean="${command}" as="list" />
		        <!--  <div class="alert-actions">
		          <a class="btn small" href="#">Take this action</a> <a class="btn small" href="#">Or do this</a>
		        </div>-->
      	</div>
      	</g:hasErrors>
		
		<div class="form-register" style="margin-top:30px">
			<g:form action="register">
				<div class="clearfix">
					<label for="name">Name</label>
					<div class="input"><input type="text" name="name" placeholder="Name" value="${command?.name }" /></div>
				</div>
				<div class="clearfix">
					<label for="username">Username</label>
					<div class="input"><input type="text" name="username" placeholder="Username" value="${command?.username }" /></div>
				</div>
				<div class="clearfix">
					<label for="email">Email</label>
					<div class="input"><input type="text" name="email" placeholder="Email" value="${command?.email}" /></div>
				</div>
				<div class="clearfix">
					<label for="password">Password</label>
					<div class="input"><input type="password" name="password" placeholder="Password" value="${command?.password}" /></div>
				</div>
				<div class="clearfix">
					<label></label>
					<div class="input">
						<ul class="inputs-list">
							<li>
								<label for="terms">
								<g:checkBox name="terms" value="${true}" checked="${command?.terms}" />
								<span>Acepto los términos y condiciones</span>
								</label>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="actions">
	            	<input type="submit" class="btn primary" value="Accept">&nbsp;<button type="reset" class="btn">Cancel</button>
	          	</div>
			</g:form>
		</div>
	</div>
	
</div>


</body>


</html>