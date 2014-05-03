package com.app.admin.domain

import com.app.admin.domain.security.User

/**
 * Abstract controller designed to encapsulate all common functionality
 *
 * @author Raúl Gomis
 */
abstract class AbstractController {
    def grailsApplication
    def springSecurityService
    protected User getCurrentUser() {springSecurityService.currentUser}
}
