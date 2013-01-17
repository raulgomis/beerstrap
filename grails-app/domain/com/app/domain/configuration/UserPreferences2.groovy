package com.app.domain.configuration

import com.app.domain.security.User

class UserPreferences2 {

    String language = "en"
	String timezone
	
	Boolean email_subscription = true
	
	Boolean email_directmessage = true
	Boolean email_mention = true

	Boolean email_alert_type1 = true
	Boolean email_alert_type2 = true
	Boolean email_alert_type3 = true
	
    static constraints = {
        language nullable: false
    }
	
    static belongsTo = [user: User]

    static mapping = {
        cache true
    }
}
