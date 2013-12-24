package com.app.admin.domain

import groovy.transform.ToString

/**
 * grailsbs
 * @autor raulgomis
 * Date: 22/11/13 | Time: 20:03
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
