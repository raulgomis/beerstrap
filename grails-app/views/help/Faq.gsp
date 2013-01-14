<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<parameter name="menu_Help" value="active" />
<!-- 2. flowplayer -->
<script src="http://releases.flowplayer.org/5.1.1/flowplayer.min.js"></script>

<!-- 3. skin -->
<link rel="stylesheet" type="text/css"
	href="http://releases.flowplayer.org/5.1.1/skin/minimalist.css" />
</head>
<body>

	<g:render template="top" model="['selected':'faq']" />

	<div id="faq">
		<bs:config key="BT_HELP_FAQ"></bs:config>
	</div>



</body>
</html>
