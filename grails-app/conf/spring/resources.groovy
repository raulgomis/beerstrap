// Place your Spring DSL code here
import com.app.security.*
import com.app.utils.*

beans = {
	userDetailsService(CustomUserDetailsService)
    ApplicationSupport(com.app.utils.ApplicationSupport) {
        grailsApplication = ref('grailsApplication')
    }
    customPropertyEditorRegistrar(CustomPropertyEditorRegistrar)
}
