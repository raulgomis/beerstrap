package com.app.admin.domain

class HomeController extends AbstractController {

    static user = true //set to display in the menu

    def index() {

    }

    def ajaxGraph() {
        List data = []
        render(template: "dialog", model: ['data': data])
    }

}
