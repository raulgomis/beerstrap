<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="page-header">
    <h1>
        <i class="fa fa-search"></i> <g:message code="app.search.label"/>
        <small><g:message code="app.search.description"/></small>
    </h1>
</div>

<div class="row rowbar">
    <div class="col-md-offset-2 col-md-10">
        <g:form class="form-inline" method="post" controller="search">
            <div class="form-group">
                <input type="text" name="q" placeholder="${message(code: 'app.menu.search.label')}" value="${params.q}" class="form-control"/>
            </div>
            <button class="btn btn-primary">
                <g:message code="app.search.label"/>
            </button>
        </g:form>
    </div>
</div>

<div class="row">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked">
            <li class="dropdown-header"><g:message code="app.default.filters.dateCreated.label"/></li>
            <li class="${(params.dateCreated == '') ? ('active') : ('')}">
                <g:link action="index" params="${params + [dateCreated: '']}" title="${message(code: 'app.default.filters.date.allTime.label')}">
                    <i class="fa fa-clock-o"></i>
                    <g:message code="app.default.filters.date.allTime.label"/>
                </g:link>
            </li>
            <li class="${(params.dateCreated == "30") ? ('active') : ('')}">
                <g:link action="index" params="${params + [dateCreated: 30]}" title="${message(code: 'app.default.filters.date.lastMonth.label')}">
                    <i class="fa fa-clock-o"></i>
                    <g:message code="app.default.filters.date.lastMonth.label"/>
                </g:link>
            </li>
            <li class="${(params.dateCreated == "7") ? ('active') : ('')}">
                <g:link action="index" params="${params + [dateCreated: 7]}" title="${message(code: 'app.default.filters.date.lastWeek.label')}">
                    <i class="fa fa-clock-o"></i>
                    <g:message code="app.default.filters.date.lastWeek.label"/>
                </g:link>
            </li>
            <li class="${(params.dateCreated == "1") ? ('active') : ('')}">
                <g:link action="index" params="${params + [dateCreated: 1]}" title="${message(code: 'app.default.filters.date.today.label')}">
                    <i class="fa fa-clock-o"></i>
                    <g:message code="app.default.filters.date.today.label"/>
                </g:link>
            </li>
            <li class="dropdown-header">Sort by</li>
            <li class="${(params.sortFilter == "sort1") ? ('active') : ('')}">
                <g:link action="index" params="${params + [sortFilter: "sort1"]}" title="Sort 1">
                    <i class="fa fa-filter"></i>
                    Sort 1
                </g:link>
            </li>
            <li class="${(params.sortFilter == "sort2") ? ('active') : ('')}">
                <g:link action="index" params="${params + [sortFilter: "sort2"]}" title="Sort 2">
                    <i class="fa fa-filter"></i>
                    Sort 2
                </g:link>
            </li>
            <li class="${(params.sortFilter == "sort3") ? ('active') : ('')}">
                <g:link action="index" params="${params + [sortFilter: "sort3"]}" title="Sort 3">
                    <i class="fa fa-filter"></i>
                    Sort 3
                </g:link>
            </li>
        </ul>
    </div>

    <div class="col-md-9">
        <g:if test="${results}">
            <p><strong><g:message code="app.search.pagination.label" args="${[resultsCount, params.q]}"/></strong></p>
            <g:each in="${results}" var="result">
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" data-src="holder.js/64x64">
                    </a>

                    <div class="media-body">
                        <h4 class="media-heading">${result.title}</h4>
                        ${result.description}
                    </div>
                </div>
            </g:each>
        </g:if>
        <g:else>
            <g:render template="/common/empty"/>
        </g:else>
    </div>
</div>
</body>
</html>
