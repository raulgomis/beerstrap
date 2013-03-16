package com.app.domain

import com.app.domain.security.User

import org.codehaus.groovy.grails.scaffolding.*

class HomeController {
    def grailsApplication
	
	static user = true

    def index() {

        DefaultGrailsTemplateGenerator templateGenerator = new DefaultGrailsTemplateGenerator();
        templateGenerator.grailsApplication = grailsApplication
        def domainClass = grailsApplication.getDomainClass("com.app.domain.security.User")

        Writer out = new StringWriter()
        templateGenerator.generateController(domainClass,out)

        Writer out2 = new StringWriter()
        templateGenerator.generateView(domainClass, "list", out2)

        String data = out.toString()

        println data
        println out2.toString()

        println grailsApplication.getArtefacts("Domain")*.clazz

        [data:data]

    }

}
