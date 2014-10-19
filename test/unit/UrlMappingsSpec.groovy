import com.app.admin.domain.*
import com.app.admin.domain.repository.*
import com.app.admin.domain.sandbox.*
import com.app.admin.domain.security.*
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * Created by raulgomis on 19/10/2014.
 */
@TestFor(UrlMappings)
@Mock([UserController, DocumentController, ExampleController, ConfigurationController,
        SandboxController, ProfileController, SearchController, HelpController])
class UrlMappingsSpec extends Specification {

    void "test forward mappings"() {
        expect:
        assertForwardUrlMapping("/admin/users", controller: 'user', action: "index")
        assertForwardUrlMapping("/admin/documents", controller: 'document', action: "index")
        assertForwardUrlMapping("/admin/configuration", controller: 'configuration', action: "index")
        assertForwardUrlMapping("/admin/sandbox", controller: 'sandbox', action: "index")

        assertForwardUrlMapping("/profile", controller: 'profile', action: "index")
        assertForwardUrlMapping("/search", controller: 'search', action: "index")
        assertForwardUrlMapping("/help", controller: 'help', action: "index")
    }
}
