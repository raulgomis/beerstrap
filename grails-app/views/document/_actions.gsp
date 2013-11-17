<div class="btn-group">
    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
        <g:message code="default.actions.label"/> <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <li class="dropdown-header">Export</li>
        <li>
            <g:link action="list" title="pdf">
                <i class="fa fa-filter"></i>
                Export to PDF
            </g:link>
        </li>
        <li>
            <g:link action="list" title="pdf">
                <i class="fa fa-filter"></i>
                Export to Word
            </g:link>
        </li>
        <li class="dropdown-header">Bulk actions</li>
        <li>
            <a href="#modal-upload" data-toggle="modal" data-target="#modal-upload">
                <i class="fa fa-upload"></i>
                <g:message code="default.button.bulkUpload.label" />
            </a>
        </li>
        <li>
            <g:link action="bulk" title="download">
                <i class="fa fa-download"></i>
                <g:message code="default.button.bulkDownload.label" />
            </g:link>
        </li>
        <li>
            <g:link action="bulk" title="delete">
                <i class="fa fa-trash-o"></i>
                <g:message code="default.button.bulkDelete.label" />
            </g:link>
        </li>
    </ul>
</div>
