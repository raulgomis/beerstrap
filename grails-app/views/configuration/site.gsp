<%@ page import="com.app.domain.configuration.Configuration" %>
<%@ page import="com.app.configuration.ConfigurationManager" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'configuration.label', default: 'Configuration')}"/>
    <parameter name="menu_Configuration" value="active"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="sidebar" model="['selected': 'sb_site']"></g:render>

<% Configuration configurationInstance = null %>

<g:form action="updateSite">
    </table>
    <h2>General configuration</h2>
    <table class="table" summary="configuration table">
        <thead>
        <tr>
            <th class="col-md-4"></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <% configurationInstance = configurationInstanceList.find { it.key == ConfigurationManager.BT_SITE_NAME } %>
                <strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}"/></strong>
                <span rel="tooltip" title="${message(code: "app.configuration.${configurationInstance?.key}.label", default: "")}">
                    <i class="fa fa-info-sign"></i>
                </span>
            </td>
            <td>
                <g:textField name="${configurationInstance?.key}" value="${configurationInstance?.value}" class="form-control"/>
            </td>
        </tr>
        <%--
        <tr>
            <td>
                <% configurationInstance = configurationInstanceList.find { it.key == ConfigurationManager.BT_SITE_OFFLINE } %>
                <strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}"/></strong>
                <span rel="tooltip" title="${message(code: "app.configuration.${configurationInstance?.key}.label", default: "")}">
                    <i class="fa fa-info-sign"></i>
                </span>
            </td>
            <td>
                <g:checkBox name="${configurationInstance?.key}" value="${configurationInstance?.value}" />
            </td>
        </tr>
        <tr>
            <td>
                <% configurationInstance = configurationInstanceList.find { it.key == ConfigurationManager.BT_SITE_MAXLISTHOME } %>
                <strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}"/></strong>
                <span rel="tooltip" title="${message(code: "app.configuration.${configurationInstance?.key}.label", default: "")}">
                    <i class="fa fa-info-sign"></i>
                </span>
            </td>
            <td>
                <g:textField name="${configurationInstance?.key}" value="${configurationInstance?.value}" />
            </td>
        </tr>
        <tr>
            <td>
                <% configurationInstance = configurationInstanceList.find { it.key == ConfigurationManager.BT_SITE_MAXLIST } %>
                <strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}"/></strong>
                <span rel="tooltip" title="${message(code: "app.configuration.${configurationInstance?.key}.label", default: "")}">
                    <i class="fa fa-info-sign"></i>
                </span>
            </td>
            <td>
                <g:textField name="${configurationInstance?.key}" value="${configurationInstance?.value}" />
            </td>
        </tr>
        --%>
        <tr>
            <td>
                <% configurationInstance = configurationInstanceList.find { it.key == ConfigurationManager.BT_HELP_FAQ } %>
                <strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}"/></strong>
                <span rel="tooltip" title="${message(code: "app.configuration.${configurationInstance?.key}.label", default: "")}">
                    <i class="fa fa-info-sign"></i>
                </span>
            </td>
            <td>
                <g:textArea name="${configurationInstance?.key}" value="${configurationInstance?.value}" class="tiny form-control"/>
            </td>
        </tr>
        </tbody>
    </table>

    <div class="form-group">
        <button type="submit" class="btn btn-primary">
            <i class="fa fa-check"></i>
            ${message(code: 'default.button.update.label', default: 'Update')}
        </button>
    </div>
</g:form>

</body>
</html>
