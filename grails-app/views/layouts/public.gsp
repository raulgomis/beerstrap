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
		<r:require modules="jquery,publicpart" />
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
    <body>


      <div class="masthead">
          <!--
        <h3 class="muted"><bs:config key="grailsbs.BT_SITE_NAME" /></h3>
        -->
        <div class="navbar">
          <div class="navbar-inner">
            <div class="container">
              <ul class="nav">
                <li class="${pageProperty(name:"page.menu_Home")}"><g:link controller="public" action="index"><i class="icon-home"></i>Home</g:link></li>
                <li class="${pageProperty(name:"page.menu_Docs")}"><g:link controller="public" action="docs"><i class="icon-file-alt"></i>Docs</g:link></li>
                <li class="${pageProperty(name:"page.menu_Pricing")}"><g:link controller="public" action="pricing"><i class="icon-shopping-cart"></i>Pricing</g:link></li>
                <li class="${pageProperty(name:"page.menu_Downloads")}"><g:link controller="public" action="downloads"><i class="icon-download-alt"></i>Downloads</g:link></li>
                <li class="${pageProperty(name:"page.menu_About")}"><g:link controller="public" action="about"><i class="icon-info-sign"></i>About</g:link></li>
                <li class="${pageProperty(name:"page.menu_Contact")}"><g:link controller="public" action="contact"><i class="icon-phone-sign"></i>Contact</g:link></li>
              </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>
        <g:if test="${flash.message}">
            <div class="alert alert-info myalert span3 pull-right" data-alert="alert" role="status" style="z-index:2323">
                <a class="close" data-dismiss="alert" href="#">×</a>
                <p>${flash.message}</p>
            </div>
        </g:if>
    <div class="container">
    <g:layoutBody />
		
      <hr>
      <div class="footer">
        <p>&copy; Company 2012</p>
      </div>

    </div> <!-- /container -->

      <r:layoutResources />
    </body>
</html>
