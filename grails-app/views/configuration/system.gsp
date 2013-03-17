<%@ page import="com.app.domain.configuration.Configuration" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'configuration.label', default: 'Configuration')}"/>
    <parameter name="menu_Configuration" value="active"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="sidebar" model="['selected':'sb_system']"></g:render>

<g:form action="update">

    <g:render template="info"></g:render>

    <div class="form-actions">
        <button type="submit" class="btn btn-primary">
            <i class="icon-ok"></i>
            ${message(code: 'default.button.update.label', default: 'Update')}
        </button>
        <button type="reset" class="btn">
            <i class="icon-chevron-down"></i>
            <g:message code="app.default.button.reset.label"/>
        </button>
    </div>
</g:form>

</body>
</html>
