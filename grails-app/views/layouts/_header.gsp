<div class="navbar navbar-fixed-top">

    <g:if env="development">
        <div class="ribbon">
            <a href="#">Development</a>
        </div>
    </g:if>

    <div class="navbar-inner">
        <div class="container">
            <g:link class="navbar-brand" controller="home">
                <i class="fa fa-beer"></i>
                <bs:config key="${com.app.configuration.ConfigurationManager.BT_SITE_NAME}"></bs:config>
            </g:link>
            <a class="btn navbar-btn" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="fa fa-bar"></span>
                <span class="fa fa-bar"></span>
                <span class="fa fa-bar"></span>
            </a>
            <div class="navbar-collapse">
                <ul class="nav">
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
                <ul class="nav pull-right">
                    <li class="dropdown">
                        <g:render template="/layouts/menuAdmin" /></li>
                </ul>
                <g:form class="navbar-search pull-right" method="post" controller="search">
                    <input type="text" name="q" placeholder="${message(code:'app.menu.search.label')}" value="${params.q}" class="input-lg search-query" />
                </g:form>
            </div>
        </div>
    </div>
</div>