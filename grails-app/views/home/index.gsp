<!doctype html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Home</title>
    <parameter name="menu_Home" value="active" />
</head>
<body>
	<div class="page-header">
		<h1>
			<i class="icon-dashboard"></i>
            <g:message code="app.home.title.label"></g:message>
			<small><g:message code="app.home.description.label"></g:message></small>
		</h1>
	</div>


    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <g:render template="admin"></g:render>
    </sec:ifAnyGranted>


</body>
</html>
