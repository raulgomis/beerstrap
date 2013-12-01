<%@ page import="com.app.admin.domain.configuration.Configuration" %>
<html>
<head>
    <parameter name="menu_Profile" value="active"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<g:render template="sidebar" model="['selected': 'sb_account']"/>
<g:form action="updateAccount">
    <div class="row">
        <div class="col-md-12">
            <h2><g:message code="app.profile.account.label"></g:message></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <p><g:message code="app.profile.account.description"></g:message></p>
        </div>

        <div class="col-md-9">

            <div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'has-error')} required">
                <label for="username">
                    <g:message code="user.username.label" default="Username"/>
                    <span class="required-indicator">*</span>
                </label>

                <div class="input">
                    <g:textField name="username" required="" readonly="" value="${userInstance?.username}" class="form-control"/>
                </div>
            </div>



            <div class="form-group ${hasErrors(bean: userInstance, field: 'name', 'has-error')} required">
                <label for="name">
                    <g:message code="user.name.label" default="Name"/>
                    <span class="required-indicator">*</span>
                </label>

                <div class="input">
                    <g:textField name="name" required="" value="${userInstance?.name}" class="form-control"/>
                </div>
            </div>



            <div class="form-group ${hasErrors(bean: userInstance, field: 'email', 'has-error')} required">
                <label for="email">
                    <g:message code="user.email.label" default="Email"/>
                    <span class="required-indicator">*</span>
                </label>

                <div class="input">
                    <g:field type="email" name="email" required="" value="${userInstance?.email}" class="form-control"/>
                </div>
            </div>


            <div class="form-group form-actions">
                <button class="btn btn-primary">
                    <i class="fa fa-check"></i>
                    <g:message code="default.button.update.label" default="Update"/>
                </button>
            </div>

            <p>
                <g:link action="deactivate" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                    <g:message code="app.profile.account.deactivate" default="Deactivate my account"/>
                </g:link>
            </p>
        </div>
    </div>
</g:form>

</body>
</html>
