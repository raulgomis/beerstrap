package com.app.admin.domain

import spock.lang.Specification

class BaseSpecification extends Specification {

    Example validExample() {
        new Example(
                name: 'Raúl', surname: 'Gomis', dateOfBirth: new Date()
        )
    }

}