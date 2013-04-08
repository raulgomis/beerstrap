package com.app.domain.security

import java.util.Date;

class RegisterCode {

    String username
    String token = UUID.randomUUID().toString().replaceAll('-', '')
    Date dateCreated

    static constraints = {
    }

    static mapping = {
        version false
    }

}