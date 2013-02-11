<%@ page import="com.app.domain.configuration.Configuration" %>
<html>
    <head>
        <parameter name="menu_Profile" value="active" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

       		<g:render template="sidebar" model="['selected':'sb_account']" />
       	
            <g:form action="updateAccount">
           
				<div class="row">
					<div class="span3">
				      <h2><g:message code="app.profile.account.label"></g:message></h2>
				      <p><g:message code="app.profile.account.description"></g:message></p>
				    </div>
					<div class="span9">
					
					<div class="clearfix ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
						<label for="username">
							<g:message code="user.username.label" default="Username" />
							<span class="required-indicator">*</span>
						</label>
						<div class="input">
						<g:textField name="username" required="" value="${userInstance?.username}"/>
						</div>
					</div>
					
					<div class="clearfix ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
						<label for="name">
							<g:message code="user.name.label" default="Name" />
							<span class="required-indicator">*</span>
						</label>
						<div class="input">
						<g:textField name="name" required="" value="${userInstance?.name}"/>
						</div>
					</div>
					
					<div class="clearfix ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="user.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<div class="input">
						<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
						</div>
					</div>
           
				<div class="form-actions">
					<button class="btn btn-primary">
						<i class="icon-ok"></i>
						<g:message code="default.button.update.label" default="Update"/>
					</button>
					<!--  
					<button type="reset" class="btn">
						<g:message code="default.button.reset.label" default="Reset"/>
					</button>
					-->
				</div>
				
				</div>
				</div>
            </g:form>

    </body>
</html>
