package com.app.services

class ConfigurationService {
	def grailsApplication
	
	def void setConfigValue(String pathString, def newValue) {
		def config = grailsApplication.config /* hope you have injected grailsApplication bean */
		List paths = pathString.tokenize(".")
		String lastVar = paths.last()
		paths.remove(paths.size() - 1);

		paths.each {path ->
			config = config."${path}"
		}
		config."$lastVar" = newValue
	}
}
