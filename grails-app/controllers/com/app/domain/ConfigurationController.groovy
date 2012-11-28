package com.app.domain

import org.springframework.dao.DataIntegrityViolationException

import com.app.domain.configuration.Configuration;


class ConfigurationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static admin = true
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {

        def listConfig = Configuration.list()
        def listSite = []
        def listServer = []
		def listHelp = []
		
		/*println grailsApplication.config.grails.mail.default.from
		grailsApplication.config.grails.mail.default.from = "nrr@hotmail.com"
		println grailsApplication.config.grails.mail.default.from*/
		
        for(Configuration config in listConfig){
            def name = config.name
            if(name.startsWith('BT_SITE_') || name.startsWith('BT_HELP_')){
                listSite.add(config)
            }
            else if(name.startsWith('BT_SERVER_')){
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

        listConfig.each { configurationInstance ->

            def name = configurationInstance.name
            def value = configurationInstance.value

            if(configurationInstance.value != params[configurationInstance.name]){
                configurationInstance.value = params[configurationInstance.name]
                configurationInstance.save()
            }
        }

        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'configuration.label', default: 'Configuration')])}"
        redirect(action: "list")

    }
}