package com.app.domain.security

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static admin = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max, String q, Long roleID,String filter,Integer dateCreatedDays,Integer lastUpdatedDays) {

        params.max = Math.min(max ?: 10, 100)

        def now = new Date()
        //List listFilters = ["enabled","accountExpired","accountLocked","passwordExpired"]

        def userInstanceList = []

        if(!roleID){
            userInstanceList = User.createCriteria().list(params) {
                if(q!=null){
                    or{
                        ilike("username","%"+q+"%")
                        ilike("name","%"+q+"%")
                    }
                }
                if(filter.equals("enabled")){
                    eq("enabled",true)
                }
                if(filter.equals("accountExpired")){
                    eq("accountExpired",true)
                }
                if(filter.equals("accountLocked")){
                    eq("accountLocked",true)
                }
                if(filter.equals("passwordExpired")){
                    eq("passwordExpired",true)
                }
                if(filter.equals("disabled")){
                    eq("enabled",false)
                }
                if (dateCreatedDays != null){
                    between('dateCreated', now-dateCreatedDays, now)
                }
                if (lastUpdatedDays != null){
                    between('lastUpdated', now-lastUpdatedDays, now)
                }

                order("username","desc")
            }
        }
        else{
            def users = UserRole.withCriteria {
                projections{
                    property 'user'
                }
            }
            //println users
        }



        [userInstanceList: userInstanceList,
                userInstanceTotal: userInstanceList.totalCount,
                roleInstanceList:Role.list()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}
