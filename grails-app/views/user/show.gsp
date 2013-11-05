<%@ page import="com.app.domain.security.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <parameter name="menu_User" value="active"/>
</head>

<body>

<div class="page-header">
    <h1><i class="fa fa-briefcase"></i> <g:message code="default.management.label" args="[entityName]" /> <small><g:message code="default.show.label" args="[entityName]"/></small></h1>
</div>

<div class="row rowbar">
    <div class="col-md-12">
        <div class="pull-left">
            <g:link class="btn" action="list">
                <i class="fa fa-th-list"></i>
                <g:message code="default.button.list.label" default="List"/>
            </g:link>
        </div>
        <div class="pull-right">
            <g:form action="delete">
                <g:hiddenField name="id" value="${userInstance?.id}"/>
                <g:link class="btn" action="edit" id="${userInstance?.id}">
                    <i class="fa fa-pencil"></i>
                    <g:message code="default.button.edit.label" default="Edit"/>
                </g:link>
                <button class="btn" type="submit" name="_action_delete"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                    <i class="fa fa-trash"></i>
                    <g:message code="default.button.delete.label" default="Delete"/>
                </button>
            </g:form>
        </div>
    </div>
</div>

<div class="row">

    <div class="col-md-6">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object" data-src="holder.js/64x64">
            </a>
            <div class="media-body">
                <h4 class="media-heading"><g:fieldValue bean="${userInstance}" field="username"/></h4>
                <g:fieldValue bean="${userInstance}" field="name"/>
            </div>
        </div>

        <h2><g:message code="app.user.userDetails.label" /></h2>

        <table class="table table-condensed property-list">
            <tr>
                <td><span id="username-label" class="property-label"><g:message code="user.username.label" default="Username"/></span></td>
                <td><span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span></td>
            </tr>

            <tr>
                <td><span id="name-label" class="property-label"><g:message code="user.name.label" default="Name"/></span></td>
                <td><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span></td>
            </tr>


            <tr>
                <td><span id="email-label" class="property-label"><g:message code="user.email.label" default="Email"/></span></td>
                <td><span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span></td>
            </tr>


            <tr>
                <td><span id="lastLogin-label" class="property-label"><g:message code="user.lastLogin.label" default="Last Login"/></span></td>
                <td><span class="property-value" aria-labelledby="lastLogin-label"><g:formatDate date="${userInstance?.lastLogin}"/></span></td>
            </tr>
        </table>

        <h2>Account details</h2>
        <table class="table table-condensed property-list">
            <tr>
                <td><span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled"/></span></td>
                <td><span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}"/></span></td>
            </tr>

            <tr>
                <td><span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired"/></span></td>
                <td><span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}"/></span></td>
            </tr>

            <tr>
                <td><span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked"/></span></td>
                <td><span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}"/></span></td>
            </tr>

            <tr>
                <td><span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired"/></span></td>
                <td><span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                        boolean="${userInstance?.passwordExpired}"/></span></td>
            </tr>

            <tr>
                <td><span id="dateCreated-label" class="property-label"><g:message code="user.dateCreated.label" default="Date Created"/></span></td>
                <td><span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}"/></span></td>
            </tr>

            <tr>
                <td><span id="lastUpdated-label" class="property-label"><g:message code="user.lastUpdated.label" default="Last Updated"/></span></td>
                <td><span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${userInstance?.lastUpdated}"/></span></td>
            </tr>

        </table>

    </div>

    <div class="col-md-6">
        <h2>User preferences</h2>
        <table class="table table-condensed property-list">
            <tr>
                <td><span id="country-label" class="property-label"><g:message code="user.preferences.country.label" default="Country"/></span></td>
                <td><span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${userInstance.preferences}" field="country"/></span></td>
            </tr>

            <tr>
                <td><span id="locale-label" class="property-label"><g:message code="user.preferences.locale.label" default="Locale"/></span></td>
                <td><span class="property-value" aria-labelledby="locale-label"><g:fieldValue bean="${userInstance.preferences}" field="locale"/></span></td>
            </tr>

            <tr>
                <td><span id="timezone-label" class="property-label"><g:message code="user.preferences.timezone.label" default="Time zone"/></span></td>
                <td><span class="property-value" aria-labelledby="timezone-label"><g:fieldValue bean="${userInstance.preferences}" field="timezone"/></span>
                </td>
            </tr>

            <tr>
                <td><span id="currency-label" class="property-label"><g:message code="user.preferences.currency.label" default="Currency"/></span></td>
                <td><span class="property-value" aria-labelledby="currency-label"><g:fieldValue bean="${userInstance.preferences}" field="currency"/></span>
                </td>
            </tr>


            <tr>
                <td><span id="email_subscription-label" class="property-label"><g:message code="user.preferences.email_subscription.label" default="Email Subscription"/></span></td>
                <td><span class="property-value" aria-labelledby="email_subscription-label"><g:fieldValue bean="${userInstance.preferences}" field="email_subscription"/></span></td>
            </tr>

            <tr>
                <td><span id="email_directmessage-label" class="property-label"><g:message code="user.preferences.email_directmessage.label" default="Someone send me a direct message"/></span></td>
                <td><span class="property-value" aria-labelledby="email_directmessage-label"><g:fieldValue bean="${userInstance.preferences}" field="email_directmessage"/></span></td>
            </tr>

            <tr>
                <td><span id="email_mention-label" class="property-label"><g:message code="user.preferences.email_mention.label" default="Someone mentions me"/></span></td>
                <td><span class="property-value" aria-labelledby="email_mention-label"><g:fieldValue bean="${userInstance.preferences}" field="email_mention"/></span>
                </td>
            </tr>

            <tr>
                <td><span id="email_alert_type1-label" class="property-label"><g:message code="user.preferences.email_alert_type1.label" default="Email Alert 1"/></span></td>
                <td><span class="property-value" aria-labelledby="email_alert_type1-label"><g:fieldValue bean="${userInstance.preferences}" field="email_alert_type1"/></span>
                </td>
            </tr>

            <tr>
                <td><span id="email_alert_type2-label" class="property-label"><g:message code="user.preferences.email_alert_type2.label" default="Email Alert 2"/></span></td>
                <td><span class="property-value" aria-labelledby="email_alert_type2-label"><g:fieldValue bean="${userInstance.preferences}" field="email_alert_type2"/></span>
                </td>
            </tr>

            <tr>
                <td><span id="email_alert_type3-label" class="property-label"><g:message code="user.preferences.email_alert_type3.label" default="Email Alert 3"/></span></td>
                <td><span class="property-value" aria-labelledby="email_alert_type3-label"><g:fieldValue bean="${userInstance.preferences}" field="email_alert_type3"/></span>
                </td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>
