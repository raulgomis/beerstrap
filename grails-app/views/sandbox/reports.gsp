<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <parameter name="menu_Sandbox" value="active" />
</head>
<body>
<article>
    <header>
    <g:render template="top" model="['selected':'reports']" />
    </header>
    <div id="reports">
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Chart 1
                    </div>
                    <div class="panel-body">
                        <div id="chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Chart 2
                    </div>
                    <div class="panel-body">
                        <div id="chart2"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Chart 3
                    </div>
                    <div class="panel-body">
                        <div id="chart3"></div>
                    </div>
                </div>
            </div>
        </div>

        <script>

        </script>
    </div>
</article>
</body>
</html>
