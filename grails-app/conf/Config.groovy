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
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
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
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
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
    // Example of changing the log pattern for the default console appender:
    //
    appenders {
        console name:'stdout', layout: pattern(conversionPattern: '%d{yyyy-MM-dd HH:mm:ss} %-5p [%c{2}] %m%n')
        //rollingFile name: "myAppender",maxFileSize: 1024,file: "/tmp/logs/myApp.log"
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
// CONFIGURATION ADDED BY GRAILS BOOTSTRAP
//************************************************************************************************************************

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.app.domain.security.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.app.domain.security.UserRole'
grails.plugins.springsecurity.authority.className = 'com.app.domain.security.Role'
grails.plugins.springsecurity.requestMap.className = 'com.app.domain.security.Requestmap'
//grails.plugins.springsecurity.securityConfigType = 'Requestmap'

grails.plugins.springsecurity.active = true
grails.plugins.springsecurity.securityConfigType = grails.plugins.springsecurity.SecurityConfigType.InterceptUrlMap
grails.plugins.springsecurity.rejectIfNoRule = true
grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/public'

grails.plugins.springsecurity.interceptUrlMap = [
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

//grails.plugins.springsecurity.dao.reflectionSaltSourceProperty = 'username'
//grails.plugins.springsecurity.password.encodeHashAsBase64 = true

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
