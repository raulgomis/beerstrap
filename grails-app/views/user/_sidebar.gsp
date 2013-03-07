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