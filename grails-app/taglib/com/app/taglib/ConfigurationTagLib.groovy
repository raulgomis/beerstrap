package com.app.taglib

import com.app.domain.configuration.Configuration
import com.app.domain.security.User;

class ConfigurationTagLib {
	static namespace = 'bs'

    def configurationService
	
	def config = { attrs, body ->
		String key = attrs.key
		if(key){
			String value = configurationService.getStringValue(key)
			if(value != null){
				out << value
			}
		}
	}
}
