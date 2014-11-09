package com.app.admin.domain.security

import groovy.text.SimpleTemplateEngine
import grails.plugin.springsecurity.SpringSecurityUtils

/**
 * Register Controller
 *
 * @author Raúl Gomis
 */
class RegisterController {

    def emailService
    def springSecurityService

    /**
     * Index action. Shows the register page
     */
    def index() {
        [command: new RegisterCommand()]
    }

    /**
     * Process user registration
     *
     * @param command A RegisterCommand command object
     */
    def register(RegisterCommand command) {
        try {
            User.withTransaction {
                if(!command.validate()) {
                    log.error(command.errors)
                    render(view: 'index', model: [command: command])
                    return
                }

                def user = new User(name:command.name, username: command.username, email: command.email,
                        password: command.password, accountLocked: true, enabled: true)
                if (!user.validate() || !user.save()) {
                    throw new RuntimeException("Error to save user: " + user.errors.allErrors)
                }

                //create registration code
                def registrationCode = new RegisterCode(username: user.username).save()

                //sent an email
                emailService.register(command.email,registrationCode?.token)

                flash.message = message(code: 'app.security.register.sent')
                redirect(controller:"home")
            }
        } catch(Exception) {
            flash.error = message(code: 'app.security.register.failed')
            redirect(action:"index")
        }
    }

    /**
     * Verify registration process using a token
     *
     * @return t Token to verify
     */
    def verifyRegistration(String t) {

        def conf = SpringSecurityUtils.securityConfig
        String defaultTargetUrl = conf.successHandler.defaultTargetUrl

        String token = t

        //check registrationCode
        def registrationCode = token ? RegisterCode.findByToken(token) : null
        if (!registrationCode) {
            flash.error = message(code: 'app.security.register.badCode')
            redirect uri: defaultTargetUrl
            return
        }

        //get user from token and assign Role.USER
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
            flash.error = message(code: 'app.security.register.badCode')
            redirect(uri: defaultTargetUrl)
            return
        }

        //authenticate user into the app
        springSecurityService.reauthenticate(user.username)

        flash.message = message(code: 'app.security.register.complete')
        redirect(uri: conf.ui.register.postRegisterUrl ?: defaultTargetUrl)
    }

    /**
     * Forgot password action
     *
     * @return email Email used to recover the user password
     */
    def forgotPassword(String email) {

        if (!request.post) {
            // show the form
            return
        }

        if (!email) {
            flash.error = message(code: 'app.security.forgotPassword.username.missing')
            return
        }

        //get user from email
        def user = User.findByEmail(email)
        if (!user) {
            flash.error = message(code: 'app.security.forgotPassword.user.notFound')
            return
        }

        //create registration code
        def registrationCode = new RegisterCode(username: user.username).save()

        //send email
        emailService.forgotPassword(user.email,registrationCode?.token)

        flash.message = message(code: 'app.security.register.complete')
        [emailSent: true]
    }

    /**
     * Reset password action
     *
     * @param command A ResetPasswordCommand command object
     * @param t Token given to the user to reset the password
     */
    def resetPassword(ResetPasswordCommand command, String t){

        String token = t

        //check registrationCode
        def registrationCode = token ? RegisterCode.findByToken(token) : null
        if (!registrationCode) {
            flash.error = message(code: 'app.security.resetPassword.badCode')
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

        //get user and change the password, after that delete registrationCode
        RegisterCode.withTransaction { status ->
            def user = User.findByUsername(registrationCode.username)
            user.password = command.password
            user.save()
            registrationCode.delete()
        }

        //authenticate user into the app
        springSecurityService.reauthenticate(registrationCode.username)


        flash.message = message(code: 'app.security.resetPassword.success')

        def conf = SpringSecurityUtils.securityConfig
        String postResetUrl = conf.ui.register.postResetUrl ?: conf.successHandler.defaultTargetUrl
        redirect(uri: postResetUrl)
    }

    /**
     * Generates a link given an action and link params
     *
     * @param action
     * @param linkParams
     * @return
     */
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

/**
 * Register Command
 *
 * @author Raúl Gomis
 */
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
        email blank: false, email: true, validator: { value, command ->
            if (value) {
                if (User.findByEmail(value)) {
                    return 'registerCommand.email.unique'
                }
            }
        }
        password blank: false, minSize: 8, maxSize: 64, validator: RegisterController.passwordValidator
        //password2 validator: RegisterController.password2Validator
        terms validator: { value, command ->
            if(!value) {
                return 'registerCommand.terms.accepted'
            }
        }
    }
}

/**
 * Reset Password Command
 *
 * @author Raúl Gomis
 */
class ResetPasswordCommand {
    String username
    String password
    String password2

    static constraints = {
        password blank: false, minSize: 8, maxSize: 64, validator: RegisterController.passwordValidator
        password2 validator: RegisterController.password2Validator
    }
}

