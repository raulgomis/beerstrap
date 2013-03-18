package com.app.domain

import com.app.domain.configuration.Configuration
import org.codehaus.groovy.grails.scaffolding.DefaultGrailsTemplateGenerator;

class ConfigurationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    //static admin = true

    def configurationService
    def grailsApplication

    def index() {
        redirect(action: "site", params: params)
    }

    def list() {

        def listConfig = Configuration.list()
        def listSite = []
        def listServer = []
        def listHelp = []

        //println grailsApplication.config.grails.mail.port

        /*
        grailsApplication.config.grails.mail.default.from = "nrr@hotmail.com"
        println grailsApplication.config.grails.mail.default.from
        */

        for (Configuration config in listConfig) {
            def key = config.key
            if (key.startsWith('grailsbs.BT_SITE_') || key.startsWith('grailsbs.BT_HELP_')) {
                listSite.add(config)
            } else if (key.startsWith('grailsbs.BT_SERVER_') || key.startsWith('grails.mail.')) {
                listServer.add(config)
            } else {
                log.error("Algun parametro de configuración sin tipo")
            }
        }

        [listServer: listServer, listSite: listSite]

    }

    def site() {

    }

    def server() {


        def configurationEmailInstanceList = []

        def configurationDocsInstanceList = []

        def configurationDBInstanceList = []

        Map configEmail = [
                "grails.mail.default.from":"${grailsApplication.config.grails.mail.default.from}",
                "grails.mail.host":"${grailsApplication.config.grails.mail.host}",
                "grails.mail.port":"${grailsApplication.config.grails.mail.port}",
                "grails.mail.username":"${grailsApplication.config.grails.mail.username}",
                "grails.mail.password":"${grailsApplication.config.grails.mail.password}",
                "grails.mail.props":"${grailsApplication.config.grails.mail.props}"
        ]

        Map configDocs = [
                "docs.maxSize":"${grailsApplication.config.docs.maxSize}",
                "docs.allowedExtensions":"${grailsApplication.config.docs.allowedExtensions}",
                "docs.path":"${grailsApplication.config.docs.path}",
        ]

        Map configDB = [
            "grails.dbconsole.enabled":"${grailsApplication.config.grails.dbconsole.enabled}",
            "grails.dbconsole.urlRoot":"${grailsApplication.config.grails.dbconsole.urlRoot}",
            "dataSource.url":"${grailsApplication.config.dataSource.url}",
            "dataSource.driverClassName":"${grailsApplication.config.dataSource.driverClassName}",
            "dataSource.username":"${grailsApplication.config.dataSource.username}",
            "dataSource.password":"${grailsApplication.config.dataSource.password}",
            "dataSource.pooled":"${grailsApplication.config.dataSource.pooled}",
            "dataSource.dbCreate":"${grailsApplication.config.dataSource.dbCreate}"
        ]


        configEmail.each{ key,value ->
            configurationEmailInstanceList << new Configuration(key:key,value:value)
        }

        configDocs.each{ key,value ->
            configurationDocsInstanceList << new Configuration(key:key,value:value)
        }

        configDB.each{ key,value ->
            configurationDBInstanceList << new Configuration(key:key,value:value)
        }

        /*
        grails.mail.default.from="grailsbs@gmail.com"
        grails {
            mail {
                host = "smtp.gmail.com"
                port = 465
                username = "grailsbs@gmail.com"
                password = "bsgrails"
                props = ["mail.smtp.auth":"true",
                        "mail.smtp.socketFactory.port":"465",
                        "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
                        "mail.smtp.socketFactory.fallback":"false"]
            }
        }
           */

        [configurationEmailInstanceList:configurationEmailInstanceList,
                configurationDocsInstanceList:configurationDocsInstanceList,
                configurationDBInstanceList:configurationDBInstanceList]
    }

    def system() {

    }

    def notifications() {

    }

    def grails() {

    }

    def grailsGenerate(String domainClassName,String artifact){
        DefaultGrailsTemplateGenerator templateGenerator = new DefaultGrailsTemplateGenerator();
        templateGenerator.grailsApplication = grailsApplication
        Writer out = new StringWriter()
        if (domainClassName){

            def domainClass = grailsApplication.getDomainClass(domainClassName)
            switch (artifact){
                case "controller":
                    templateGenerator.generateController(domainClass,out)
                    break;
                case "view-create":
                    templateGenerator.generateView(domainClass, "create", out)
                    break;
                case "view-edit":
                    templateGenerator.generateView(domainClass, "edit", out)
                    break;
                case "view-list":
                    templateGenerator.generateView(domainClass, "list", out)
                    break;
                case "view-show":
                    templateGenerator.generateView(domainClass, "show", out)
                    break;
                case "view-form":
                    templateGenerator.generateView(domainClass, "_form", out)
                    break;
                case "view-sidebar":
                    templateGenerator.generateView(domainClass, "_sidebar", out)
                    break;
            }

        }

        String data = out.toString()

        render """
            <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
            <pre class="prettyprint">${data.encodeAsHTML()}</pre>
        """
    }

    def update() {

        def listConfig = Configuration.list()

        def mailConfig = grailsApplication.config.grails.mail

        listConfig.each { configurationInstance ->

            def name = configurationInstance.key
            def value = configurationInstance.value

            if (configurationInstance.value != params[name]) {
                configurationInstance.value = params[name]
                configurationInstance.save()
                if (name.startsWith("grails.mail.")) {
                    configurationService.setConfigValue("${name}", configurationInstance.value)
                }
            }
        }

        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'configuration.label', default: 'Configuration')])}"
        redirect(action: "list")

    }
}