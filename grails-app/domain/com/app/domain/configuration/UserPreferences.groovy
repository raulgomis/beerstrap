package com.app.domain.configuration

import com.app.domain.security.User

class UserPreferences {

    String language = "en"
	String timezone
	
	Boolean email_subscription = true
	Boolean email_directmessage = true
	Boolean email_alert = true

    static constraints = {
        language nullable: false
    }

    static belongsTo = [user: User]

    static mapping = {
        cache true
    }
}
