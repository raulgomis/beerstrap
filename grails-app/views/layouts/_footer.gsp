<footer>
	<div class="container">

		<hr>
		<div class="row">
			<div class="span4">
				<p>
					<a rel="tooltip" href="http://www.twitter.com/rgomis" data-original-title="Grails Bootstrap">
					<g:meta name="app.name"></g:meta>
					<g:meta name="app.version"></g:meta>
					</a>

					
				</p>
			</div>


			<div class="span4">
				<g:render template="/common/lang" />
			</div>

			<div class="span4">
				<!-- 
				<div class="pull-left">
					<img class="img-circle" style="margin:0 15px 10px 0;" alt="Foto personal" src="https://si0.twimg.com/profile_images/1538926046/IMGP0701-2_bigger.jpg">
				</div>
				 -->
				<div>
					<strong>CONTACTO</strong>
					<ul class="unstyled">
						<li>Twitter: <a href="http://www.twitter.com/rgomis">@rgomis</a></li>
						<li>Linkedin: <a href="http://linkd.in/11eyTDE">http://linkd.in/11eyTDE</a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</footer>



<div class="modal fade" id="modal-general" style="display: none;">
	<div class="modal-header">
		<a class="close" data-dismiss="modal">×</a>
		<h3>Cargando...</h3>
	</div>
	<div class="modal-body">
		<p>Cargando...</p>
	</div>
	<div class="modal-footer">
		<a class="btn btn-primary" href="#"
			onclick="javascript:document.formdialog.submit();">Aceptar</a> <a
			class="btn" href="#"
			onclick="javascript:jQuery('#modal-general').modal('hide')">Cancelar</a>
	</div>
</div>



<g:if test="${flash.banner}">
	<div class="modal hide" id="banner-modal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Noticias</h3>
		</div>
		<div class="modal-body">
			<%
	List noticias = (List)flash.banner
	for(noticia in noticias){
		out << """<h4 class="alert-heading">${noticia.nombre}</h4>"""
		out << "<p>${noticia.descripcion}</p>"	
	}
	 %>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Aceptar</a>
		</div>
	</div>


</g:if>