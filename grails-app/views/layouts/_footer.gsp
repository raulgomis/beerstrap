<footer>
<div class="container">

<hr>
				<div class="row">
                    <div class="span4">
                        <p>
                        	<g:meta name="app.name"></g:meta> <g:meta name="app.version"></g:meta>
                            <a rel="tooltip" href="http://www.eltallerdigital.com" data-original-title="Desarrollado por © Taller Digital de la Universidad de Alicante y Universidad de Alicante">
                                <img alt="Logo Taller Digital" src="http://www.eltallerdigital.com/logo_taller_info.png">
                            </a>                           
                        </p>
                    </div>


					<div class="span4">
                        <g:render template="/common/lang" />
					</div>
                    

					<div class="span4">
						<strong>CONTACTO</strong>
						<ul class="unstyled">
							<li>Telf: +34 965909414</li>
							<li><a href="mailto:utc@ua.es">utc@ua.es</a></li>
						</ul>
						
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
    	<a class="btn btn-primary" href="#" onclick="javascript:document.formdialog.submit();">Aceptar</a>
    	<a class="btn" href="#" onclick="javascript:jQuery('#modal-general').modal('hide')">Cancelar</a>
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