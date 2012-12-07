<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="public"/>
<title>Insert title here</title>
</head>
<body>

	<div class="row">
		
		<div class="span4">
			<h3>Password recovery</h3>
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
			
			<g:form action="resetPassword">
			
				<g:hiddenField name="t" value="${token}"/>
				<p><input type="password" name="password" placeholder="Password" /></p>
				<p><input type="password" name="password2" placeholder="Password2" /></p>
				
				<div class="actions">
	            	<input type="submit" class="btn primary" value="Accept">&nbsp;<button type="reset" class="btn">Cancel</button>
	          	</div>
			</g:form>
		</div>
		
	</div>

</body>
</html>