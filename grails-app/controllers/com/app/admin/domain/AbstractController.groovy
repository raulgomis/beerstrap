package com.app.admin.domain

import com.app.admin.domain.security.User

abstract class AbstractController {
    def grailsApplication
    def springSecurityService
    protected User getCurrentUser() {springSecurityService.currentUser}
}
