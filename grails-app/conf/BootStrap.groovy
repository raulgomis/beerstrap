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

            demo {
                bootstrapService.loadInitialData()
                bootstrapService.loadExampleData()
            }
        }
    }
    def destroy = {
    }
}