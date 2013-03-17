package com.app.domain

import com.app.domain.security.User

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.codehaus.groovy.grails.scaffolding.*

class HomeController {
    def grailsApplication
	
	static user = true

    def mailService


    def index() {

    }

    def testGenerateTemplate(){
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


        render """
            <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
            <pre class="prettyprint">${data}</pre>
        """
    }

}
