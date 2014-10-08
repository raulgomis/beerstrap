<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Beerstrap"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <g:javascript>
    window.grailsSupport = {
        assetsRoot : '${ raw(asset.assetPath(src: '')) }'
    };
    </g:javascript>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>
<body>
    <div class="header">
        <g:render template="/layouts/header"></g:render>
    </div>

    <div class="container">
        <g:if test="${flash.success}">
            <script>
                toastr.success('${flash.success}')
            </script>
        </g:if>
        <g:if test="${flash.message}">
            <script>
                toastr.info('${flash.message}')
            </script>
        </g:if>
        <g:if test="${flash.error}">
            <script>
                toastr.error('${flash.error}')
            </script>
        </g:if>
        <div class="contents">
            <g:layoutBody/>
        </div>
    </div>

    <div class="footer">
        <g:render template="/layouts/footer"></g:render>
    </div>

    <g:render template="/common/modal"></g:render>

    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
        var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
        (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src='//www.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
    </script>
</body>
</html>
