<div class="page-header">
	<h1><i class="icon-user"></i>${entityName}</h1>
</div>
<ul class="nav nav-tabs">
	<li class="${selected == 'sb_account'?'active':''}"><g:link action="account" >Account</g:link></li>
	<li class="${selected == 'sb_password'?'active':''}"><g:link action="password">Password</g:link></li>
	<li class="${selected == 'sb_preferences'?'active':''}"><g:link action="preferences">Preferences</g:link></li>
</ul>