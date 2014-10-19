package com.app

import com.app.pages.LoginPage
import geb.spock.GebReportingSpec

abstract class AbstractSpecs extends GebReportingSpec {

    protected void login(String user, String pwd, boolean remember = false) {
        to LoginPage
        username = user
        password = pwd
        if (remember) {
            rememberMe.click()
        }
        loginButton.click()
    }

    protected void logout() {
//        to LogoutPage
//        logoutButton.click()
        browser.clearCookies()
    }
}
