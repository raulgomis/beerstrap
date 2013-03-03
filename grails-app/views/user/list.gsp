
<%@ page import="com.app.domain.security.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<parameter name="menu_User" value="active" />
	</head>
	<body>
		<div class="page-header">
			<h1><i class="icon-briefcase"></i>${entityName} management <small><g:message code="default.list.label" args="[entityName]" /></small></h1>
		</div>
		<div class="row rowbar">
			<div class="span6">
				<div id="search_bar" class="rowbar-left pull-left">
					<g:form action="list" class="form-inline" method="GET">
						<div class="input-append">
						<g:textField name="q" placeholder="Text to search" value="${params.q}" elementId="appendedInputButton" class="span3" />
						<button class="btn" type="submit">Search</button>
						</div>
                        <!--
                        <div class="btn-group">
                            <a href="/Astua/Titulacion?ACTIVO=1" class="btn ">
                                <i class="icon-thumbs-up"></i> Activos</a>
                            <a href="/Astua/Titulacion?ACTIVO=0" class="btn ">
                                <i class="icon-ban-circle"></i> Inactivos</a>
                        </div>
                        -->
					</g:form>

				</div>
			</div>
			<div class="span6">
				<div id="options_bar" class="rowbar-right pull-right">
					<g:link class="btn btn-success" action="create">
						<i class="icon-plus icon-white"></i>
						<g:message code="default.create.label" args="[entityName]" />
					</g:link>
				</div>
			</div>
		</div>
        <div class="row">
            <div class="span3">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="nav-header">Filter by role</li>
                    <li class="${(params.roleID == null || params.roleID == '')?('active'):('')}">
                        <g:link action="list" params="${params + [roleID:'']}" title="All roles">
                            <i class="icon-group"></i>
                            All roles
                        </g:link>
                    </li>
                    <g:each in="${roleInstanceList}" var="roleInstance">
                        <li class="${(params.roleID == roleInstance.id.toString())?('active'):('')}">
                            <g:link action="list" params="[roleID: roleInstance.id]" title="${roleInstance.authority}">
                                <i class="icon-group"></i>
                                ${roleInstance.authority}
                            </g:link>
                        </li>
                    </g:each>

                    <li class="nav-header">Filter by account status</li>
                    <li class="${(params.filter == '' || params.filter==null)?('active'):('')}">
                        <g:link action="list" params="${params + [filter:'']}" title="All">
                            <i class="icon-filter"></i>
                            All statuses
                        </g:link>
                    </li>
                    <li class="${(params.filter == "enabled")?('active'):('')}">
                        <g:link action="list" params="${params + [filter:"enabled"]}" title="Enabled">
                            <i class="icon-filter"></i>
                            Enabled
                        </g:link>
                    </li>
                    <li class="${(params.filter == "disabled")?('active'):('')}">
                        <g:link action="list" params="${params + [filter:"disabled"]}" title="Disabled">
                            <i class="icon-filter"></i>
                            Disabled
                        </g:link>
                    </li>
                    <li class="${(params.filter == "accountExpired")?('active'):('')}">
                        <g:link action="list" params="${params + [filter:"accountExpired"]}" title="Account expired">
                            <i class="icon-filter"></i>
                            Account expired
                        </g:link>
                    </li>
                    <li class="${(params.filter == "accountLocked")?('active'):('')}">
                        <g:link action="list" params="${params + [filter:"accountLocked"]}" title="Account locked">
                            <i class="icon-filter"></i>
                            Account locked
                        </g:link>
                    </li>
                    <li class="${(params.filter == "passwordExpired")?('active'):('')}">
                        <g:link action="list" params="${params + [filter:"passwordExpired"]}" title="Password expired">
                            <i class="icon-filter"></i>
                            Password expired
                        </g:link>
                    </li>

                    <li class="nav-header">Filter by registration date</li>
                    <li class="${(params.dateCreated == '' || params.dateCreated == null)?('active'):('')}">
                        <g:link action="list" params="${params + [dateCreated: '']}" title="All time">
                            <i class="icon-time"></i>
                            All time
                        </g:link>
                    </li>
                    <li class="${(params.dateCreated == "1")?('active'):('')}">
                        <g:link action="list" params="${params + [dateCreated: 1]}" title="Yesterday">
                            <i class="icon-time"></i>
                            Today
                        </g:link>
                    </li>
                    <li class="${(params.dateCreated == "7")?('active'):('')}">
                        <g:link action="list" params="${params + [dateCreated: 7]}" title="Last week">
                            <i class="icon-time"></i>
                            Last week
                        </g:link>
                    </li>
                    <li class="${(params.dateCreated == "30")?('active'):('')}">
                        <g:link action="list" params="${params + [dateCreated: 30]}" title="Last month">
                            <i class="icon-time"></i>
                            Last month
                        </g:link>
                    </li>

                    <li class="nav-header">Filter by last login</li>
                    <li class="${(params.lastUpdated == '' || params.lastUpdated == null)?('active'):('')}">
                        <g:link action="list" params="${params + [lastUpdated: '']}" title="All time">
                            <i class="icon-time"></i>
                            All time
                        </g:link>
                    </li>
                    <li class="${(params.lastUpdated == "30")?('active'):('')}">
                        <g:link action="list" params="${params + [lastUpdated: 30]}" title="Last month">
                            <i class="icon-time"></i>
                            Last month
                        </g:link>
                    </li>
                    <li class="${(params.lastUpdated == "7")?('active'):('')}">
                        <g:link action="list" params="${params + [lastUpdated: 7]}" title="Last week">
                            <i class="icon-time"></i>
                            Last week
                        </g:link>
                    </li>
                    <li class="${(params.lastUpdated == "1")?('active'):('')}">
                        <g:link action="list" params="${params + [lastUpdated: 1]}" title="Yesterday">
                            <i class="icon-time"></i>
                            Today
                        </g:link>
                    </li>
                </ul>


        </div>

            </div>
            <div class="span9">
                <g:if test="${userInstanceList}">
                    <table class="table table-striped table-condensed">
                        <thead>
                        <tr>
                            <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />

                            <g:sortableColumn property="name" title="${message(code: 'user.name.label', default: 'Name')}" />

                            <g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />

                            <g:sortableColumn property="lastLogin" title="${message(code: 'user.lastLogin.label', default: 'Last Login')}" />

                            <th class="span2"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${userInstanceList}" status="i" var="userInstance">
                            <tr class="${(userInstance.enabled == false)?'error':''}">

                                <td>
                                    <img data-src="holder.js/28x28">
                                    <g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link>
                                </td>

                                <td>${fieldValue(bean: userInstance, field: "name")}</td>

                                <td>${fieldValue(bean: userInstance, field: "email")}</td>

                                <td><g:formatDate date="${userInstance.lastLogin}" /></td>


                                <td>
                                    <div class="list-actions pull-right">
                                        <g:link class="btn btn-mini" action="show" id="${userInstance?.id}" title="${message(code: 'default.button.show.label', default: 'Show')}" rel="tooltip">
                                            <i class="icon-search"></i>
                                        </g:link>
                                        <g:link class="btn btn-mini" action="edit" id="${userInstance?.id}" title="${message(code: 'default.button.edit.label', default: 'Edit')}" rel="tooltip">
                                            <i class="icon-pencil"></i>
                                        </g:link>
                                        <g:form action="delete">
                                            <g:hiddenField name="id" value="${userInstance?.id}" />
                                            <button class="btn btn-mini" type="submit" name="_action_delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" title="${message(code: 'default.button.delete.label', default: 'Delete')}"  rel="tooltip">
                                                <i class="icon-trash"></i>
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
                                        <strong>Showing ${userInstanceList?.size()} of ${userInstanceTotal}</strong>
                                    </div>
                                </td>
                            </tr>
                        </tfooter>
                    </table>
                    <g:paginate total="${userInstanceTotal}" maxsteps="4" params="${params}" class="pagination pagination-centered" />

                    </div>
                </g:if>
                <g:else>
                    <g:render template="/common/empty" />
                </g:else>

            </div>

        </div>

	</body>
</html>
