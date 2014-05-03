package com.app.admin.domain.security

/**
 * RequestMap Domain Class
 *
 * @author Raúl Gomis
 */
class Requestmap {

    String url
    String configAttribute

    static mapping = {
        cache true
    }

    static constraints = {
        url blank: false, unique: true
        configAttribute blank: false
    }
}
