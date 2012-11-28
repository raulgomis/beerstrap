package com.app.taglib

import com.app.domain.security.User

class DomainTagLib {

	static namespace = 'bs'
	
	def springSecurityService
	private User getCurrentUser() {springSecurityService.currentUser}
	/*
	def numInbox = {
		User user =  getCurrentUser()
		def messageInstanceTotal = Message.countByToAndIsRead(user,false)
		
		out << messageInstanceTotal.toString()
	}
	*/
}
