<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Home</title>
		<parameter name="menu_Home" value="active" />
	</head>
	<body>
         <div class="page-header">
          <h1><bs:config name="BT_SITE_NAME" /><small> Agilize your projects</small></h1>
			<%-- 
			<ul class="breadcrumb">
			  <li><a href="#">Home</a> <span class="divider">/</span></li>
			  <li class="active">You are here</li>
			</ul>
			--%>
        </div>
    	<g:render template="/home/info"></g:render>

	</body>
</html>
