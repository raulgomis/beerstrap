package com.app.admin.domain

import com.app.admin.domain.security.User
import spock.lang.Specification

class BaseSpecification extends Specification {

    Example validExample() {
        new Example(
            name: 'Raúl', surname: 'Gomis', dateOfBirth: new Date()
        )
    }

    User validUser() {
        new User(
                name: 'test', username: 'test', email: 'test@test.com', password: 'test'
        )
    }

}