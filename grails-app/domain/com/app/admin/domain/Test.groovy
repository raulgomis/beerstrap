package com.app.admin.domain

import groovy.transform.ToString

/**
 * Test Domain Class
 *
 * @author Raúl Gomis
 */
@ToString(includeFields = true, includeNames = true)
class Test {
    String name
    String surname
    Date dateOfBirth

    static constraints = {
        name()
        surname()
        dateOfBirth()
    }
}
