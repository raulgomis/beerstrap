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
				      <h2>Account</h2>
				      <p>
				      	¡Sé astuto! Tu contraseña debe tener al menos 6 caracteres y no ser una palabra del diccionario o un nombre común. 
				      	Por favor, usa una contraseña que no uses para otras cosas y cámbiala ocasionalmente.
						Nunca escribas tu contraseña en un servicio o software que parezca sospechoso.
						</p>
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
						<g:message code="default.button.clear.label" default="Clear"/>
					</button>
					-->
				</div>
				
				</div>
				</div>
            </g:form>

    </body>
</html>
