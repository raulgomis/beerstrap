package com.app

import com.app.pages.HomePage
import com.app.pages.LoginPage

class HomeSpec extends AbstractSpecs {
    def setup() {
        to LoginPage
    }

    def "Login page exists"() {
        when:
        to LoginPage
        login("admin", "admin")

        then:
        assert at(HomePage)
    }

}
