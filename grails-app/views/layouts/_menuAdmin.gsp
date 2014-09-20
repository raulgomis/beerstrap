<a class="dropdown-toggle" data-toggle="dropdown" href="#">
    <i class="fa fa-user"></i>
    <sec:loggedInUserInfo field="username">No user</sec:loggedInUserInfo>
    <b class="caret"></b>
</a>
<ul class="dropdown-menu">
    <li class='controller ${pageProperty(name:"page.menu_Profile")}'>
        <g:link controller="profile" action="index">
        <i class="fa fa-user"></i>
        <g:message code="app.menu.profile.label" />
        </g:link>
    </li>

    <sec:access url="/admin/**">
        <li class="divider"></li>
        <li class="dropdown-header"><g:message code="app.menu.management.label" /></li>

        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
            <g:if test="${c.getPropertyValue('admin')}">
                <li class='${pageProperty(name:"page.menu_"+c.name)}'>
                    <g:link controller="${c.logicalPropertyName}">
                        <i class="fa fa-briefcase"></i>
                        <g:message code="app.menu.${c.name.toLowerCase()}.label" default="${c.name}" />
                    </g:link>
                </li>
            </g:if>
        </g:each>

        <li class='${pageProperty(name:"page.menu_Configuration")}'>
            <g:link controller="configuration">
                <i class="fa fa-cog"></i>
                <g:message code="app.menu.configuration.label" />
            </g:link>
        </li>

        <li class='${pageProperty(name:"page.menu_Sandbox")}'>
            <g:link controller="sandbox">
                <i class="fa fa-paint-brush"></i>
                <g:message code="app.menu.sandbox.label" />
            </g:link>
        </li>
    </sec:access>

    <li class="divider"></li>
    <li class='${pageProperty(name:"page.menu_Help")}'>
        <g:link controller="help" action="index">
            <i class="fa fa-question-circle"></i>
            <g:message code="app.menu.help.label" />
        </g:link>
    </li>
    <li>
        <g:link controller="logout">
        <i class="fa fa-power-off"></i>
        <g:message code="app.menu.signout.label" />
        </g:link>
    </li>

</ul>