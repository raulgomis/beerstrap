package com.app.admin.domain

import com.app.admin.domain.security.User

class TestController extends AbstractController {

    static scaffold = User
    static admin = true

}
