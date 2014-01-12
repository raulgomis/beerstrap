<html>
<head>
    <meta name='layout' content='login'/>
    <title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

<div id="main" role="main">
    <div id="content" class="container">
            <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
                <h1>Beerstrap</h1>
                <div class="row hero">
                    <div class="col-md-6 col-lg-6">
                        <div>
                            <strong>What is <g:meta name="app.name"/>?</strong>
                            <p>
                                Startup project designed to ease and accelerate software development.
                                Ideal for startups and web developers who want to rapid-prototype and develop products within weeks without wasting time in configurations and boring stuff.
                                Software development never has been so fast!
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <img src="${resource(dir: 'images/frames', file: 'placeit.png')}">
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
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
                            <div class="form-group">
                                <div class="input-group merged">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type='text' class='form-control' name='j_username' id='username' placeholder="Username"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group merged">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type='password' class='form-control' name='j_password' id='password' placeholder="Password"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="checkbox" for='remember_me'>
                                    <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                    <span><g:message code="springSecurity.login.remember.me.label"/></span>
                                </label>
                            </div>
                            <button name="submit" class="btn btn-info btn-block">
                                <i class="glyphicon glyphicon-lock"></i>
                                <g:message code="app.security.login.login"></g:message>
                            </button>
                            <hr>
                            <p><g:link controller="register" action="index"><g:message code="app.security.login.register"></g:message></g:link> | <g:link controller="register" action="forgotPassword"><g:message code="app.security.login.forgotPassword"></g:message></g:link></p>
                        </div>
                    </div>
                </form>
            </div>
    </div>

</div>

<script type='text/javascript'>
    <!--
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>

</body>
</html>
