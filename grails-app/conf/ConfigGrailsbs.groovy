
// CONFIGURATION ADDED BY GRAILS BOOTSTRAP

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
        '/admin/**':	['ROLE_ADMIN'],
        '/home/**':	['IS_AUTHENTICATED_FULLY'],
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

// Configuracion del plugin de email
/*grails.mail.default.from="usuario@eltallerdigital.com"

grails{
    mail{
        host = "eltallerdigital.com"
        port = 25
        username = "usuario@eltallerdigital.com"
        password = "*****"
    }
}*/
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


/*props = ["mail.smtp.auth":"true",
 "mail.smtp.socketFactory.port":"465",
 "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
 "mail.smtp.socketFactory.fallback":"false"]*/

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
