<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<parameter name="menu_Help" value="active" />
	<!-- 2. flowplayer -->
	<script src="http://releases.flowplayer.org/5.1.1/flowplayer.min.js"></script>
	
	<!-- 3. skin -->
	<link rel="stylesheet" type="text/css" href="http://releases.flowplayer.org/5.1.1/skin/minimalist.css" />
</head>
<body>

<div class="page-header">
	<h1>
		Ayuda <small>Ayuda con la herramienta</small>
	</h1>
</div>

<div>

	<ul class="nav nav-pills">
		<li class="active"><g:link action="Faq">Faq</g:link></li>
		<li><g:link action="Videos">Videotutoriales</g:link></li>
	</ul>

	<div >
		<div id="faq">
			<bs:config name="BT_HELP_FAQ"></bs:config>
               
		</div>
	</div>
</div>

</body>
</html>
