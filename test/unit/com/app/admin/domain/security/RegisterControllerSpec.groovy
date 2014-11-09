package com.app.admin.domain.security

import com.app.admin.domain.BaseSpecification
import com.app.services.EmailService

import static org.junit.Assert.*

import grails.test.mixin.*

@TestFor(RegisterController)
@Mock([User, RegisterCode])
class RegisterControllerSpec extends BaseSpecification {

    RegisterCommand command

    void setup() {
        def myService = new EmailService()
        myService.metaClass.register = { String email, String token ->
            println "Mocked service"
        }
        controller.emailService = myService
        mockDomain(User, [validUser()])
        User.metaClass.encodePassword = {-> }
        command = mockCommandObject(RegisterCommand) as RegisterCommand
        command.name = "user1234"
        command.username = "username1234"
        command.password = "password1234"
        command.terms = true
        command.email = "email1234@email.com"
        assertTrue command.validate()
    }

    void "valid post requests to register action should be redirecting to home"() {
        when: "The register action is executed"
        request.method = 'POST'
        controller.register(command)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/'
        controller.flash.message != null
        controller.flash.message == "app.security.register.sent"
    }
}
