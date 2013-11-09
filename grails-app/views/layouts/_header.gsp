<nav class="navbar navbar-inverse bs-docs-nav" role="navigation">

%{--    <g:if env="development">
        <div class="ribbon">
            <a href="#">Development</a>
        </div>
    </g:if>--}%

    <div class="navbar-inner">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <g:link class="navbar-brand" controller="home">
                    <i class="fa fa-beer"></i>
                    <bs:config key="${com.app.configuration.ConfigurationManager.BT_SITE_NAME}"></bs:config>
                </g:link>
            </div>

            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
                        <g:if test="${c.getPropertyValue('user')}">
                            <sec:access controller="${c.logicalPropertyName}">
                                <li class='controller ${pageProperty(name:"page.menu_"+c.name)}'>
                                    <g:link controller="${c.logicalPropertyName}">
                                        <g:message code="app.menu.${c.name.toLowerCase()}.label" default="${c.name}" />
                                    </g:link>
                                </li>
                            </sec:access>
                        </g:if>
                    </g:each>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <g:render template="/layouts/menuAdmin" /></li>
                </ul>
                <g:form class="navbar-form navbar-right" method="post" controller="search" role="search">
                    <div class="form-group">
                        <input type="text" name="q" placeholder="${message(code:'app.menu.search.label')}" value="${params.q}" class="form-control search-query" />
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</nav>