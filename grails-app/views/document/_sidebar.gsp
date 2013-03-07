<%@ page import="com.app.domain.repository.DocumentCategory" %>
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