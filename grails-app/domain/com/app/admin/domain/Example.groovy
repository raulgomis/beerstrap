package com.app.admin.domain

import groovy.transform.ToString

/**
 * Example Domain Class
 *
 * @author Raúl Gomis
 */
@ToString(includeFields = true, includeNames = true)
class Example {
    String name
    String surname
    Date dateOfBirth

    static constraints = {
        name(blank: false)
        surname()
        dateOfBirth()
    }
}
