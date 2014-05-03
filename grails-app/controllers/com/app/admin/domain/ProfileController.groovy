package com.app.admin.domain
import com.app.admin.domain.security.*

/**
 * Profile Controller
 *
 * @author Raúl Gomis
 */
class ProfileController extends AbstractController {

    /**
     * Index action. Redirects to main action: account
     */
    def index() { 
        redirect(action:"account")
    }

    /**
     * Shows current user info
     */
    def account() {
        def userInstance = getCurrentUser()
        if (!userInstance) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    /**
     * Updates current user info
     */
    def updateAccount() {
        def userInstance = getCurrentUser()
        String redirectTo = "account"

        if (!userInstance) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: redirectTo)
            return
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: redirectTo, model: [userInstance: userInstance])
            return
        }

        flash.success = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: redirectTo)
    }

    /**
     * Deactivates current user
     */
    def deactivate() {
        def userInstance = getCurrentUser()
        if (!userInstance) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "account")
            return
        }

        userInstance.enabled = false

        if (!userInstance.save(flush: true)) {
            render(view: "account", model: [userInstance: userInstance])
            return
        }

        flash.success = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])

        redirect(controller: "logout")
    }

    /**
     * Shows password change page
     */
    def password() { }

    /**
     * Updates current user password
     */
    def updatePassword(String password, String passwordNew, String passwordRepeat) {

        String redirectTo = "password"

        if(!passwordNew.equals(passwordRepeat)){
            //TODO: I18n in profile
            flash.message = "Passwords do not match"
            redirect(action: redirectTo)
            return
        }

        def userInstance = getCurrentUser()
        if (!userInstance) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: redirectTo)
            return
        }

        String passwordCurrentSec = springSecurityService.encodePassword(password)
        if(!passwordCurrentSec.equals(userInstance.password)){
            flash.error = "Current password is wrong"
            redirect(action: redirectTo)
            return
        }

        userInstance.password = passwordNew

        if (!userInstance.save(flush: true)) {
            render(view: redirectTo, model: [userInstance: userInstance])
            return
        }

        flash.success = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: redirectTo)
    }

    /**
     * Shows preferences page
     */
    def preferences() {
        User userInstance = getCurrentUser()
        [userInstance: userInstance]
    }

    /**
     * Update preferences
     */
    def updatePreferences() {
        User userInstance = getCurrentUser()
        String redirectTo = "preferences"
        if (!userInstance || !userInstance.preferences) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: redirectTo)
            return
        }

        userInstance.preferences.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: redirectTo, model: [userInstance: userInstance])
            return
        }

        flash.success = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: redirectTo)
    }
}
