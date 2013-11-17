<div class="btn-group">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
        <g:message code="default.actions.label"/> <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <li class="dropdown-header">Export</li>
        <li>
            <g:link action="export" title="pdf">
                <i class="fa fa-filter"></i>
                Export to PDF
            </g:link>
        </li>
        <li>
            <g:link action="export" title="word">
                <i class="fa fa-filter"></i>
                Export to Word
            </g:link>
        </li>
        <li class="dropdown-header">Bulk actions</li>
        <li>
            <g:link action="list" title="pdf">
                <i class="fa fa-filter"></i>
                <g:message code="default.button.bulkDelete.label"></g:message>
            </g:link>
        </li>
    </ul>
</div>
