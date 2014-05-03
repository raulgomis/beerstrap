package com.app.services

import com.app.utils.ApplicationSupport
import grails.validation.ValidationException

import grails.util.Metadata
import org.springframework.web.multipart.commons.CommonsMultipartFile
import com.app.admin.domain.repository.Document
import com.app.admin.domain.configuration.*

/**
 * Service used to manage document uploads/downloads
 *
 * @author Raúl Gomis
 */
class DocumentService {

    static transactional = false

    def grailsApplication

    private static final String DB_DOCS_ALLOWED = 'GM_DOCS_ALLOWED_EXT'
    private static final String DB_DOCS_MAXTAM = 'GM_DOCS_MAXTAM'
    private static final String DB_DOCS_PATH = 'GM_DOCS_PATH'
    private static final String DB_DOCS_PATH_GENERAL = 'DB_DOCS_PATH_GENERAL'

    private Boolean checkAllowedExtensions(String fileExtension, List allowedExtensions){
        if (allowedExtensions) {
            if (!allowedExtensions.contains("*") && !allowedExtensions.contains(fileExtension)) {
                //def msg = messageSource.getMessage("fileupload.upload.unauthorizedExtension", [fileExtension, config.allowedExtensions] as Object[], locale)
                return false
                //throw new FileUploaderServiceException(msg)
            }
            return true
        }
        return false
    }

    private Boolean checkSize(Long fileSize, Long maxSize){
        if (maxSize) {
            def maxSizeInKb = ((int) (maxSize))
            if (fileSize > maxSize) {
                return false
            }
            return true
        }
        return false
    }

    private List getAllowedExtensions(){
        def config = grailsApplication.config.documentos

        def allowedExtensionsConfig = (config.allowedExtensions)?config.allowedExtensions:"*"
        def allowedExtensionsBD = Configuration.findByKey(DB_DOCS_ALLOWED)
        def allowedExtensions = (allowedExtensionsBD)?allowedExtensionsBD.value:allowedExtensionsConfig
        allowedExtensions = allowedExtensions.replaceAll(" ","")
        allowedExtensions = allowedExtensions.tokenize(",")

        return allowedExtensions
    }

    private Long getMaxSize(){
        def config = grailsApplication.config.documentos
        def maxSizeConfig = (config.maxSize)?config.maxSize:"10000"
        def maxSizeBD = Configuration.findByKey(DB_DOCS_MAXTAM)
        def maxSize = ((maxSizeBD)?maxSizeBD.value:maxSizeConfig).toInteger()*1024 // Si son KB hay que multiplicar x 1024

        return maxSize
    }

    private File getFilePath(String subfolder){
        def config = grailsApplication.config.documentos
        String appName = Metadata.current['app.name']
        def pathConfig = (config.path)?config.path:new File(System.getProperty('user.home'), appName).canonicalPath
        def pathBD = Configuration.findByKey(DB_DOCS_PATH)
        def path = (pathBD)?pathBD.valor:pathConfig
        if (!path.endsWith('/')) path=path+'/'

        if(subfolder){
            path = ""
            path = path+subfolder+File.separator
            ApplicationSupport apps = new ApplicationSupport()
            apps.generateSubfolder(path)
        }

        return getUploadDirectory(path)
    }

    private File getUploadDirectory(String path){
        File userDir
        try{
            userDir = new java.io.File(path)
            if(!userDir.exists()){
                if (!userDir.mkdirs()){
                    log.error("No se han podido crear los directorios: [${path}]")
                }
            }
        }
        catch(Exception ex){
            def message = "Error al crear el directorio"
            throw new RuntimeException(message)
        }
        return userDir
    }

    private String getRenameFile(String extension, String uuid = null){
        if (!uuid){
            uuid = UUID.randomUUID().toString()
        }
        String rename = uuid
        if (extension != null && !extension.empty) {
            rename = rename + "." + extension
        }
        return rename
    }

    public Document saveFile(CommonsMultipartFile f, Document documentInstance, String subfolder = null) throws ValidationException {

        if(!f || f.empty){
            throw new RuntimeException("File not valid")
        }

        def size = f.size
        String originalFilename = f.originalFilename
        String fileExtension = originalFilename.substring(originalFilename.lastIndexOf('.') + 1)
        String rename = getRenameFile(fileExtension,documentInstance.uuid)
        def type = f.contentType


        // Check allowed extensions
        List allowedExtensions = getAllowedExtensions()
        if(!checkAllowedExtensions(fileExtension,allowedExtensions)){
            def msg = "File extension not allowed"
            log.debug(msg)
            throw new RuntimeException(msg)
        }

        // Check allowed extensions
        Long maxSize = getMaxSize()
        if(!checkSize(size, maxSize)){
            def msg = "MAX_TAM exceeded"
            log.debug(msg)
            throw new RuntimeException(msg)
        }

        def userDir = getFilePath(subfolder)

        // Save document
        documentInstance.url = userDir
        documentInstance.size = size
        documentInstance.originalName = originalFilename
        documentInstance.name = rename
        documentInstance.type = type
        documentInstance.extension = fileExtension
        documentInstance.downloads = 0
        if(!documentInstance.title){
            documentInstance.title = originalFilename
        }

        if(documentInstance.save(flush:true)){
            f.transferTo( new java.io.File(userDir, rename))
            return documentInstance
        }
        else{
            log.info(documentInstance.errors)
            def msg = "Can't save file"
            throw new ValidationException(msg,documentInstance)
        }
    }

    public def downloadDocument(String uuid) throws ValidationException {
        def documentInstance = Document.findByUuid(uuid)
        byte[] bytes
        if(documentInstance){
            def file = new java.io.File(getFilePath(),documentInstance.name)
            bytes = file.readBytes()
            documentInstance.downloads++
            if (!documentInstance.save()){
                throw new ValidationException(null,documentInstance)
            }
        }
        else {
            throw RuntimeException()
        }
        return [documentInstance,bytes]
    }

    public void deleteDocumentFromDisk(Document document){
        try {
            String filePath = document.url+ File.separator + document.name
            File f = new File(filePath)
            if (f.delete()) {
                log.debug "file [${url}] deleted"
            }
            else {
                log.error "could not delete file: ${f}"
            }
        }
        catch (Exception e) {
            log.error "Error deleting file: ${e.message}"
        }
    }

}
