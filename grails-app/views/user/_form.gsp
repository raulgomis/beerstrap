<%@ page import="com.app.admin.domain.security.User" %>

<fieldset>
    <legend><g:message code="app.user.userDetails.label"/></legend>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
        <label class="control-label" for="username">
            <g:message code="user.username.label" default="Username"/>
            <span class="required-indicator">*</span>
        </label>

        <div class="controls">
            <g:textField name="username" required="" value="${userInstance?.username}" class="form-control"/>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
        <label class="control-label" for="password">
            <g:message code="user.password.label" default="Password"/>
            <span class="required-indicator">*</span>
        </label>
        <g:field type="password" name="password" required="" value="${userInstance?.password}" class="form-control"/>

    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
        <label class="control-label" for="name">
            <g:message code="user.name.label" default="Name"/>
        </label>
        <g:textField name="name" value="${userInstance?.name}" class="form-control"/>
    </div>

    <div class="form-group ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
        <label class="control-label" for="email">
            <g:message code="user.email.label" default="Email"/>
            <span class="required-indicator">*</span>
        </label>
        <g:field type="email" name="email" required="" value="${userInstance?.email}" class="form-control"/>
    </div>

</fieldset>

<fieldset>
    <legend><g:message code="app.user.userAccount.label"/></legend>

    <div class="checkbox ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
        <label class="control-label" for="enabled">
            <g:message code="user.enabled.label" default="Enabled"/>
        </label>
        <g:checkBox name="enabled" value="${userInstance?.enabled}" />
    </div>

    <div class="checkbox ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
        <label class="control-label" for="accountExpired">
            <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
            <g:message code="user.accountExpired.label" default="Account Expired"/>
        </label>
    </div>

    <div class="checkbox ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
        <label class="control-label" for="accountLocked">
            <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
            <g:message code="user.accountLocked.label" default="Account Locked" class="form-control"/>
        </label>
    </div>

    <div class="checkbox ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
        <label class="control-label" for="passwordExpired">
            <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
            <g:message code="user.passwordExpired.label" default="Password Expired"/>
        </label>
    </div>
</fieldset>

<fieldset>
    <legend><g:message code="app.profile.preferences.culture.label"/></legend>

    <div class="form-group">
        <label class="control-label"><g:message code="user.preferences.country.label" default="Country"/></label>
        <g:countrySelect name="country" value="${userInstance?.preferences?.country}" noSelection="['': '-Choose your country-']" class="form-control"/>
    </div>

    <div class="form-group">
        <label class="control-label"><g:message code="user.preferences.locale.label" default="Locale"/></label>
        <g:localeSelect name="locale" value="${userInstance?.preferences?.locale}" noSelection="['': '-Choose your locale-']" class="form-control"/>
    </div>

    <div class="form-group">
        <label class="control-label"><g:message code="user.preferences.timezone.label" default="Time Zone"/></label>
        <g:timeZoneSelect name="timezone" value="${java.util.TimeZone.getTimeZone(userInstance?.preferences?.timezone)}"
                          noSelection="['': '-Choose your time zone-']" class="form-control"/>
    </div>

    <div class="form-group">
        <label class="control-label"><g:message code="user.preferences.currency.label" default="Currency"/></label>
        <g:currencySelect name="currency" value="${java.util.Currency.getInstance(userInstance?.preferences?.currency)}"
                          noSelection="['': '-Choose your currency-']" class="form-control"/>
    </div>

</fieldset>

<fieldset>
    <legend><g:message code="app.profile.preferences.messages.label"/></legend>

    <label id="optionsCheckboxesEmails">Send me an email when</label>

    <div class="checkbox">
        <label>
            <g:checkBox name="email_subscription" value="${userInstance?.preferences?.email_subscription}" />
            <span>Email Subscription</span>
        </label>
    </div>

    <div class="checkbox">
        <label><g:checkBox name="email_directmessage" value="${userInstance?.preferences?.email_directmessage}" />
            <span>Someone send me a direct message</span>
        </label>
    </div>

    <div class="checkbox">
        <label><g:checkBox name="email_mention" value="${userInstance?.preferences?.email_mention}" />
            <span>Someone mentions me</span>
        </label>
        <span class="help-block"><strong><g:message code="app.default.note.label"/>:</strong> Labels
        surround all the options for much larger click areas and a
        more usable form.
        </span>
    </div>

</div>
</fieldset>

<fieldset>
    <legend><g:message code="app.profile.preferences.alerts.label"/></legend>

        <label id="optionsCheckboxesAlerts">Send me an email when</label>

        <div class="checkbox">
            <label>
                <g:checkBox name="email_alert_type1" value="${userInstance?.preferences?.email_alert_type1}" />
                <span>Email Alert 1</span>
            </label>
        </div>

        <div class="checkbox">
            <label>
                <g:checkBox name="email_alert_type2" value="${userInstance?.preferences?.email_alert_type2}" />
                <span>Email Alert 2</span>
            </label>
        </div>

        <div class="checkbox">
            <label>
                <g:checkBox name="email_alert_type3" value="${userInstance?.preferences?.email_alert_type3}" />
                <span>Email Alert 3</span>
            </label>
        </div>
        <span class="help-block"><strong><g:message code="app.default.note.label"/>:</strong> Labels
        surround all the options for much larger click areas and a
        more usable form.
        </span>

</fieldset>
