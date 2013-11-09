<%@ page import="com.app.domain.repository.Document" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <parameter name="menu_Document" value="active" />
    </head>
    <body>
        <div class="page-header">
            <h1><i class="fa fa-briefcase"></i> <g:message code="default.management.label" args="[entityName]" /> <small><g:message code="default.edit.label" args="[entityName]" /></small></h1>
        </div>
        <g:hasErrors bean="${documentInstance}">
        <div class="alert alert-message alert-danger" data-alert="alert">
            <a class="close" data-dismiss="alert" href="#">×</a>
            <ul role="alert">
                <g:eachError bean="${documentInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
        </g:hasErrors>
        <g:form method="post" action="update" class="form-horizontal" >
            <g:hiddenField name="id" value="${documentInstance?.id}" />
            <g:hiddenField name="version" value="${documentInstance?.version}" />
            <fieldset>
                <g:render template="form"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-check"></i>
                        <g:message code="default.button.update.label" default="Update" />
                    </button>
                    <g:link class="btn btn-default" action="list">
                        <i class="fa fa-th-list"></i>
                        <g:message code="default.button.list.label" default="List" />
                    </g:link>
                </div>
            </fieldset>
        </g:form>
    </body>
</html>