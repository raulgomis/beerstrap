package com.app.admin.domain

import com.app.admin.domain.security.User

abstract class AbstractController {
    def grailsApplication
    def springSecurityService
    private User getCurrentUser() {springSecurityService.currentUser}
}
