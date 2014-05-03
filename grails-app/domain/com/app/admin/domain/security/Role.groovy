package com.app.admin.domain.security

/**
 * Role Domain Class
 *
 * @author Raúl Gomis
 */
class Role {

    static String ADMIN = "ROLE_ADMIN"
    static String USER = "ROLE_USER"

    String authority

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
    }
}
