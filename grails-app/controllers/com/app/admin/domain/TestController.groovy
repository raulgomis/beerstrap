package com.app.admin.domain

import grails.transaction.Transactional

/**
 * Test Controller
 *
 * @author Raúl Gomis
 */
@Transactional(readOnly = true)
class TestController extends AbstractController {
    static scaffold = Test
    static admin = true
}
