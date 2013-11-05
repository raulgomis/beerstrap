<%@ page import="com.app.domain.configuration.Configuration" %>
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
        <div class="col-md-3">
            <h2><g:message code="app.profile.password.label"></g:message></h2>
            <p><g:message code="app.profile.password.description"></g:message></p>
        </div>

        <div class="col-md-9">
            <div class="clearfix ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
                <label for="password"><g:message code="user.password.label" default="Password"/>
                    <span class="required-indicator">*</span>
                </label>
                <div class="input">
                    <g:field type="password" name="password" required="" value=""/>
                </div>
            </div>

            <div class="clearfix ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
                <label for="password"><g:message code="user.passwordnew.label" default="New password"/>
                    <span class="required-indicator">*</span>
                </label>
                <div class="input">
                    <g:field type="password" name="passwordNew" required="" value=""/>
                </div>
            </div>

            <div class="clearfix ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
                <label for="password"><g:message
                        code="user.passwordrepeat.label" default="Repeat password"/> <span class="required-indicator">*</span>
                </label>
                <div class="input">
                    <g:field type="password" name="passwordRepeat" required="" value=""/>
                </div>
            </div>
            <div class="form-actions">
                <button class="btn btn-primary">
                    <i class="icon-ok"></i>
                    <g:message code="default.button.update.label" default="Update"/>
                </button>
            </div>
        </div>
    </div>
</g:form>

</body>
</html>
