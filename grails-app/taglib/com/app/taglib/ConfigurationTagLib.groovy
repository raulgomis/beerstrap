package com.app.taglib

import com.app.domain.configuration.Configuration
import com.app.domain.security.User;

class ConfigurationTagLib {
	static namespace = 'bs'
	
	def springSecurityService
	private User getCurrentUser() {springSecurityService.currentUser}
	
	def config = { attrs, body ->
		
		String key = attrs.key
		
		if(key){
			Configuration c = Configuration.findByKey(key)
			if(c){
				out << c?.value
			}
		}
	}
}
