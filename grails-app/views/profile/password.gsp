<%@ page import="com.app.admin.domain.configuration.Configuration" %>
<html>
<head>
    <parameter name="menu_Profile" value="active"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName"
           value="${message(code: 'profile.label', default: 'Profile')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<g:render template="sidebar" model="['selected': 'sb_password']"/>
<g:form action="updatePassword">
    <div class="row">
        <div class="col-md-12">
            <h2><g:message code="app.profile.password.label"></g:message></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <p><g:message code="app.profile.password.description"></g:message></p>
        </div>

        <div class="col-md-9">

            <div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'has-error')} required">
                <label for="password"><g:message code="user.password.label" default="Password"/>
                    <span class="required-indicator">*</span>
                </label>
                <div class="input">
                    <g:field type="password" name="password" required="" value="" class="form-control"/>
                </div>
            </div>

            <div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'has-error')} required">
                <label for="password"><g:message code="user.passwordnew.label" default="New password"/>
                    <span class="required-indicator">*</span>
                </label>
                <div class="input">
                    <g:field type="password" name="passwordNew" required="" value="" class="form-control"/>
                </div>
            </div>

            <div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'has-error')} required">
                <label for="password"><g:message
                        code="user.passwordrepeat.label" default="Repeat password"/> <span class="required-indicator">*</span>
                </label>
                <div class="input">
                    <g:field type="password" name="passwordRepeat" required="" value="" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <button class="btn btn-primary">
                    <i class="fa fa-check"></i>
                    <g:message code="default.button.update.label" default="Update"/>
                </button>
            </div>
        </div>
    </div>
</g:form>

</body>
</html>
