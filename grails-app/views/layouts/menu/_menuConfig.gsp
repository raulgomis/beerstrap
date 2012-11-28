<a class="dropdown-toggle" data-toggle="dropdown" href="#">
<img src="https://secure.gravatar.com/avatar/b8858d36dfda0373ac35edfb084e3b17?d=https%3A%2F%2Fdwz7u9t8u8usb.cloudfront.net%2Fm%2F2219cd120e6a%2Fimg%2Fdefault_avatar%2F32%2Fuser_blue.png&amp;s=32" alt="raulgomis" height="18" width="18">
	<sec:username/> 
	<b class="caret"></b>
</a>
<ul class="dropdown-menu">
	<li class='controller ${pageProperty(name:"page.menu_Profile")}'>
		<g:link controller="profile" action="index">
		<i class="icon-user"></i>
		<g:message code="menu.administracion.profile.label" default="Mi perfil" />
		</g:link>
	</li>
	
	<sec:access url="/admin/**">
		<li class="divider"></li>
		<li class="nav-header">Administración</li>
		<%-- 
		<li><g:link controller="news"><g:message code="menu.administracion.noticias.label" default="Noticias" /></g:link></li>
		<li><g:link controller="user" action="list"><g:message code="menu.administracion.usuarios.label" default="Usuarios" /></g:link></li>
		<li><g:link controller="configuration" action="list"><g:message code="menu.administracion.configuracion.label" default="Configuración global" /></g:link></li>
		--%>
		<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
			<g:if test="${c.getPropertyValue('admin')}">
				<li class='controller ${pageProperty(name:"page.menu_"+c.name)}'>
					<g:link controller="${c.logicalPropertyName}">
					<i class="icon-briefcase"></i>
					<g:message code="menu.administracion.${c.name}.label" default="${c.name}" />
					</g:link>
				</li>
			</g:if>
		</g:each>
	</sec:access>
	<li class="divider"></li>
	<li class='controller ${pageProperty(name:"page.menu_Help")}'>
		<g:link controller="help" action="index">
		<i class="icon-question-sign"></i>
		<g:message code="menu.usuario.ayuda.label" default="Ayuda" />
		</g:link>
	</li>
	<li>
		<g:link controller="logout">
		<i class="icon-off"></i>
		<g:message code="menu.usuario.cerrarSesion.label" default="Cerrar sesión" />
		</g:link>
	</li>
	
</ul>