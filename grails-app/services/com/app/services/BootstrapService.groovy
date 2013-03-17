package com.app.services

import com.app.domain.*
import com.app.domain.security.*
import com.app.domain.configuration.*

class BootstrapService {

    static transactional = false

    def grailsApplication
    def configurationService

    def loadRequestMap() {

        def requestMap = []

        requestMap = [
                '/js/**':'IS_AUTHENTICATED_ANONYMOUSLY',
                '/css/**':'IS_AUTHENTICATED_ANONYMOUSLY',
                '/images/**':'IS_AUTHENTICATED_ANONYMOUSLY',
                '/login/**':'IS_AUTHENTICATED_ANONYMOUSLY',
                '/logout/**':'IS_AUTHENTICATED_ANONYMOUSLY',
                '/error/**':'IS_AUTHENTICATED_ANONYMOUSLY',

                '/*':'IS_AUTHENTICATED_FULLY',

                '/search/**':'ROLE_ADMIN',

                '/admin/notificacion/**':'ROLE_ADMIN',
                '/admin/seguridad/**':'ROLE_ADMIN',
                '/admin/general/**':'ROLE_ADMIN'
        ]

        requestMap.each {
            if(!Requestmap.findByUrl(it.key)) new Requestmap(url:it.key,configAttribute:it.value).save()
        }

        log.info("RequestMap loaded")

    }

    def loadPermissions() {
        /*
        def permisoMap = []

        permisoMap = [

            '/search/**':'PERM_BUSQUEDA_AVANZADA',

            '/admin/notificacion/**':'PERM_MOD_NOTIFICACION',
            '/admin/seguridad/**':'PERM_MOD_SEGURIDAD',
            '/admin/general/**':'PERM_MOD_GENERAL'
        ]

        log.info("Cargando permisos...")

        permisoMap.each {
            if(!Permiso.findByUrl(it.key)) new Permiso(url:it.key,nombre:it.value).save()
        }*/

    }

    def loadInitialUsers(){

        //Load roles
        def userRole = Role.findByAuthority(Role.USER) ?: new Role(authority: Role.USER).save(failOnError: true)
        def adminRole = Role.findByAuthority(Role.ADMIN) ?: new Role(authority: Role.ADMIN).save(failOnError: true)

        //Load users
        if(!User.findByUsername('admin')){
            def admin = new User( username:"admin",
                    password:"admin",
                    name:"Admin",
                    email:"raulgomis@gmail.com",
                    enabled:true,
                    accountExpired:false,
                    accountLocked:false,
                    passwordExpired:false).save()
            UserRole.create admin, adminRole
        }

        log.info("Initial users loaded")
    }


    def loadInitialData(){

        def configMap = []

        configMap = [

                /*"BT_SERVER_FROM":"sistemas@eltallerdigital.com",
                "BT_SERVER_PORT":"25",
                "BT_SERVER_USERNAME":"sistemas@eltallerdigital.com",
                "BT_SERVER_PASSWORD":"password",*/
                "grailsbs.BT_SITE_NAME":"Grails Bootstrap",
                "grailsbs.BT_SITE_OFFLINE":"False",
                "grailsbs.BT_SITE_MAXLISTHOME":"5",
                "grailsbs.BT_SITE_MAXLIST":"30",
                "grailsbs.BT_HELP_FAQ":"FAQ text goes here",

                /*"grails.mail.default.from":"grailsbs@gmail.com",
                "grails.mail.host":"smtp.gmail.com",
                "grails.mail.port":"465",
                "grails.mail.username":"grailsbs@gmail.com",
                "grails.mail.password":"bsgrails",
                 */
                /*"grails.mail.props.mail.smtp.auth":"true",
                "grails.mail.props.mail.smtp.socketFactory.port":"465",
                "grails.mail.props.mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
                "grails.mail.props.mail.smtp.socketFactory.fallback":"false"*/

        ]

        log.info("Loading global configuration...")

        configMap.each {
            if(!Configuration.findByKey(it.key)) new Configuration(key:it.key,value:it.value).save()
        }
        assert Configuration.list().size() == configMap.size()

        //set grails const
        /*List configurationInstanceList = Configuration.findAllByKeyLike("grails.%")
        for(Configuration c in configurationInstanceList){
            configurationService.setConfigValue("${c.key}",c.value)
        }*/

        log.info("Initial data loaded")
    }

    def loadExampleData() {

		def userRole = Role.findByAuthority(Role.USER) ?: new Role(authority: Role.USER).save(failOnError: true)
		def adminRole = Role.findByAuthority(Role.ADMIN) ?: new Role(authority: Role.ADMIN).save(failOnError: true)

		if(!User.findByUsername('user')){
		def user = new User( username:"user",
										password:"user",
										name:"User 1",
										email:"raulgomis@hotmail.com",
										enabled:true,
                                        preferences: new UserPreferences(),
										accountExpired:false,
										accountLocked:false,
										passwordExpired:false).save(failOnError: true)
			UserRole.create user, userRole
		}
		
		assert User.findByUsername('user')!=null

        log.info("Example data loaded")
    }
	
}
