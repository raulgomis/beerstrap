package com.app.services

import org.codehaus.groovy.grails.web.mapping.LinkGenerator

/**
 * Service used to manage emails sent by the application
 *
 * @author Raúl Gomis
 */
class EmailService {

    static transactional = false
    static String emailPrefixDefault = "[Grails-BS]"

    def mailService
    LinkGenerator grailsLinkGenerator

    def register(String to, String token) {
        if(to == null || to.isEmpty())
            throw new IllegalArgumentException("to is null or empty")

        String urlToken = grailsLinkGenerator.link(action:'verifyRegistration',absolute:true,params:[t:token])

        String subject = "${emailPrefixDefault} Please, confirm your account"
        String body = """Here is your confirmation code <a href="${urlToken}">${urlToken}</a>"""

        sendEmail(to,subject,body)
    }

    def forgotPassword(String to, String token){
        if(to == null || to.isEmpty())
            throw new IllegalArgumentException("to is null or empty")

        String urlToken = grailsLinkGenerator.link(action:'resetPassword',absolute:true,params:[t:token])

        String subject = "${emailPrefixDefault} Password recovery"
        String body = "Hello, Here is your url to create a new password <a href=${urlToken}>Link</a>"

        sendEmail(to,subject,body)
    }

    def general(String to, String subject, String body){
        if(to == null || to.isEmpty())
            throw new IllegalArgumentException("to is null or empty")

        if(body != null || !body.isEmpty())
            throw new IllegalArgumentException("body is null or empty")

        //do not allow empty subjects
        subject = (subject)?:"${emailPrefixDefault} Information"

        sendEmail(to,subject,body)
    }

    private void sendEmail(String _to, String _subject, String _body){
        mailService.sendMail {
            to _to
            subject _subject
            html _body
        }
        log.info "Sent email to $_to with subject $_subject"
    }
}
