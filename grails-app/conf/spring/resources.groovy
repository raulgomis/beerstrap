// Place your Spring DSL code here
import com.app.security.*
import com.app.utils.*

beans = {
    //Custom UserDetailsService
    userDetailsService(CustomUserDetailsService)

    //Access to grailsApplication in the groovy class ApplicationSupport
    ApplicationSupport(com.app.utils.ApplicationSupport) {
        grailsApplication = ref('grailsApplication')
    }

    //Access to configurationService in the groovy class ConfigurationManager
    ConfigurationManager(com.app.configuration.ConfigurationManager) {
        configurationService = ref('configurationService')
    }

    //Custom date input
    customPropertyEditorRegistrar(CustomPropertyEditorRegistrar)
}
