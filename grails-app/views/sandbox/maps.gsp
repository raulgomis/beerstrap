<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <parameter name="menu_Sandbox" value="active" />
    <script>
        $(function () {
            loadMap();
        });
    </script>
</head>
<body>
<article>
    <header>
        <g:render template="top" model="['selected':'maps']" />
    </header>
    <div id="maps">
        <div class="panel panel-default">
            <div class="panel-heading">Map</div>
            <div class="panel-map">
                <div id="map" style="height: 400px"></div>
            </div>
        </div>
    </div>
</article>
</body>
</html>
