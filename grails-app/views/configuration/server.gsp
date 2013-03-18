<%@ page import="com.app.domain.configuration.Configuration" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'configuration.label', default: 'Configuration')}"/>
    <parameter name="menu_Configuration" value="active"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
</head>

<body>

<g:render template="sidebar" model="['selected':'sb_server']"></g:render>

<g:form action="update">

    <h2>Email configuration</h2>
    <table class="table" summary="configuration table">
        <thead>
        <tr>
            <th class="span4"></th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${configurationEmailInstanceList}" status="i" var="configurationInstance">
            <tr>
                <td><strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}"/></strong>
                    <span rel="tooltip"
                          title="${message(code:"app.configuration.${configurationInstance?.key}.label",default:"")}"><i
                            class="icon-info-sign"></i></span>
                </td>
                <td>
                    <g:textField name="${configurationInstance?.key}" value="${configurationInstance?.value}" readonly="true" class="input-xxlarge"/>
                    <g:message code="app.configuration.${configurationInstance?.key}.description" default=""/>
                </td>
            </tr>
        </g:each>

        </tbody>
    </table>

    <%--
    <pre class="prettyprint">${grailsApplication.config.grails.mail}</pre>
     --%>



    </tbody>
</table>


    <h2>File uploader configuration</h2>
    <table class="table" summary="configuration table">
        <thead>
        <tr>
            <th class="span4"></th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${configurationDocsInstanceList}" status="i" var="configurationInstance">
            <tr>
                <td><strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}"/></strong>
                    <span rel="tooltip"
                          title="${message(code:"app.configuration.${configurationInstance?.key}.label",default:"")}"><i
                            class="icon-info-sign"></i></span>
                </td>
                <td>
                    <g:textField name="${configurationInstance?.key}" value="${configurationInstance?.value}" readonly="true" class="input-xxlarge"/>
                    <g:message code="app.configuration.${configurationInstance?.key}.description" default=""/>
                </td>
            </tr>
        </g:each>

        </tbody>
    </table>

    <%--
    <pre class="prettyprint">${grailsApplication.config.docs}</pre>
    --%>

    <h2>Database</h2><g:link controller="dbconsole" class="btn btn-mini btn-info" target="_blank"><i class="icon-hdd"></i> Database Console</g:link>
    <table class="table" summary="configuration table">
        <thead>
        <tr>
            <th class="span4"></th>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${configurationDBInstanceList}" status="i" var="configurationInstance">
            <tr>
                <td><strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}"/></strong>
                    <span rel="tooltip"
                          title="${message(code:"app.configuration.${configurationInstance?.key}.label",default:"")}"><i
                            class="icon-info-sign"></i></span>
                </td>
                <td>
                    <g:textField name="${configurationInstance?.key}" value="${configurationInstance?.value}" readonly="true" class="input-xxlarge"/>
                    <g:message code="app.configuration.${configurationInstance?.key}.description" default=""/>
                </td>
            </tr>
        </g:each>


        </tbody>
    </table>

    <%--
    <pre class="prettyprint">${grailsApplication.config.dataSource}</pre>
    --%>
    <%--
    <div class="form-actions">
        <button type="submit" class="btn btn-primary">
            <i class="icon-ok"></i>
            ${message(code: 'default.button.update.label', default: 'Update')}
        </button>
        <button type="reset" class="btn">
            <i class="icon-chevron-down"></i>
            <g:message code="app.default.button.reset.label"/>
        </button>
    </div>
    --%>


    <pre class="prettyprint">${grailsApplication.config}</pre>

</g:form>



</body>
</html>
