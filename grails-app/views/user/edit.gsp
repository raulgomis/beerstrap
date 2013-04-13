<%@ page import="com.app.domain.security.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <parameter name="menu_User" value="active" />
    </head>
    <body>
        <div class="page-header">
            <h1><i class="icon-briefcase"></i>${entityName} management <small><g:message code="default.edit.label" args="[entityName]" /></small></h1>
        </div>
        <g:hasErrors bean="${userInstance}">
        <div class="alert alert-message alert-error" data-alert="alert">
            <a class="close" data-dismiss="alert" href="#">×</a>
            <ul role="alert">
                <g:eachError bean="${userInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
        </g:hasErrors>
        <g:form method="post" action="update" class="form-horizontal" >
            <g:hiddenField name="id" value="${userInstance?.id}" />
            <g:hiddenField name="version" value="${userInstance?.version}" />
            <fieldset>
                <g:render template="form"/>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class="icon-ok icon-white"></i>
                        <g:message code="default.button.update.label" default="Update" />
                    </button>
                    <g:link class="btn" action="list">
                        <i class="icon-th-list"></i>
                        <g:message code="default.button.list.label" default="List" />
                    </g:link>
                </div>
            </fieldset>
        </g:form>
    </body>
</html>