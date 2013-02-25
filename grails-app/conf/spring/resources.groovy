// Place your Spring DSL code here
import com.app.security.*

beans = {
	userDetailsService(CustomUserDetailsService)
    ApplicationSupport(com.app.utils.ApplicationSupport) {
        grailsApplication = ref('grailsApplication')
    }
}
