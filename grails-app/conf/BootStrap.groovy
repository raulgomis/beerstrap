class BootStrap {
	
	def bootstrapService

    def init = { servletContext ->
		
		println "Inicio bootstrap"
        environments {

            development {
				
	            bootstrapService.cargarRequestMapInicial()
	            bootstrapService.cargarPermisos()
	            bootstrapService.cargarRolesyUsuarios()
	            bootstrapService.loadInitialData()
	            bootstrapService.cargarDatosEjemplo()
            
            }

            test {
                bootstrapService.cargarRequestMapInicial()
                bootstrapService.cargarPermisos()
                bootstrapService.cargarRolesyUsuarios()
            }

            production {

            }
        }
		println "Fin bootstrap"
		
    }
    def destroy = {
    }
}