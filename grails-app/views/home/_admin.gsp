<div class="row">
    <div class="col-md-12">
    <g:link controller="user" class="quick-button col-md-2">
        <i class="fa fa-group"></i>
        <p><g:message code="app.menu.user.label" /></p>
        <span class="notification">${countUsers}</span>
    </g:link>
    <g:link controller="document" class="quick-button col-md-2">
        <i class="fa fa-file"></i>
        <p><g:message code="app.menu.document.label" /></p>
        <span class="notification yellow">${countDocs}</span>
    </g:link>
    <g:link action="ajaxGraph" class="quick-button col-md-2 btn-ajax" data-toggle="modal" data-target="#modal-general">
        <i class="fa fa-envelope"></i>
        <p>Messages</p>
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
        <div id="chart"></div>
    </div>
    <div class="col-md-4">
        <div class="stat">
            <span class="stat-graph">
                <span class="pbar" style="display: none;">8,9,6,5,7,3,1,4,2,1</span>
            </span>
            <span class="stat-value text-primary">2</span>
            <span class="stat-title">signups</span>
        </div>
        <div class="stat">
            <span class="stat-graph">
                <span class="pbar" style="display: none;">2,7,6,2,9,8,6,0,1,3</span>
            </span>
            <span class="stat-value text-primary">96</span>
            <span class="stat-title">bounces</span>
        </div>
        <div class="stat">
            <span class="stat-graph">
                <span class="pbar" style="display: none;">8,9,6,5,7,3,1,4,2,1</span>
            </span>
            <span class="stat-value text-primary">25</span>
            <span class="stat-title">ad views</span>
        </div>
        <div class="stat">
            <span class="stat-graph">
                <span class="pbar" style="display: none;">4,5,3,7,4,6,5,6,3,4</span>
            </span>
            <span class="stat-value text-primary">82</span>
            <span class="stat-title">comments</span>
        </div>
    </div>
</div>
<br>
<br>
<hr>

<div class="row">
    <div class="col-md-3 knob">
        <div class="knob-title">INDICATOR 1</div>
        <input type="text" value="${indicator1}" class="dial" data-readOnly=true data-fgColor="#14B8D4" data-width="120" />
    </div>
    <div class="col-md-3 knob">
        <div class="knob-title">INDICATOR 2</div>
        <input type="text" value="${indicator2}" class="dial" data-readOnly=true data-fgColor="#EA494A" data-width="120" />
    </div>
    <div class="col-md-3 knob">
        <div class="knob-title">INDICATOR 3</div>
        <input type="text" value="${indicator3}" class="dial" data-readOnly=true data-fgColor="#FFA93C" data-width="120" />
    </div>
    <div class="col-md-3 knob">
        <div class="knob-title">INDICATOR 4</div>
        <input type="text" value="${indicator4}" class="dial" data-readOnly=true data-fgColor="#333" data-width="120" />
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