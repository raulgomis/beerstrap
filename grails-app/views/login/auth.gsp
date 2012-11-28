<html>
<head>
	<meta name='layout' content=''/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
	
	<div class="row">
		<div class="well">
			<legend><g:message code="springSecurity.login.header"/></legend>
			<g:if test='${flash.message}'>
				<div class='login_message'>${flash.message}</div>
			</g:if>
            <div class="">
            	<!-- 
                <img src="Logo" alt="Logo Universidad de Alicante">
                 -->
            </div>
            <br />
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-user"></i></span>
                        <input type='text' class='span3' name='j_username' id='username' placeholder="Usuario"/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-lock"></i></span>
                        <input type='password' class='span3' name='j_password' id='password' placeholder="Contraseña"/>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <label class="checkbox" for='remember_me'>
                        <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <span><g:message code="springSecurity.login.remember.me.label"/></span>
                    </label>
                </div>
            </div>

			<button type="submit" name="submit" class="btn btn-info">
            <i class="icon-lock icon-white"></i>
            Acceder
            </button>
		</div>
	</div>
	
	
	
</form>

<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>

</body>
</html>
