// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

grails.config.locations = [ConfigGrailsbs]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [
        all:           '*/*',
        atom:          'application/atom+xml',
        css:           'text/css',
        csv:           'text/csv',
        form:          'application/x-www-form-urlencoded',
        html:          ['text/html','application/xhtml+xml'],
        js:            'text/javascript',
        json:          ['application/json', 'text/json'],
        multipartForm: 'multipart/form-data',
        rss:           'application/rss+xml',
        text:          'text/plain',
        hal:           ['application/hal+json','application/hal+xml'],
        xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
}

grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    appenders {
        console name:'stdout', layout: pattern(conversionPattern: '%d{yyyy-MM-dd HH:mm:ss} %-5p [%c{2}] %m%n')
        //rollingFile name: "myAppender",maxFileSize: 1024,file: "/tmp/logs/myApp.log"
        //file name: "stacktrace", append: true, file: "/var/tmp/logs/${appName}_stacktrace.log"
        //'null' name: "stacktrace"
    }

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'

    // log sql : http://burtbeckwith.com/blog/?p=1604
    //debug 'org.hibernate.SQL'
    //trace 'org.hibernate.type'
}



//************************************************************************************************************************
// CONFIGURATION ADDED BY Beerstrap
//************************************************************************************************************************

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.app.admin.domain.security.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.app.admin.domain.security.UserRole'
grails.plugin.springsecurity.authority.className = 'com.app.admin.domain.security.Role'
grails.plugin.springsecurity.requestMap.className = 'com.app.admin.domain.security.Requestmap'
//grails.plugin.springsecurity.securityConfigType = 'Requestmap'

grails.plugin.springsecurity.active = true
grails.plugin.springsecurity.securityConfigType = grails.plugin.springsecurity.SecurityConfigType.InterceptUrlMap
grails.plugin.springsecurity.rejectIfNoRule = true
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/public'

grails.plugin.springsecurity.interceptUrlMap = [
        '/admin/**':    ['ROLE_ADMIN'],
        '/home/**':     ['IS_AUTHENTICATED_FULLY'],
        '/js/**':        ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/css/**':       ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/images/**':    ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/register/**':     ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/login/**':     ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/logout/**':    ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/favicon.ico':    ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/public/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/**':            ['IS_AUTHENTICATED_ANONYMOUSLY']
]

//grails.plugin.springsecurity.dao.reflectionSaltSourceProperty = 'username'
//grails.plugin.springsecurity.password.encodeHashAsBase64 = true

grails.dbconsole.enabled = true
grails.dbconsole.urlRoot = '/dbconsole'

grails.resources.debug = true


// configuración de autodeploy de Tomcat 7
tomcat.deploy.username="usuario"
tomcat.deploy.password="*****"
tomcat.deploy.url="http://localhost:8080/manager/text"

// documentación de Grails
grails.doc.authors = "Raúl Gomis Hidalgo"
grails.doc.license = "License"
grails.doc.copyright = "Copyright message"
grails.doc.footer = "Footer"
grails.doc.title = "User documentation"


// configuración del nombre del war generado
grails.project.war.file = "myapp.war"

// Mail config
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


//************************************************************
//TWITTER BOOSTRAP
//************************************************************
grails.plugins.twitterbootstrap.fixtaglib = true

//************************************************************
//FILE UPLOADER
//************************************************************
docs {
    maxSize = "10000000" //10 mbytes
    //allowedExtensions = ["doc", "docx", "pdf", "rtf"]
    allowedExtensions = "*"
    path = new File(System.getProperty('user.home'), appName).canonicalPath
    //pathPics = new File(System.getProperty('user.home'), appName).canonicalPath + File.separator + "pics"
}