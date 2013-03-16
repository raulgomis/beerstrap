<%@ page import="com.app.domain.configuration.Configuration" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'configuration.label', default: 'Configuration')}"/>
    <parameter name="menu_Configuration" value="active"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="sidebar"></g:render>

<div class="row">
    <div class="span12">

        <g:form action="update">

            <div class="tab-content">
                <div class="tab-pane active" id="site">
                    <h2>${message(code: 'app.configuration.site.label')}</h2>
                    <g:render template="/configuration/list" bean="${listSite}"
                              var="configurationInstanceList"></g:render>
                </div>

                <div class="tab-pane" id="server">
                    <h2>${message(code: 'app.configuration.server.label')}</h2>
                    <g:render template="/configuration/list" bean="${listServer}"
                              var="configurationInstanceList"></g:render>
                </div>

                <div class="tab-pane" id="system">
                    <h2>${message(code: 'app.configuration.system.label')}</h2>

                </div>

                <div class="tab-pane" id="notifications">
                    <h2>${message(code: 'app.configuration.notifications.label')}</h2>
                </div>

                <div class="tab-pane" id="security">
                    <h2>${message(code: 'app.configuration.security.label')}</h2>
                </div>

                <div class="tab-pane" id="jobs">
                    <h2>${message(code: 'app.configuration.jobs.label')}</h2>
                </div>

                <div class="tab-pane" id="grails">
                    <g:render template="/configuration/info"></g:render>
                </div>
            </div>

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
    </div>
</div>
</body>
</html>
