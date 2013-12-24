<html>
<head>
    <meta name='layout' content='login'/>
    <title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
<header id="header">
    <!--<span id="logo"></span>-->

    <div id="logo-group">
        <h4 id="logo"><i class="fa fa-beer" ></i> Beerstrap</h4>

        <!-- END AJAX-DROPDOWN -->
    </div>


</header>
<div id="main" role="main">

    <!-- MAIN CONTENT -->
    <div id="content" class="container">

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
                <h1 class="txt-color-red login-header-big">Beerstrap</h1>
                <div class="hero">
                    <div class="pull-left login-desc-box-l">
                        <p>
                        Description of the product
                        </p>
                    </div>
                    <img src="http://192.241.236.31/smartadmin/img/demo/iphoneview.png" class="pull-right display-image" width="210px">
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <h5 class="about-heading">About SmartAdmin - Are you up to date?</h5>
                        <p>
                            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa.
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <h5 class="about-heading">Not just your average template!</h5>
                        <p>
                            Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi voluptatem accusantium!
                        </p>
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

                <h5 class="text-center"> - Or sign in using -</h5>

                <ul class="list-inline text-center">
                    <li>
                        <a href="javascript:void(0);" class="btn btn-primary btn-circle"><i class="fa fa-facebook"></i></a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="btn btn-info btn-circle"><i class="fa fa-twitter"></i></a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="btn btn-warning btn-circle"><i class="fa fa-linkedin"></i></a>
                    </li>
                </ul>

            </div>
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
