<style>
.panel-body .btn:not(.btn-block) { width:16.3%;margin-bottom:10px; }
</style>
<!--
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-bookmark"></span> Quick Shortcuts</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-list-alt"></span> <br/>Apps </a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-bookmark"></span> <br/>Bookmarks</a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-signal"></span> <br/>Reports</a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Comments</a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-user"></span> <br/>Users</a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-file"></span> <br/>Notes</a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-picture"></span> <br/>Photos</a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-tag"></span> <br/>Tags</a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-picture"></span> <br/>Photos</a>
                            <a href="#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-tag"></span> <br/>Tags</a>
                        </div>
                    </div>
                    <a href="http://www.jquery2dotnet.com/" class="btn btn-default btn-lg btn-block" role="button"><span class="glyphicon glyphicon-globe"></span> Website</a>
                </div>
            </div>
        </div>
    </div>
 -->
<div class="row">
    <div class="col-md-12">
    <g:link controller="user" class="quick-button col-md-2">
        <i class="fa fa-group"></i>
        <p><g:message code="app.menu.user.label" /></p>
        <span class="notification">1.367</span>
    </g:link>
    <g:link controller="document" class="quick-button col-md-2">
        <i class="fa fa-file"></i>
        <p><g:message code="app.menu.document.label" /></p>
        <span class="notification yellow">167</span>
    </g:link>
    <g:link action="ajaxGraph" class="quick-button col-md-2 btn-ajax" data-toggle="modal" data-target="#modal-general">
        <i class="fa fa-envelope"></i>
        <p>Messages</p>
        <span class="notification red">68</span>
    </g:link>
    <g:link controller="configuration" class="quick-button col-md-2">
        <i class="fa fa-cog"></i>
        <p><g:message code="app.menu.configuration.label" /></p>
    </g:link>
    <g:link controller="help" class="quick-button col-md-2">
        <i class="fa fa-question-circle"></i>
        <p><g:message code="app.menu.help.label" /></p>
    </g:link>
    </div>

</div>
<hr>
<div class="row">
    <div class="col-md-8">
        <div id="d3" style="width: 100%;">
            <g:img dir="images" file="loading-small.gif"></g:img>
        </div>
    </div>
    <div class="col-md-4">
        <div class="peity"><span class="pbar" style="display: none;">5,3,8,7,9,1,2,6,5,8</span>
            <h4>2 </h4>
            <h4 class="sub">signups</h4>
        </div>
        <div class="peity"><span class="pbar" style="display: none;">2,7,6,2,9,8,6,0,1,3</span>
            <h4>96</h4>
            <h4 class="sub">bounces</h4>
        </div>
        <div class="peity"><span class="pbar" style="display: none;">8,9,6,5,7,3,1,4,2,1</span>
            <h4>25</h4>
            <h4 class="sub">ad views</h4>
        </div>
        <div class="peity"><span class="pbar" style="display: none;">4,5,3,7,4,6,5,6,3,4</span>
            <h4>82</h4>
            <h4 class="sub">comments</h4><br>
        </div>
        <%--
        <g:link action="ajaxGraph" class="btn-ajax btn" data-toggle="modal" data-target="#modal-general">Ajax call</g:link>
        --%>
    </div>
</div>
<br>
<br>
<hr>

<div class="row">
    <div class="col-md-3 knob">
        <h4>INDICATOR 1</h4>
        <input type="text" value="45" class="dial" data-readOnly=true data-fgColor="#14B8D4" data-width="120" />
    </div>
    <div class="col-md-3 knob">
        <h4>INDICATOR 2</h4>
        <input type="text" value="45" class="dial" data-readOnly=true data-fgColor="#EA494A" data-width="120" />
    </div>
    <div class="col-md-3 knob">
        <h4>INDICATOR 3</h4>
        <input type="text" value="45" class="dial" data-readOnly=true data-fgColor="#FFA93C" data-width="120" />
    </div>
    <div class="col-md-3 knob">
        <h4>INDICATOR 4</h4>
        <input type="text" value="45" class="dial" data-readOnly=true data-fgColor="#333" data-width="120" />
    </div>
</div>
<!--
<div id="activeUsers" style="height: 300px; padding: 0px; position: relative;">       </div>
-->

<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-eye"></i> Browsers</div>
            <table class="table table-striped sortable">
                <thead>
                <tr>
                    <th class="header headerSortUp">Browser</th>
                    <th class="header">Visitors</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${['Safari':3021,'Opera':922,'Internet Explorer':1011,'Firefox':9580,'Chrome':7668]}" var="data">
                    <tr>
                        <td>${data.key}</td>
                        <td>${data.value}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-link"></i> Referrers</div>
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