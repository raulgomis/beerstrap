<%@ page import="com.app.domain.security.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <parameter name="menu_User" value="active"/>
</head>

<body>
<div class="page-header">
    <h1>
        <i class="fa fa-briefcase"></i> <g:message code="default.management.label" args="[entityName]"/>
        <small><g:message code="default.list.label" args="[entityName]"/></small>
    </h1>
</div>

<div class="row rowbar">
    <div class="col-md-6">
        <div id="search_bar" class="rowbar-left pull-left">
            <g:form action="list" class="form-inline" method="GET">
                <div class="input-append">
                    <g:textField name="q" placeholder="Text to search" value="${params.q}" elementId="appendedInputButton" class="col-md-3"/>
                    <button class="btn" type="submit"><g:message code="default.search.label"/></button>
                </div>
            </g:form>
        </div>
    </div>
    <div class="col-md-6">
        <div id="options_bar" class="rowbar-right pull-right">
            <g:link class="btn btn-success" action="create">
                <i class="fa fa-plus fa fa-white"></i>
                <g:message code="default.create.label" args="[entityName]"/>
            </g:link>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-3">
        <g:render template="sidebar"></g:render>
    </div>
<div class="col-md-9">
    <g:if test="${userInstanceList}">
        <table class="table table-striped table-condensed">
            <thead>
            <tr>
                <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}"/>

                <g:sortableColumn property="name" title="${message(code: 'user.name.label', default: 'Name')}"/>

                <g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}"/>

                <g:sortableColumn property="lastLogin" title="${message(code: 'user.lastLogin.label', default: 'Last Login')}"/>

                <th class="col-md-2"></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${userInstanceList}" status="i" var="userInstance">
                <tr class="${(userInstance.enabled == false) ? 'error' : ''}">

                    <td>
                        <img data-src="holder.js/28x28">
                        <g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link>
                    </td>

                    <td>${fieldValue(bean: userInstance, field: "name")}</td>

                    <td>${fieldValue(bean: userInstance, field: "email")}</td>

                    <td><g:formatDate date="${userInstance.lastLogin}"/></td>

                    <td>
                        <div class="list-actions pull-right">
                            <g:link class="btn btn-xs" action="show" id="${userInstance?.id}"
                                    title="${message(code: 'default.button.show.label', default: 'Show')}" rel="tooltip">
                                <i class="fa fa-search"></i>
                            </g:link>
                            <g:link class="btn btn-xs" action="edit" id="${userInstance?.id}"
                                    title="${message(code: 'default.button.edit.label', default: 'Edit')}" rel="tooltip">
                                <i class="fa fa-pencil"></i>
                            </g:link>
                            <g:form action="delete">
                                <g:hiddenField name="id" value="${userInstance?.id}"/>
                                <button class="btn btn-xs" type="submit" name="_action_delete"
                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                                        title="${message(code: 'default.button.delete.label', default: 'Delete')}" rel="tooltip">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </g:form>
                        </div>
                    </td>
                </tr>
            </g:each>
            </tbody>
            <tfooter>
                <tr>
                    <td colspan="100%">
                        <div class="pull-right">
                            <strong><g:message code="default.paginate.number" args="${[userInstanceList?.size(), userInstanceTotal]}"/></strong>
                        </div>
                    </td>
                </tr>
            </tfooter>
        </table>
        <g:paginate total="${userInstanceTotal}" maxsteps="4" params="${params}" class="pagination pagination-centered"/>
        </div>
    </g:if>
    <g:else>
        <g:render template="/common/empty"/>
    </g:else>
</div>
</div>

</body>
</html>
