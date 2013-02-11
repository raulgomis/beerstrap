<div class="page-header">
	<h1><i class="icon-user"></i>${entityName}</h1>
</div>
<ul class="nav nav-tabs">
	<li class="${selected == 'sb_account'?'active':''}"><g:link action="account" ><g:message code="app.profile.account.label"></g:message></g:link></li>
	<li class="${selected == 'sb_password'?'active':''}"><g:link action="password"><g:message code="app.profile.password.label"></g:message></g:link></li>
	<li class="${selected == 'sb_preferences'?'active':''}"><g:link action="preferences"><g:message code="app.profile.preferences.label"></g:message></g:link></li>
</ul>