package com.app.admin.domain
import com.app.admin.domain.security.*

class ProfileController extends AbstractController {

    def index() { 
        redirect(action:"account")
    }

    def account() {
        def userInstance = getCurrentUser()
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def updateAccount() {
        def userInstance = getCurrentUser()
        String redirectTo = "account"

        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: redirectTo)
            return
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: redirectTo, model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: redirectTo)
    }

    def deactivate() {
        def userInstance = getCurrentUser()
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "account")
            return
        }

        userInstance.enabled = false

        if (!userInstance.save(flush: true)) {
            render(view: "account", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])

        redirect(controller: "logout")
    }

    def password() {
    }

    def updatePassword(String password, String passwordNew, String passwordRepeat) {

        String redirectTo = "password"

        if(!passwordNew.equals(passwordRepeat)){
            //TODO: I18n in profile
            flash.message = "Los password deben de coincidir"
            redirect(action: redirectTo)
            return
        }

        def userInstance = getCurrentUser()
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: redirectTo)
            return
        }

        String passwordCurrentSec = springSecurityService.encodePassword(password)
        if(!passwordCurrentSec.equals(userInstance.password)){
            flash.message = "Su password actual está mal introducido"
            redirect(action: redirectTo)
            return
        }

        userInstance.password = passwordNew

        if (!userInstance.save(flush: true)) {
            render(view: redirectTo, model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: redirectTo)
    }

    def preferences() {
        User userInstance = getCurrentUser()
        [userInstance: userInstance]
    }

    def updatePreferences() {
        User userInstance = getCurrentUser()
        String redirectTo = "preferences"
        if (!userInstance || !userInstance.preferences) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: redirectTo)
            return
        }

        userInstance.preferences.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: redirectTo, model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: redirectTo)

    }

}
