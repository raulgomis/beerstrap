<div class="btn-group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
        <g:message code="default.filter.label"/> <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <li class="dropdown-header"><g:message code="app.default.filters.role.label" /></li>
        <li class="${(params.roleID == null || params.roleID == '')?('active'):('')}">
            <g:link action="list" params="${params + [roleID:'']}" title="${message(code:'app.default.filters.role.allRoles.label')}">
                <i class="fa fa-group"></i>
                <g:message code="app.default.filters.role.allRoles.label" />
            </g:link>
        </li>
        <g:each in="${roleInstanceList}" var="roleInstance">
            <li class="${(params.roleID == roleInstance.id.toString())?('active'):('')}">
                <g:link action="list" params="${params + [roleID: roleInstance.id]}" title="${roleInstance.authority}">
                    <i class="fa fa-group"></i>
                    ${roleInstance.authority}
                </g:link>
            </li>
        </g:each>

        <li class="dropdown-header"><g:message code="app.default.filters.accountStatus.label" /></li>
        <li class="${(params.filter == '' || params.filter==null)?('active'):('')}">
            <g:link action="list" params="${params + [filter:'']}" title="${message(code:'app.default.filters.accountStatus.allStatuses.label')}">
                <i class="fa fa-filter"></i>
                <g:message code="app.default.filters.accountStatus.allStatuses.label" />
            </g:link>
        </li>
        <li class="${(params.filter == "enabled")?('active'):('')}">
            <g:link action="list" params="${params + [filter:"enabled"]}" title="${message(code:'app.default.filters.enabled.label')}">
                <i class="fa fa-filter"></i>
                <g:message code="app.default.filters.enabled.label" />
            </g:link>
        </li>
        <li class="${(params.filter == "disabled")?('active'):('')}">
            <g:link action="list" params="${params + [filter:"disabled"]}" title="${message(code:'app.default.filters.disabled.label')}">
                <i class="fa fa-filter"></i>
                <g:message code="app.default.filters.disabled.label" />
            </g:link>
        </li>
        <li class="${(params.filter == "accountExpired")?('active'):('')}">
            <g:link action="list" params="${params + [filter:"accountExpired"]}" title="${message(code:'app.default.filters.accountExpired.label')}">
                <i class="fa fa-filter"></i>
                <g:message code="app.default.filters.accountExpired.label" />
            </g:link>
        </li>
        <li class="${(params.filter == "accountLocked")?('active'):('')}">
            <g:link action="list" params="${params + [filter:"accountLocked"]}" title="${message(code:'app.default.filters.accountLocked.label')}">
                <i class="fa fa-filter"></i>
                <g:message code="app.default.filters.accountLocked.label" />
            </g:link>
        </li>
        <li class="${(params.filter == "passwordExpired")?('active'):('')}">
            <g:link action="list" params="${params + [filter:"passwordExpired"]}" title="${message(code:'app.default.filters.passwordExpired.label')}">
                <i class="fa fa-filter"></i>
                <g:message code="app.default.filters.passwordExpired.label" />
            </g:link>
        </li>

        <li class="dropdown-header"><g:message code="app.default.filters.registrationDate.label" /></li>
        <li class="${(params.dateCreated == '' || params.dateCreated == null)?('active'):('')}">
            <g:link action="list" params="${params + [dateCreated: '']}" title="${message(code:'app.default.filters.date.allTime.label')}">
                <i class="fa fa-time"></i>
                <g:message code="app.default.filters.date.allTime.label" />
            </g:link>
        </li>
        <li class="${(params.dateCreated == "1")?('active'):('')}">
            <g:link action="list" params="${params + [dateCreated: 1]}" title="${message(code:'app.default.filters.date.today.label')}">
                <i class="fa fa-time"></i>
                <g:message code="app.default.filters.date.today.label" />
            </g:link>
        </li>
        <li class="${(params.dateCreated == "7")?('active'):('')}">
            <g:link action="list" params="${params + [dateCreated: 7]}" title="${message(code:'app.default.filters.date.lastWeek.label')}">
                <i class="fa fa-time"></i>
                <g:message code="app.default.filters.date.lastWeek.label" />
            </g:link>
        </li>
        <li class="${(params.dateCreated == "30")?('active'):('')}">
            <g:link action="list" params="${params + [dateCreated: 30]}" title="${message(code:'app.default.filters.date.lastMonth.label')}">
                <i class="fa fa-time"></i>
                <g:message code="app.default.filters.date.lastMonth.label" />
            </g:link>
        </li>

        <li class="dropdown-header"><g:message code="app.default.filters.lastLogin.label" /></li>
        <li class="${(params.lastUpdated == '' || params.lastUpdated == null)?('active'):('')}">
            <g:link action="list" params="${params + [lastUpdated: '']}" title="${message(code:'app.default.filters.date.allTime.label')}">
                <i class="fa fa-time"></i>
                <g:message code="app.default.filters.date.allTime.label" />
            </g:link>
        </li>
        <li class="${(params.lastUpdated == "30")?('active'):('')}">
            <g:link action="list" params="${params + [lastUpdated: 30]}" title="${message(code:'app.default.filters.date.lastMonth.label')}">
                <i class="fa fa-time"></i>
                <g:message code="app.default.filters.date.lastMonth.label" />
            </g:link>
        </li>
        <li class="${(params.lastUpdated == "7")?('active'):('')}">
            <g:link action="list" params="${params + [lastUpdated: 7]}" title="${message(code:'app.default.filters.date.lastWeek.label')}">
                <i class="fa fa-time"></i>
                <g:message code="app.default.filters.date.lastWeek.label" />
            </g:link>
        </li>
        <li class="${(params.lastUpdated == "1")?('active'):('')}">
            <g:link action="list" params="${params + [lastUpdated: 1]}" title="${message(code:'app.default.filters.date.today.label')}">
                <i class="fa fa-time"></i>
                <g:message code="app.default.filters.date.today.label" />
            </g:link>
        </li>
    </ul>
</div>