<div class="page-header">
    <h1>
        <i class="fa fa-paint-brush"></i> Sandbox <small>Your UI components!</small>
    </h1>
</div>

<ul class="nav nav-pills nav-margin-bottom">
    <li class="${selected == 'components' ? 'active' : ''}"><g:link action="components"><g:message code="app.sandbox.components.label"/></g:link></li>
    <li class="${selected == 'forms' ? 'active' : ''}"><g:link action="forms"><g:message code="app.sandbox.forms.label"/></g:link></li>
    <li class="${selected == 'reports' ? 'active' : ''}"><g:link action="reports"><g:message code="app.sandbox.reports.label"/></g:link></li>
    <li class="${selected == 'maps' ? 'active' : ''}"><g:link action="maps"><g:message code="app.sandbox.maps.label"/></g:link></li>
</ul>