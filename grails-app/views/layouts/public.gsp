<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <r:require modules="jquery,publicpart,holder"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-fa fa-retina.png')}">
    <g:layoutHead/>
    <r:layoutResources/>
</head>
<body>
    <nav class="navbar-inner">
        <div class="container">
            <ul class="nav nav-justified">
                <li class="${pageProperty(name: "page.menu_Home")}"><g:link controller="public" action="index"><i class="fa fa-home"></i> Home</g:link></li>
                <li class="${pageProperty(name: "page.menu_Docs")}"><g:link controller="public" action="docs"><i class="fa fa-file-o"></i> Docs</g:link></li>
                <li class="${pageProperty(name: "page.menu_Pricing")}"><g:link controller="public" action="pricing"><i class="fa fa-shopping-cart"></i> Pricing</g:link></li>
                <li class="${pageProperty(name: "page.menu_Downloads")}"><g:link controller="public" action="downloads"><i class="fa fa-cloud-download"></i> Downloads</g:link></li>
                <li class="${pageProperty(name: "page.menu_About")}"><g:link controller="public" action="about"><i class="fa fa-info-circle"></i> About</g:link></li>
                <li class="${pageProperty(name: "page.menu_Contact")}"><g:link controller="public" action="contact"><i class="fa fa-phone-square"></i> Contact</g:link></li>
            </ul>
        </div>
    </nav>
    <g:if test="${flash.message}">
        <div class="alert alert-info myalert col-md-3 pull-right" data-alert="alert" role="status" style="z-index:2323;">
            <a class="close" data-dismiss="alert" href="#">×</a>
            <p>${flash.message}</p>
        </div>
    </g:if>
    <g:layoutBody/>

    <footer class="footer">
        <div class="container">
            <p>&copy; <g:meta name="app.name"/> ${Calendar.getInstance().get(Calendar.YEAR)}</p>
        </div>
    </footer>

    <r:layoutResources/>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-43194168-1', 'cloudbees.net');
        ga('send', 'pageview');

    <script>
</body>
</html>
