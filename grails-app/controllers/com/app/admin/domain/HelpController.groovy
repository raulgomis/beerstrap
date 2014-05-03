package com.app.admin.domain

/**
 * Help Controller
 *
 * @author Raúl Gomis
 */
class HelpController extends AbstractController {

    def index() { redirect(action:"Faq") }

    def faq() {}

    def videos(){}
}
