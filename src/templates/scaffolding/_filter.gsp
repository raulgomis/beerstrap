<div class="btn-group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-filter"></i> <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <li class="dropdown-header">Filter by property</li>
        <li class="\${(params.filter == '' || params.filter==null)?('active'):('')}">
            <g:link action="list" params="\${params + [filter:'']}" title="All">
                <i class="fa fa-filter"></i>
                All items
            </g:link>
        </li>
        <li class="divider"></li>
    </ul>
</div>
