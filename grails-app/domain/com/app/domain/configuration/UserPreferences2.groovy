package com.app.domain.configuration

import com.app.domain.security.User

class UserPreferences2 {

    String country = "esp"; //Change it and write your country code :)
    String locale = Locale.getDefault();
    String timezone = TimeZone.getDefault().ID;
    String currency = Currency.getInstance(Locale.getDefault());

    Boolean email_subscription = true
    Boolean email_directmessage = true
    Boolean email_mention = true

    Boolean email_alert_type1 = true
    Boolean email_alert_type2 = true
    Boolean email_alert_type3 = true

    static constraints = {
        country nullable: false
    }
	
    static belongsTo = [user: User]

    static mapping = {
        cache true
    }

    String toString(){
        country
    }
}
