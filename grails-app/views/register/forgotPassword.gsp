<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="public"/>
<title>Insert title here</title>
</head>
<body>

	<h2 class="section_header">
		<span> Password recovery <small> Have you forgot your password? Recover it within seconds</small>
		</span>
		<hr class="right visible-desktop">
	</h2>

	<div class="row">

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
			
			<g:form action="forgotPassword" class="form-horizontal">
			
				<div class="control-group">
					<label class="control-label" for="username">Username</label>
					<div class="controls">
						<input type="text" name="username" placeholder="Username" value="${command?.username }" />
					</div>
				</div>
				
				
				<div class="form-actions">
	            	<button class="btn btn-primary">Enviar</button>
	          	</div>
			</g:form>
		</div>
		
	</div>

</body>
</html>