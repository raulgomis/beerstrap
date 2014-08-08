<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <parameter name="menu_Help" value="active" />
</head>
<body>
    <g:render template="top" model="['selected':'faq']" />

    <div id="faq">
        <table class="table table-striped">
            <thead>
            <tr>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><bs:config key="${com.app.configuration.ConfigurationManager.BT_HELP_FAQ}"></bs:config></td>
            </tr>
        </table>
    </div>
</body>
</html>
