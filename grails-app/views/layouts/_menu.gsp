
<div class="navbar navbar-fixed-top">
	<%-- 
	<g:if env="development">
		<div class="ribbon">
			<a href="#">Desarrollo</a>
		</div>
	</g:if>
	--%>
	<div class="navbar-inner">
		<div class="container">
			<a id="brand" class="brand" href="${createLink(uri: '/')}"><bs:config name="BT_SITE_NAME"></bs:config>
			</a> 
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>

			<div class="nav-collapse">
				 
				<ul class="nav">
					<%--
					<sec:access url="/">
						<li class="${pageProperty(name:'page.menu_perfil')}"><g:link
								controller="perfil">
								<g:message code="menu.miperfil.label" default="Mi perfil" />
							</g:link></li>
					</sec:access>

					<sec:access url="/">
						<li class="${pageProperty(name:'page.menu_departamento')}"><g:link
								controller="midepartamento">
								<g:message code="menu.midepartamento.label"
									default="Mi departamento" />
							</g:link></li>
					</sec:access>

					<sec:access url="/">
						<li class="${pageProperty(name:'page.menu_empresa')}"><g:link
								controller="empresa">
								<g:message code="menu.empresa.label" default="Empresa" />
							</g:link></li>
					</sec:access>
				
				--%>
				
				<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
					<g:if test="${c.getPropertyValue('user')}">
						<sec:access controller="${c.logicalPropertyName}">
						<li class='controller ${pageProperty(name:"page.menu_"+c.name)}'>
							<g:link controller="${c.logicalPropertyName}">${c.name}</g:link>
						</li>
						</sec:access>
					</g:if>
				</g:each>
				</ul>


				<ul class="nav pull-right">
					<li class="dropdown">
						<g:render template="/layouts/menu/menuConfig" /></li>
				</ul>
				
				<g:form class="navbar-search pull-right" method="post"
					controller="search">
					<input type="text" name="q" placeholder="Texto a buscar"
						value="${params.q}" class="input-large search-query">
				</g:form>




			</div>
		</div>
	</div>
</div>

