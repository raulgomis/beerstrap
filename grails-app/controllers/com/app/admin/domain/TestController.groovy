package com.app.admin.domain

import grails.transaction.Transactional

@Transactional(readOnly = true)
class TestController extends AbstractController {
    static scaffold = Test
    static admin = true
}
