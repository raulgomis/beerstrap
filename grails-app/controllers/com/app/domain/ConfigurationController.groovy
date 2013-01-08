package com.app.domain

import org.springframework.dao.DataIntegrityViolationException

import com.app.domain.configuration.Configuration;


class ConfigurationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static admin = true
	
	def configurationService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {

        def listConfig = Configuration.list()
        def listSite = []
        def listServer = []
		def listHelp = []
		
		//println "HOLAAA"
		//println grailsApplication.config.grails.mail.port
		
		/*
		grailsApplication.config.grails.mail.default.from = "nrr@hotmail.com"
		println grailsApplication.config.grails.mail.default.from
		*/
		
        for(Configuration config in listConfig){
            def key = config.key
            if(key.startsWith('BT_SITE_') || key.startsWith('BT_HELP_')){
                listSite.add(config)
            }
            else if(key.startsWith('BT_SERVER_') || key.startsWith('grails.mail.')){
                listServer.add(config)
            }
			else{
				log.error("Algun parametro de configuración sin tipo")
			}
        }

        [listServer:listServer,listSite:listSite]

    }
	

    def update() {

        def listConfig = Configuration.list()
		
		def mailConfig = grailsApplication.config.grails.mail
		
        listConfig.each { configurationInstance ->

            def name = configurationInstance.key
            def value = configurationInstance.value

            if(configurationInstance.value != params[name]){
                configurationInstance.value = params[name]
                configurationInstance.save()
				if(name.startsWith("grails.mail.")){
					println name
					println value
					configurationService.setConfigValue("${name}", configurationInstance.value)
				}
            }
        }
		
		
		
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'configuration.label', default: 'Configuration')])}"
        redirect(action: "list")

    }
}