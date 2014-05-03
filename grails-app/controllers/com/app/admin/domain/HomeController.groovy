package com.app.admin.domain

import com.app.admin.domain.repository.Document
import com.app.admin.domain.security.Role
import com.app.admin.domain.security.User
import grails.plugin.springsecurity.SpringSecurityUtils

/**
 * Home Controller
 *
 * @author Raúl Gomis
 */
class HomeController extends AbstractController {

    static user = true //set user=true to display in the user menu

    def index() {
        if(SpringSecurityUtils.ifAnyGranted(Role.ADMIN)) {
            int countUsers = User.count()
            int countDocs = Document.count()

            int indicator1 = 45
            int indicator2 = 45
            int indicator3 = 45
            int indicator4 = 45

            [countUsers: countUsers, countDocs: countDocs,
             indicator1:indicator1, indicator2:indicator2, indicator3:indicator3, indicator4:indicator4]
        }
    }

    def ajaxGraph() {
        List data = []
        render(template: "dialog", model: ['data': data])
    }

}
