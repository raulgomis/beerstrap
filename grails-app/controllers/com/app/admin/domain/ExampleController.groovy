package com.app.admin.domain

import grails.transaction.Transactional

/**
 * Test Controller
 *
 * @author Raúl Gomis
 */
@Transactional(readOnly = true)
class ExampleController extends AbstractController {
    static scaffold = Example
    static admin = true
}
