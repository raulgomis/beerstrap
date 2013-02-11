<!doctype html>
<html>
<head>
<meta name="layout" content="main" />
<title>Home</title>
<parameter name="menu_Home" value="active" />
</head>
<body>
	<div class="page-header">
		<h1>
			<i class="icon-dashboard"></i>
			<bs:config key="BT_SITE_NAME" />
			<small><g:message code="app.home.description.label"></g:message></small>
		</h1>
		<!--
		<ul class="breadcrumb">
		  <li><a href="#">Home</a> <span class="divider">/</span></li>
		  <li class="active">You are here</li>
		</ul>
		-->
	</div>
<div class="row-fluid">
	<div class="span8">
    <div id="d3" style="width: 100%">
        <img src="http://demandware.edgesuite.net/aagl_prd/on/demandware.static/Sites-adidas-CO-Site/-/es_CO/v1358302772225/images/loading-small.gif" class="pull-right" />
    </div>
	</div>
	<div class="span4">
        <div class="peity"><canvas height="32" width="58"></canvas><span class="pbar" style="display: none;">5,3,8,7,9,1,2,6,5,8</span>
            <h4>71 </h4>
            <h4 class="sub">signups</h4>
        </div>
        <div class="peity"><canvas height="32" width="58"></canvas><span class="pbar" style="display: none;">2,7,6,2,9,8,6,0,1,3</span>
            <h4>96</h4>
            <h4 class="sub">bounces</h4>
        </div>
        <div class="peity"><canvas height="32" width="58"></canvas><span class="pbar" style="display: none;">8,9,6,5,7,3,1,4,2,1</span>
            <h4>25</h4>
            <h4 class="sub">ad views</h4>
        </div>
        <div class="peity"><canvas height="32" width="58"></canvas><span class="pbar" style="display: none;">4,5,3,7,4,6,5,6,3,4</span>
            <h4>82</h4>
            <h4 class="sub">comments</h4><br>
        </div>
	</div>
</div>
<br>
<br>
<hr>

<div class="row-fluid">
    <div class="span3 knob">
        <h4>JOBS</h4>
		<input type="text" value="45" class="dial" data-readOnly=true data-fgColor="#14B8D4" data-width="120" />
    </div>
    <div class="span3 knob">
        <h4>JOBS</h4>
		<input type="text" value="45" class="dial" data-readOnly=true data-fgColor="#EA494A" data-width="120" />
    </div>
    <div class="span3 knob">
        <h4>JOBS</h4>
		<input type="text" value="45" class="dial" data-readOnly=true data-fgColor="#FFA93C" data-width="120" />
    </div>
    <div class="span3 knob">
        <h4>JOBS</h4>
		<input type="text" value="45" class="dial" data-readOnly=true data-fgColor="#333" data-width="120" />
    </div>
</div>
<%--
<div id="activeUsers" style="height: 300px; padding: 0px; position: relative;">
    --%>

<div class="row-fluid">
    <div class="span6">
        <div class="table-panel">
            <h4> <i class="icon-eye-open"></i>Browsers</h4>
            <table class="table table-striped sortable">
                <thead>
                <tr>
                    <th class="header headerSortUp">Browser</th>
                    <th class="header">Visitors</th>
                </tr>
                </thead>
                <tbody>





                <tr>
                    <td>Safari</td>
                    <td>3021</td>
                </tr><tr>
                    <td>Opera</td>
                    <td>922</td>
                </tr><tr>
                    <td>Internet Explorer</td>
                    <td>1011</td>
                </tr><tr>
                    <td>Firefox</td>
                    <td>9580</td>
                </tr><tr>
                    <td>Chrome</td>
                    <td>7668</td>
                </tr></tbody>
            </table>
        </div>
    </div>
    <div class="span6">
        <div class="table-panel">
            <h4> <i class="icon-share-alt"></i>Referrers</h4>
            <table class="table table-striped sortable">
                <thead>
                <tr>
                    <th class="header">URL</th>
                    <th class="header">Visits</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td> <a href="">google.com</a></td>
                    <td>17665</td>
                </tr>
                <tr>
                    <td><a href="">bing.com</a></td>
                    <td>24588</td>
                </tr>
                <tr>
                    <td><a href="">logobro.com</a></td>
                    <td>13022</td>
                </tr>
                <tr>
                    <td><a href="">yahoo.com</a></td>
                    <td>8922</td>
                </tr>
                <tr>
                    <td><a href="">duckduckgo.com</a></td>
                    <td>11014</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</body>
</html>
