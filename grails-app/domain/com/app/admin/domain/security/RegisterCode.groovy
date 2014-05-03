package com.app.admin.domain.security

/**
 * RegisterCode Domain Class
 *
 * @author Raúl Gomis
 */
class RegisterCode {

    String username
    String token = UUID.randomUUID().toString().replaceAll('-', '')
    Date dateCreated

    static constraints = {
    }

    static mapping = {
        version false
    }

}