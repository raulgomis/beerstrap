class BootStrap {

    def bootstrapService

    def init = { servletContext ->
        environments {

            development {
                bootstrapService.loadInitialData()
                bootstrapService.loadExampleData()
            }

            test {
                bootstrapService.loadInitialData()
                bootstrapService.loadExampleData()
            }

            production {
                bootstrapService.loadInitialData()
            }
        }
    }
    def destroy = {
    }
}