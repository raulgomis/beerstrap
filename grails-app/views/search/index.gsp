<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>
	<div class="page-header">
		<h1>
			<i class="icon-search"></i>
			<g:message code="app.search.label"/>
			<small>

            </small>
		</h1>
        <g:form class="form-inline" method="post" controller="search">
            <input type="text" name="q" placeholder="${message(code:'app.menu.search.label')}"
                   value="${params.q}" class="input-xxlarge"  />
            <button class="btn btn-primary">Search</button>
        </g:form>

	</div>
	<div class="body">
        <g:message code="app.search.description"/>
	</div>
</body>
</html>
