package com.app.services

import com.app.domain.*
import com.app.domain.security.*
import com.app.domain.configuration.*

class BootstrapService {


	//Cargar requestMap inicial
	def cargarRequestMapInicial() {

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
		
        log.info("Cargando requestMap...")

        requestMap.each {
            if(!Requestmap.findByUrl(it.key)) new Requestmap(url:it.key,configAttribute:it.value).save()
        }
	}
	
	//Cargar permisos
    def cargarPermisos() {
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

	//Cargar roles y usuarios
    def cargarRolesyUsuarios(){
		
        //Creamos roles
        def userRole = Role.findByAuthority(Role.USER) ?: new Role(authority: Role.USER).save(failOnError: true)
        def adminRole = Role.findByAuthority(Role.ADMIN) ?: new Role(authority: Role.ADMIN).save(failOnError: true)

        //creamos usuarios
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
    }

	//Cargar otros datos iniciales necesarios para el correcto funcionamiento de la aplicación
    def loadInitialData(){
		
		def configMap = []
		
		configMap = [
			"BT_SERVER_ACTIVO":"true",
			"BT_SERVER_FROM":"sistemas@eltallerdigital.com",
        	"BT_SERVER_PORT":"25",
        	"BT_SERVER_USERNAME":"sistemas@eltallerdigital.com",
        	"BT_SERVER_PASSWORD":"password",
			
			"BT_SITE_NAME":"Grails bootstrap",
			"BT_SITE_OFFLINE":"False",
			"BT_SITE_MAXLISTHOME":"5",
			"BT_SITE_MAXLIST":"30",
			"BT_HELP_FAQ":"FAQ text goes here"
		]

        log.info("Loading global configuration...")

        configMap.each {
            if(!Configuration.findByName(it.key)) new Configuration(name:it.key,value:it.value).save()
        }
		assert Configuration.list().size() == configMap.size()
		
    }

	//Cargar datos de ejemplo (normalmente para modo de desarrollo)
    def cargarDatosEjemplo() {
		//Creamos roles
		def userRole = Role.findByAuthority(Role.USER) ?: new Role(authority: Role.USER).save(failOnError: true)
		def adminRole = Role.findByAuthority(Role.ADMIN) ?: new Role(authority: Role.ADMIN).save(failOnError: true)

		//creamos usuarios
		if(!User.findByUsername('user')){
		def user = new User( username:"user",
										password:"user",
										name:"User 1",
										email:"raulgomis@gmail.com",
										enabled:true,
										accountExpired:false,
										accountLocked:false,
										passwordExpired:false).save()
			UserRole.create user, userRole
		}
    }
	
}
