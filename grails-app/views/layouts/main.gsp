<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails Bootstrap"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <r:require modules="jquery,application,bootstrap,fontawesome,datepicker,select2,d3js,peity,jqueryfileuploader,holder"/>
    <script type="text/javascript" src="${resource(dir: 'js/tiny_mce', file: 'tiny_mce.js')}"></script>
    <r:require modules="init"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <g:layoutHead/>
    <r:layoutResources/>
</head>
<body>
    <div class="header">
        <g:render template="/layouts/header"></g:render>
    </div>

    <div class="container">
        <g:if test="${flash.message}">
            <div class="alert alert-info myalert span3 pull-right" data-alert="alert" role="status">
                <a class="close" data-dismiss="alert" href="#">×</a>
                <p>${flash.message}</p>
            </div>
        </g:if>
        <div class="contents">
            <g:layoutBody/>
        </div>
    </div>

    <div class="footer">
        <g:render template="/layouts/footer"></g:render>
    </div>

    <g:render template="/common/modal"></g:render>
    <div id="spinner"></div>

    <r:layoutResources/>
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
        var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
        (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src='//www.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
    </script>
</body>
</html>
