<%@ page import="com.app.domain.security.User" %>

<div class="control-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label class="control-label" for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:textField name="username" required="" value="${userInstance?.username}"/>
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
	<label class="control-label" for="name">
		<g:message code="user.name.label" default="Name" />
		
	</label>
	<div class="controls">
		<g:textField name="name" value="${userInstance?.name}"/>
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label class="control-label" for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label class="control-label" for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
	</label>
	<div class="controls">
		<g:checkBox name="enabled" value="${userInstance?.enabled}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label class="control-label" for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
	</label>
	<div class="controls">
		<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label class="control-label" for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
	</label>
	<div class="controls">
		<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label class="control-label" for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
	</label>
	<div class="controls">
		<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label class="control-label" for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls">
		<g:field type="password" name="password" required="" value="${userInstance?.password}"/>
	</div>
</div>

<fieldset class="embedded"><legend><g:message code="user.preferences.label" default="Preferences" /></legend>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.country', 'error')} ">
	<label class="control-label" for="preferences.country">
		<g:message code="user.preferences.country.label" default="Country" />
	</label>
	<div class="controls">
		<g:textField name="country" value="${userPreferencesInstance?.country}"/>
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.currency', 'error')} ">
	<label class="control-label" for="preferences.currency">
		<g:message code="user.preferences.currency.label" default="Currency" />
	</label>
	<div class="controls">
		<g:textField name="currency" value="${userPreferencesInstance?.currency}"/>
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.email_alert_type1', 'error')} ">
	<label class="control-label" for="preferences.email_alert_type1">
		<g:message code="user.preferences.email_alert_type1.label" default="Emailalerttype1" />
	</label>
	<div class="controls">
		<g:checkBox name="email_alert_type1" value="${userPreferencesInstance?.email_alert_type1}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.email_alert_type2', 'error')} ">
	<label class="control-label" for="preferences.email_alert_type2">
		<g:message code="user.preferences.email_alert_type2.label" default="Emailalerttype2" />
		
	</label>
	<div class="controls">
		<g:checkBox name="email_alert_type2" value="${userPreferencesInstance?.email_alert_type2}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.email_alert_type3', 'error')} ">
	<label class="control-label" for="preferences.email_alert_type3">
		<g:message code="user.preferences.email_alert_type3.label" default="Emailalerttype3" />
	</label>
	<div class="controls">
		<g:checkBox name="email_alert_type3" value="${userPreferencesInstance?.email_alert_type3}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.email_directmessage', 'error')} ">
	<label class="control-label" for="preferences.email_directmessage">
		<g:message code="user.preferences.email_directmessage.label" default="Emaildirectmessage" />
	</label>
	<div class="controls">
		<g:checkBox name="email_directmessage" value="${userPreferencesInstance?.email_directmessage}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.email_mention', 'error')} ">
	<label class="control-label" for="preferences.email_mention">
		<g:message code="user.preferences.email_mention.label" default="Emailmention" />
		
	</label>
	<div class="controls">
		<g:checkBox name="email_mention" value="${userPreferencesInstance?.email_mention}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.email_subscription', 'error')} ">
	<label class="control-label" for="preferences.email_subscription">
		<g:message code="user.preferences.email_subscription.label" default="Emailsubscription" />
	</label>
	<div class="controls">
		<g:checkBox name="email_subscription" value="${userPreferencesInstance?.email_subscription}" />
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.locale', 'error')} ">
	<label class="control-label" for="preferences.locale">
		<g:message code="user.preferences.locale.label" default="Locale" />
	</label>
	<div class="controls">
		<g:textField name="locale" value="${userPreferencesInstance?.locale}"/>
	</div>
</div>

<div class="control-group ${hasErrors(bean: userInstance, field: 'preferences.timezone', 'error')} ">
	<label class="control-label" for="preferences.timezone">
		<g:message code="user.preferences.timezone.label" default="Timezone" />
	</label>
	<div class="controls">
		<g:textField name="timezone" value="${userPreferencesInstance?.timezone}"/>
	</div>
</div>

</fieldset>
