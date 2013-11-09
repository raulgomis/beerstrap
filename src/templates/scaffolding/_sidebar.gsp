<div class="well sidebar-nav">
	<ul class="nav nav-list">
		<li class="dropdown-header">Filter by property</li>
		<li class="\${(params.filter == '' || params.filter==null)?('active'):('')}">
			<g:link action="list" params="\${params + [filter:'']}" title="All">
				<i class="fa fa-filter"></i>
				All items
			</g:link>
		</li>
	</ul>
</div>