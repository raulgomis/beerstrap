package com.app.admin.domain.security

/**
 * User Domain Class
 *
 * @author Raúl Gomis
 */
class User {

    transient springSecurityService

    String username
    String name
    String email
    String password
    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false

    Date lastLogin
    Date dateCreated
    Date lastUpdated

    UserPreferences preferences = new UserPreferences()
    static embedded = ['preferences']

    static constraints = {
        username(blank: false, unique: true)
        name(nullable: false,blank: false)
        email(blank: false, email: true, unique:true)
        lastLogin(nullable:true)
        enabled()
        accountExpired()
        accountLocked()
        passwordExpired()
        password(blank: false, password:true)
        preferences(nullable:true)
        dateCreated()
        lastUpdated()
    }

    static mapping = {
        //cache true
        password column: '`password`'
        //preferences lazy: true
    }
    
    public void setUsername(String username) {
    	this.username = username.toLowerCase()
	}

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }

    String toString(){
        username
    }
}

/**
 * UserPreferences Domain Class
 *
 * @author Raúl Gomis
 */
class UserPreferences {

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

    String toString(){
        country
    }
}

