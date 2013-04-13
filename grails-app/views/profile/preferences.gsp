<%@ page import="com.app.domain.configuration.Configuration"%>
<html>
<head>
<parameter name="menu_Profile" value="active" />
<meta name="layout" content="main" />
<g:set var="entityName"
    value="${message(code: 'profile.label', default: 'Profile')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
    <div class="row">
        <div class="span16">

            <g:render template="sidebar" model="['selected':'sb_preferences']" />

            <g:form action="updatePreferences" class="form-horizontal" method="POST">

                <div class="row">
                    <div class="span3">
                        <h2><g:message code="app.profile.preferences.label"></g:message></h2>
                        <p><g:message code="app.profile.preferences.description"></g:message></p>
                    </div>
                    <div class="span9">

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
                            <!-- /clearfix -->
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
                            <!-- /clearfix -->
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
                            <!-- /clearfix -->
                        </fieldset>

                        <div class="form-actions">
                            <button class="btn btn-primary">
                                <i class="icon-ok"></i>
                                <g:message code="default.button.update.label" default="Update" />
                            </button>
                        </div>

                    </div>
                </div>

            </g:form>
        </div>
    </div>
</body>
</html>
