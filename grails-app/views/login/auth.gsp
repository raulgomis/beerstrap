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
            <g:if test="${flash.message}">
                <div class="alert alert-info" role="status">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <p>${flash.message}</p>
                </div>
            </g:if>
            <br />
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-user"></i></span>
                        <input type='text' class='span3' name='j_username' id='username' placeholder="Username"/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-lock"></i></span>
                        <input type='password' class='span3' name='j_password' id='password' placeholder="Password"/>
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
            <button type="submit" name="submit" class="btn btn-info btn-block">
                <i class="icon-lock icon-white"></i>
                <g:message code="app.security.login.login"></g:message>
            </button>
            <hr>
            <p><g:link controller="register" action="index"><g:message code="app.security.login.register"></g:message></g:link> | <g:link controller="register" action="forgotPassword"><g:message code="app.security.login.forgotPassword"></g:message></g:link></p>

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
