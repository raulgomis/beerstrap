package com.app.admin.domain

import grails.test.mixin.TestFor
import spock.lang.Unroll

@TestFor(Example)
class ExampleSpec extends BaseSpecification {

    Example example = validExample()

    def setup() {
        mockForConstraintsTests(Example)
    }

    def 'a valid Example has no errors'() {
        when:
        example.validate()

        then:
        !example.hasErrors()
    }

    @Unroll
    def 'firstName with value #value validation error is #error'() {
        given:
        example.name = value
        example.validate()

        expect:
        example.errors.name == error

        where:
        value  || error
        null   || 'nullable'
        ' '    || 'blank'
        'Raúl' || null
    }
}
