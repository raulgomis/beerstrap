<%@ page import="com.app.domain.configuration.Configuration" %>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'configuration.label', default: 'Configuration')}" />
        <parameter name="menu_Configuration" value="active" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="page-header">
    	<h1><i class="icon-cog"></i>${entityName}</h1>
    </div>
    	<div class="row">
    		<div class="span12">

            <g:form action="update">
				<ul class="nav nav-tabs" data-tabs="tabs">
				  <li class="active"><a href="#site" data-toggle="tab"><g:message code="app.configuration.site.label" /></a></li>
				  <li><a href="#server" data-toggle="tab"><g:message code="app.configuration.server.label" /></a></li>
				  <li><a href="#system" data-toggle="tab"><g:message code="app.configuration.system.label" /></a></li>
				  <li><a href="#notifications" data-toggle="tab"><g:message code="app.configuration.notifications.label" /></a></li>
				  <li><a href="#security" data-toggle="tab"><g:message code="app.configuration.security.label" /></a></li>
				  <li><a href="#jobs" data-toggle="tab"><g:message code="app.configuration.jobs.label" /></a></li>
				  <li><a href="#grails" data-toggle="tab"><g:message code="app.configuration.grails.label" /></a></li>
				</ul>
				
				<div class="tab-content">
				  <div class="tab-pane active" id="site">
			  		<h2>${message(code: 'app.configuration.site.label')}</h2>
               		<g:render template="/configuration/list" bean="${listSite}" var="configurationInstanceList"></g:render>
				  </div>
				  <div class="tab-pane" id="server">
				  	<h2>${message(code: 'app.configuration.server.label')}</h2>
	               	<g:render template="/configuration/list" bean="${listServer}" var="configurationInstanceList"></g:render>
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
                        <g:message code="app.default.button.reset.label" />
					</button>
				</div>
            </g:form>
            </div>
        </div>
    </body>
</html>
