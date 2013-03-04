package com.app.domain.repository

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
import grails.validation.ValidationException

class DocumentController {

    def documentService

    static admin = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max, String q, Integer dateCreatedDays, Integer lastUpdatedDays, String category) {
        params.max = Math.min(max ?: 30, 100)

        def now = new Date()

        def documentInstanceList = Document.createCriteria().list(params) {
            if(q!=null){
                or{
                    ilike("title","%"+q+"%")
                }
            }
            if (category != null && !category.isEmpty()){
                eq("category",DocumentCategory.valueOf(category))
            }
            if (dateCreatedDays != null){
                between('dateCreated', now-dateCreatedDays, now)
            }
            if (lastUpdatedDays != null){
                between('lastUpdated', now-lastUpdatedDays, now)
            }

            order("title","desc")
        }
        [documentInstanceList: documentInstanceList, documentInstanceTotal: documentInstanceList.totalCount]

    }

    def create() {
        [documentInstance: new Document(params)]
    }

    def save() {
        def documentInstance = new Document(params)
        println (request instanceof MultipartHttpServletRequest)
        if (request instanceof MultipartHttpServletRequest){
            for(filename in request.getFileNames()){
                try{
                    def f = request.getFile(filename)
                    if(f){
                        documentInstance = documentService.saveFile(f, documentInstance,null)

                        flash.message = message(code: 'default.created.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
                        redirect(action: "list")
                        return
                    }
                }
                catch (ValidationException ex){
                    render(view: "create", model: [documentoInstance: ex.invalidObject])
                }
                catch(Exception ex){
                    log.error(ex)
                    flash.message = ex
                    render(view: "create", model: [documentoInstance: documentInstance])
                }
            }
        }
        else{
            flash.message = "File missing"
            render(view: "create", model: [documentoInstance: documentInstance])
        }


        /*def documentInstance = new Document(params)
        if (!documentInstance.save(flush: true)) {
            render(view: "create", model: [documentInstance: documentInstance])
            return
        }   */


    }

    def show(Long id) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        [documentInstance: documentInstance]
    }

    def edit(Long id) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        [documentInstance: documentInstance]
    }

    def update(Long id, Long version) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (documentInstance.version > version) {
                documentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'document.label', default: 'Document')] as Object[],
                          "Another user has updated this Document while you were editing")
                render(view: "edit", model: [documentInstance: documentInstance])
                return
            }
        }

        documentInstance.properties = params

        if (!documentInstance.save(flush: true)) {
            render(view: "edit", model: [documentInstance: documentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'document.label', default: 'Document'), documentInstance.id])
        redirect(action: "list")
        //redirect(action: "show", id: documentInstance.id)
    }

    def delete(Long id) {
        def documentInstance = Document.get(id)
        if (!documentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
            return
        }

        try {
            documentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'document.label', default: 'Document'), id])
            redirect(action: "show", id: id)
        }
    }

    def download() {
        try{
            def (documentInstance, bytes) = documentService.downloadDocument(params.id)
            response.setContentType("application-xdownload")
            response.setHeader("Content-Disposition", "attachment;filename=\"${(documentInstance.originalName)}\"")
            response.getOutputStream() << new ByteArrayInputStream(bytes)
        }
        catch(ValidationException ex){
            flash.message = "Document not found"
            redirect(action: "show", id: params.id)
        }
        catch(Exception ex){
            flash.message = ex.message
            redirect(action: "show", id: params.id)
        }

    }


    def ajaxGetFiles(){
        def results = []
        List<Document> listOfFiles = Document.list()
        listOfFiles.each { Document file ->
                results << [
                        name: file.originalName,
                        size: file.size,
                        url: createLink(controller: 'document', action: 'ajaxGetFiles'),
                        thumbnail_url: createLink(controller: 'document', action: 'ajaxGetFiles'),
                        delete_url: createLink(controller: 'document', action: 'ajaxGetFiles'),
                        delete_type: "DELETE"
                ]
        }
        render results as JSON
    }

    def fileupload() {
        def documentInstance = new Document(params)
        def results = []
        if (request instanceof MultipartHttpServletRequest){
            for(filename in request.getFileNames()){
                MultipartFile f = request.getFile(filename)
                try{
                    if(f){
                        documentInstance = documentService.saveFile(f, documentInstance,null)
                    }
                }
                catch (ValidationException ex){
                    log.error(ex)
                }
                catch(Exception ex){
                    log.error(ex)
                }

                results << [
                        name: documentInstance.originalName,
                        size: documentInstance.size,
                        url: createLink(controller: 'document', action: 'ajaxGetFiles'),
                        thumbnail_url: createLink(controller: 'document', action: 'ajaxGetFiles'),
                        delete_url: createLink(controller: 'document', action: 'ajaxGetFiles'),
                        delete_type: "DELETE"
                ]
            }
        }

        render results as JSON
    }


}
