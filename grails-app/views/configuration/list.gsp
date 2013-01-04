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
    	<h1>${entityName}</h1>
    </div>
    	<div class="row">
    		<div class="span12">

            <g:form action="update">
				<ul class="nav nav-tabs" data-tabs="tabs">
				  <li class="active"><a href="#site" data-toggle="tab">Site</a></li>
				  <li><a href="#server" data-toggle="tab">Server</a></li>
				  <li><a href="#system" data-toggle="tab">System</a></li>
				  <li><a href="#notifications" data-toggle="tab">Notifications</a></li>
				  <li><a href="#security" data-toggle="tab">Security</a></li>
				  <li><a href="#jobs" data-toggle="tab">Jobs</a></li>
				  <li><a href="#grails" data-toggle="tab">Grails</a></li>
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
					<input type="submit" class="btn btn-primary" value="${message(code: 'default.button.update.label', default: 'Update')}">&nbsp;
					<button type="reset" class="btn">Cancel</button>
				</div>
            </g:form>
            </div>
        </div>
    </body>
</html>
