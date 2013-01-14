package com.app.domain.security


import groovy.text.SimpleTemplateEngine

import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

import com.app.services.EmailService;


class RegisterController {

	def mailService
	def emailService
	def springSecurityService
	
	def index() {
		[command: new RegisterCommand()]
	}
	
	
	def register = { RegisterCommand command ->

		if(command.hasErrors()) {
			log.error(command.errors)
			render view: 'index', model: [command: command]
			return
		}

		def user = new User(name:command.name, username: command.username, email: command.email,
				password: command.password, accountLocked: true, enabled: true)
		if (!user.validate() || !user.save()) {
			// TODO
			log.error("Error to save user")
		}

		def registrationCode = new RegisterCode(username: user.username).save()
		String url = g.createLink(action:'verifyRegistration',absolute:true,params:[t:registrationCode?.token])
		Map opt = ['urlToken':url,'email':command.email]
		emailService.register(opt)
		
		flash.message = "Email has been sent. Check your email in order to complete the process"
		redirect(controller:"home")
	}
	
	def verifyRegistration(String t) {

		def conf = SpringSecurityUtils.securityConfig
		String defaultTargetUrl = conf.successHandler.defaultTargetUrl

		String token = t

		def registrationCode = token ? RegisterCode.findByToken(token) : null
		if (!registrationCode) {
			flash.error = message(code: 'spring.security.ui.register.badCode')
			redirect uri: defaultTargetUrl
			return
		}

		def user
		RegisterCode.withTransaction { status ->
			user = User.findByUsername(registrationCode.username)
			if (!user) {
				return
			}
			user.accountLocked = false
			user.save()
			
			def listRoles = [Role.USER]
			for (roleName in listRoles) {
				UserRole.create user, Role.findByAuthority(roleName)
			}
			registrationCode.delete()
		}

		if (!user) {
			flash.error = message(code: 'spring.security.ui.register.badCode')
			redirect uri: defaultTargetUrl
			return
		}

		springSecurityService.reauthenticate user.username

		flash.message = message(code: 'spring.security.ui.register.complete')
		redirect uri: conf.ui.register.postRegisterUrl ?: defaultTargetUrl
	}

	def forgotPassword(String email) {

		if (!request.post) {
			// show the form
			return
		}

		if (!email) {
			flash.error = message(code: 'spring.security.ui.forgotPassword.username.missing')
			return
		}

		def user = User.findByEmail(email)
		if (!user) {
			flash.error = message(code: 'spring.security.ui.forgotPassword.user.notFound')
			return
		}

		def registrationCode = new RegisterCode(username: user.username).save()
		String url = g.createLink(action:'resetPassword',absolute:true,params:[t:registrationCode?.token])
		Map opt = ['urlToken':url,'email':user.email]
		emailService.forgotPassword(opt)
				
		flash.message = "Email has been sent. Check your email in order to complete the process"
		
		[emailSent: true]
	}

	def resetPassword(ResetPasswordCommand command, String t){

		String token = t

		def registrationCode = token ? RegisterCode.findByToken(token) : null
		if (!registrationCode) {
			flash.error = message(code: 'spring.security.ui.resetPassword.badCode')
			redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
			return
		}

		if (!request.post) {
			return [token: token, command: new ResetPasswordCommand()]
		}

		command.username = registrationCode.username
		command.validate()

		if (command.hasErrors()) {
			return [token: token, command: command]
		}

		RegisterCode.withTransaction { status ->
			def user = User.findByUsername(registrationCode.username)
			user.password = command.password
			user.save()
			registrationCode.delete()
		}

		springSecurityService.reauthenticate registrationCode.username

		flash.message = message(code: 'spring.security.ui.resetPassword.success')

		def conf = SpringSecurityUtils.securityConfig
		String postResetUrl = conf.ui.register.postResetUrl ?: conf.successHandler.defaultTargetUrl
		redirect uri: postResetUrl
	}

	protected String generateLink(String action, linkParams) {
		createLink(base: "$request.scheme://$request.serverName:$request.serverPort$request.contextPath",
				controller: 'register', action: action,
				params: linkParams)

	}

	protected String evaluate(s, binding) {
		new SimpleTemplateEngine().createTemplate(s).make(binding)
	}

	static final passwordValidator = { String password, command ->
		if (command.username && command.username.equals(password)) {
			return 'command.password.error.username'
		}
		/*
		if (password && password.length() >= 8 && password.length() <= 64 &&
				(!password.matches('^.*\\p{Alpha}.*$') ||
				!password.matches('^.*\\p{Digit}.*$') ||
				!password.matches('^.*[!@#$%^&].*$'))) {
			return 'command.password.error.strength'
		}*/
	}

	static final password2Validator = { value, command ->
		if (command.password != command.password2) {
			return 'command.password2.error.mismatch'
		}
	}
}


class RegisterCommand {

	String name
	String username
	String email
	String password
	//String password2
	Boolean terms

	static constraints = {
		name nullable:false
		username blank: false, validator: { value, command ->
			if (value) {
				if (User.findByUsername(value)) {
					return 'registerCommand.username.unique'
				}
			}
		}
		email blank: false, email: true
		password blank: false, minSize: 8, maxSize: 64, validator: RegisterController.passwordValidator
		//password2 validator: RegisterController.password2Validator
		terms validator: { value, command ->
			if(!value) {
				return 'registerCommand.terms.accepted'
			}
		}
	}
}

class ResetPasswordCommand {
	String username
	String password
	String password2

	static constraints = {
		password blank: false, minSize: 8, maxSize: 64, validator: RegisterController.passwordValidator
		password2 validator: RegisterController.password2Validator
	}
}

