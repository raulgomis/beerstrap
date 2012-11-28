package com.app.domain.security

import com.app.domain.configuration.UserPreferences

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
	
	Date dateCreated
	Date lastUpdated
	
	UserPreferences preferences

	static constraints = {
		username(blank: false, unique: true)
		name(nullable: true)
		email(blank: false, email: true)
		dateCreated()
		enabled()
		accountExpired()
		accountLocked()
		passwordExpired()
		password(blank: false, password:true)
		preferences(nullable:true)
	}

	static mapping = {
		//cache true
		password column: '`password`'
		preferences lazy: true
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
