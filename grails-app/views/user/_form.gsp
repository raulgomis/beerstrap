<%@ page import="com.app.domain.security.User" %>

<fieldset class="embedded">
    <legend>User details</legend>

<div class="control-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <label class="control-label" for="username">
        <g:message code="user.username.label" default="Username" />
        <span class="required-indicator">*</span>
    </label>
    <div class="controls">
        <g:textField name="username" required="" value="${userInstance?.username}"/>
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

</fieldset>

<fieldset class="embedded">
    <legend>User account</legend>

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
</fieldset>


<fieldset>
    <legend><g:message code="app.profile.preferences.culture.label"></g:message></legend>
    <div class="clearfix">
        <div class="control-group">
            <label class="control-label"><g:message code="user.preferences.country.label" default="Country" /></label>
            <div class="controls">
                <g:countrySelect name="country" value="${userInstance?.preferences?.country}" noSelection="['':'-Choose your country-']" class="span5"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"><g:message code="user.preferences.locale.label" default="Locale" /></label>
            <div class="controls">
                <g:localeSelect name="locale" value="${userInstance?.preferences?.locale}" noSelection="['':'-Choose your locale-']" class="span5"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"><g:message code="user.preferences.timezone.label" default="Time Zone" /></label>
            <div class="controls">
                <g:timeZoneSelect name="timezone" value="${java.util.TimeZone.getTimeZone(userInstance?.preferences?.timezone)}" noSelection="['':'-Choose your time zone-']" class="span5"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label"><g:message code="user.preferences.currency.label" default="Currency" /></label>
            <div class="controls">
                <g:currencySelect name="currency" value="${java.util.Currency.getInstance(userInstance?.preferences?.currency)}" noSelection="['':'-Choose your currency-']" class="span5"/>
            </div>
        </div>
    </div>
</fieldset>

<fieldset>
    <legend><g:message code="app.profile.preferences.messages.label"/></legend>
    <div class="clearfix">
        <label id="optionsCheckboxesEmails">Send me an email when</label>
        <div class="controls">
            <label>
                <g:checkBox name="email_subscription" value="${userInstance?.preferences?.email_subscription}" class="checkbox" />
                <span>Email Subscription</span>
            </label>
            <label> <g:checkBox name="email_directmessage" value="${userInstance?.preferences?.email_directmessage}" class="checkbox" />
                <span>Someone send me a direct message</span>
            </label>
            <label> <g:checkBox name="email_mention" value="${userInstance?.preferences?.email_mention}" class="checkbox" />
                <span>Someone mentions me</span>
            </label>
            <span class="help-block"> <strong><g:message code="app.default.note.label"/>:</strong> Labels
            surround all the options for much larger click areas and a
            more usable form.
            </span>
        </div>
    </div>
</fieldset>

<fieldset>
    <legend><g:message code="app.profile.preferences.alerts.label"/></legend>
    <div class="clearfix">
        <label id="optionsCheckboxesAlerts">Send me an email when</label>
        <div class="controls">
            <label>
                <g:checkBox name="email_alert_type1" value="${userInstance?.preferences?.email_alert_type1}" class="checkbox" />
                <span>Email Alert 1</span>
            </label>
            <label>
                <g:checkBox name="email_alert_type2" value="${userInstance?.preferences?.email_alert_type2}" class="checkbox" />
                <span>Email Alert 2</span>
            </label>
            <label>
                <g:checkBox name="email_alert_type3" value="${userInstance?.preferences?.email_alert_type3}" class="checkbox" />
                <span>Email Alert 3</span>
            </label>
            <span class="help-block"> <strong><g:message code="app.default.note.label"/>:</strong> Labels
            surround all the options for much larger click areas and a
            more usable form.
            </span>
        </div>
    </div>
</fieldset>


</fieldset>
