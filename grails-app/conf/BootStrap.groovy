class BootStrap {

    def bootstrapService

    def init = { servletContext ->

        println "Init bootstrap"
        environments {

            development {
                bootstrapService.loadRequestMap()
                bootstrapService.loadPermissions()
                bootstrapService.loadInitialUsers()
                bootstrapService.loadInitialData()
                bootstrapService.loadExampleData()
            }

            test {
                bootstrapService.loadRequestMap()
                bootstrapService.loadPermissions()
                bootstrapService.loadInitialUsers()
            }

            production {
                bootstrapService.loadRequestMap()
                bootstrapService.loadPermissions()
                bootstrapService.loadInitialUsers()
                bootstrapService.loadInitialData()
                bootstrapService.loadExampleData()
            }
        }
        println "End bootstrap"

    }
    def destroy = {
    }
}