<%@ page import="com.app.domain.repository.DocumentCategory" %>
<div class="well sidebar-nav">
    <ul class="nav nav-list">

        <li class="nav-header"><g:message code="app.default.filters.category.label" /></li>
        <li class="${(params.category == null || params.category == '')?('active'):('')}">
            <g:link action="list" params="${params + [category:'']}" title="${message(code:'app.default.filters.category.allCategories.label')}">
                <i class="icon-group"></i>
                <g:message code="app.default.filters.category.allCategories.label" />
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

        <li class="nav-header"><g:message code="app.default.filters.dateCreated.label" /></li>
        <li class="${(params.dateCreated == '' || params.dateCreated == null)?('active'):('')}">
            <g:link action="list" params="${params + [dateCreated: '']}" title="${message(code:'app.default.filters.date.allTime.label')}">
                <i class="icon-time"></i>
                <g:message code="app.default.filters.date.allTime.label" />
            </g:link>
        </li>
        <li class="${(params.dateCreated == "1")?('active'):('')}">
            <g:link action="list" params="${params + [dateCreated: 1]}" title="${message(code:'app.default.filters.date.today.label')}">
                <i class="icon-time"></i>
                <g:message code="app.default.filters.date.today.label" />
            </g:link>
        </li>
        <li class="${(params.dateCreated == "7")?('active'):('')}">
            <g:link action="list" params="${params + [dateCreated: 7]}" title="${message(code:'app.default.filters.date.lastWeek.label')}">
                <i class="icon-time"></i>
                <g:message code="app.default.filters.date.lastWeek.label" />
            </g:link>
        </li>
        <li class="${(params.dateCreated == "30")?('active'):('')}">
            <g:link action="list" params="${params + [dateCreated: 30]}" title="${message(code:'app.default.filters.date.lastMonth.label')}">
                <i class="icon-time"></i>
                <g:message code="app.default.filters.date.lastMonth.label" />
            </g:link>
        </li>

        <li class="nav-header"><g:message code="app.default.filters.lastUpdated.label" /></li>
        <li class="${(params.lastUpdated == '' || params.lastUpdated == null)?('active'):('')}">
            <g:link action="list" params="${params + [lastUpdated: '']}" title="${message(code:'app.default.filters.date.allTime.label')}">
                <i class="icon-time"></i>
                <g:message code="app.default.filters.date.allTime.label" />
            </g:link>
        </li>
        <li class="${(params.lastUpdated == "30")?('active'):('')}">
            <g:link action="list" params="${params + [lastUpdated: 30]}" title="${message(code:'app.default.filters.date.lastMonth.label')}">
                <i class="icon-time"></i>
                <g:message code="app.default.filters.date.lastMonth.label" />
            </g:link>
        </li>
        <li class="${(params.lastUpdated == "7")?('active'):('')}">
            <g:link action="list" params="${params + [lastUpdated: 7]}" title="${message(code:'app.default.filters.date.lastWeek.label')}">
                <i class="icon-time"></i>
                <g:message code="app.default.filters.date.lastWeek.label" />
            </g:link>
        </li>
        <li class="${(params.lastUpdated == "1")?('active'):('')}">
            <g:link action="list" params="${params + [lastUpdated: 1]}" title="${message(code:'app.default.filters.date.today.label')}">
                <i class="icon-time"></i>
                <g:message code="app.default.filters.date.today.label" />
            </g:link>
        </li>
    </ul>
</div>