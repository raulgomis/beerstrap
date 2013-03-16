<div class="page-header">
    <h1><i class="icon-cog"></i>${entityName}</h1>
</div>
<ul class="nav nav-tabs">
    <li class="${selected == 'sb_site' ? 'active' : ''}">
        <g:link action="site"><g:message code="app.configuration.site.label"/></g:link>
    </li>
    <li class="${selected == 'sb_server' ? 'active' : ''}">
        <g:link action="server"><g:message code="app.configuration.server.label"/></g:link>
    </li>
    <li class="${selected == 'sb_system' ? 'active' : ''}">
        <g:link action="system"><g:message code="app.configuration.system.label"/></g:link>
    </li>
</ul>
