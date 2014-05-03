package com.app.admin.domain.configuration

/**
 * Configuration Domain Class
 *
 * @author Raúl Gomis
 */
class Configuration {

    String key
    String value
    String clazz

    static constraints = {
        key(nullable:false, blank:false, unique:true)
        value(nullable:false)
        clazz(nullable:true)
    }

    static mapping = {
        cache true
        version false
    }

    String toString(){
        key+":"+value
    }
}

