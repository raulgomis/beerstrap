package com.app.taglib

import com.app.domain.configuration.Configuration
import com.app.domain.security.User;

class ConfigurationTagLib {
	static namespace = 'bs'
	
	def springSecurityService
	private User getCurrentUser() {springSecurityService.currentUser}
	
	def config = { attrs, body ->
		
		String name = attrs.name
		
		if(name){
			Configuration c = Configuration.findByName(name)
			if(c){
				out << c?.value
			}
		}
	}
}
