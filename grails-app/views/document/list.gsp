
<%@ page import="com.app.domain.repository.Document" %>
<%@ page import="com.app.domain.repository.DocumentCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<parameter name="menu_Document" value="active" />
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
						<button class="btn" type="button">Search</button>
						</div>
					</g:form>
				</div>
			</div>
			<div class="span6">
				<div id="options_bar" class="rowbar-right pull-right">
                    <a href="#myModal" class="btn btn-success" data-toggle="modal">
                        <i class="icon-plus icon-white"></i>
                        <g:message code="default.button.upload.label" args="[entityName]" />
                    </a>
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

                    <li class="nav-header">Filter by category</li>
                    <li class="${(params.category == null || params.category == '')?('active'):('')}">
                        <g:link action="list" params="${params + [category:'']}" title="All categories">
                            <i class="icon-group"></i>
                            All categories
                        </g:link>
                    </li>
                    <g:each in="${DocumentCategory.list()}" var="category">
                        <li class="${(params.category == category.toString())?('active'):('')}">
                            <g:link action="list" params="[category: category.toString()]" title="${category.toString()}">
                                <i class="icon-group"></i>
                                ${category.toString()}
                            </g:link>
                        </li>
                    </g:each>

                    <li class="nav-header">Filter by date created</li>
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

                    <li class="nav-header">Filter by last updated</li>
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

		<g:if test="${documentInstanceList}">
		<table class="table table-striped table-condensed">
			<thead>
				<tr>
					<g:sortableColumn property="title" title="${message(code: 'document.title.label', default: 'Title')}" />

					<th class="span3"></th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${documentInstanceList}" status="i" var="documentInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				
					<td>
                        <i class="icon-file"></i>
                        <g:link action="show" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "title")}</g:link>  <br/>
                        <span class="muted">
                            ${message(code: 'document.dateCreated.label', default: 'Date Created')}: <g:formatDate date="${documentInstance.dateCreated}" /> |
                            ${message(code: 'document.lastUpdated.label', default: 'Last Updated')}: <g:formatDate date="${documentInstance.lastUpdated}" />
                        </span>
                    </td>

					<td>
						<div class="list-actions pull-right">
                            <span class="label">${fieldValue(bean: documentInstance, field: "category")}</span>

                            <g:link class="btn btn-mini" action="download" id="${documentInstance?.uuid}" title="${message(code: 'default.button.download.label', default: 'Download')}" rel="tooltip">
                                <i class="icon-download-alt"></i>
                            </g:link>
							<g:link class="btn btn-mini" action="show" id="${documentInstance?.id}" title="${message(code: 'default.button.show.label', default: 'Show')}" rel="tooltip">
								<i class="icon-search"></i>
							</g:link>
							<g:link class="btn btn-mini" action="edit" id="${documentInstance?.id}" title="${message(code: 'default.button.edit.label', default: 'Edit')}" rel="tooltip">
								<i class="icon-pencil"></i>
							</g:link>
							<g:form action="delete">
								<g:hiddenField name="id" value="${documentInstance?.id}" />								
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
                            <strong>Showing ${documentInstanceList?.size()} de ${documentInstanceTotal}</strong>
                        </div>
                    </td>
                </tr>
            </tfooter>
		</table>
        <g:paginate total="${documentInstanceTotal}" maxsteps="4" params="['q':params?.q]" class="pagination-centered" />

		</div>
		</g:if>
		<g:else>
			<g:render template="/common/empty" />
		</g:else>
        </div>
    </div>
    <g:render template="modalUpload"></g:render>
	</body>
</html>
