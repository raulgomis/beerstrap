package com.app.services

import java.io.File;
import java.util.List;

import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.codehaus.groovy.grails.exceptions.*

import com.app.utils.*
import grails.util.Metadata
import com.app.domain.repository.Document


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
        def allowedExtensionsBD = Configuration.findByNombre(DB_DOCS_ALLOWED)
        def allowedExtensions = (allowedExtensionsBD)?allowedExtensionsBD.valor:allowedExtensionsConfig
        allowedExtensions = allowedExtensions.replaceAll(" ","")
        allowedExtensions = allowedExtensions.tokenize(",")

        return allowedExtensions
    }

    private Long getMaxSize(){
        def config = grailsApplication.config.documentos
        def maxSizeConfig = (config.maxSize)?config.maxSize:"10000"
        def maxSizeBD = Configuration.findByNombre(DB_DOCS_MAXTAM)
        def maxSize = ((maxSizeBD)?maxSizeBD.valor:maxSizeConfig).toInteger()*1024 // Si son KB hay que multiplicar x 1024

        return maxSize
    }

    private File getFilePath(String subfolder){
        def config = grailsApplication.config.documentos
        String appName = Metadata.current['app.name']
        def pathConfig = (config.path)?config.path:new File(System.getProperty('user.home'), appName).canonicalPath
        def pathBD = Configuration.findByNombre(DB_DOCS_PATH)
        def path = (pathBD)?pathBD.valor:pathConfig
        if (!path.endsWith('/')) path=path+'/'

        /*
        if(subfolder){
            path = ""
            path = path+subfolder+File.separator
            ApplicationSupport apps = new ApplicationSupport()
            apps.generateSubfolder(path)
        }
        */
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

    private String getRenameFile(String originalFilename){
        String date = new Date().format("yyyyMMddHHmm")
        def rename = date.toString()+"_"+originalFilename
        return rename
    }

    public Document saveFile(f, Document documentInstance, String subfolder = null) {

        if(!f || f.empty){
            throw new RuntimeException("Error fichero no válido")
        }

        def size = f.size
        def name = f.originalFilename
        def rename = getRenameFile(name)
        def type = f.contentType

        List allowedExtensions = getAllowedExtensions()
        Long maxSize = getMaxSize()

        /************************
         Extensions
         *********************** */
        String fileExtension = name.substring(name.lastIndexOf('.') + 1)
        if(!checkAllowedExtensions(fileExtension,allowedExtensions)){
            def msg = "Extensiones no permitidas"
            log.debug(msg)
            throw new RuntimeException(msg)
        }

        /*********************
         File size
         ********************* */
        if(!checkSize(size, maxSize)){
            def msg = "Se ha intentado insertar un fichero que ocupa más espacio del adecuado. El fichero máximo es ${maxSize}B"
            log.debug(msg)
            throw new RuntimeException(msg)
        }

        def userDir = getFilePath(subfolder)

        /*********************
         Save document
         ********************* */
        documentInstance.url = userDir
        documentInstance.size = size
        documentInstance.name = name
        documentInstance.rename = rename
        documentInstance.type = type
        documentInstance.extension = fileExtension
        documentInstance.downloads = 0
        if(!documentInstance.title){
            documentInstance.title = name
        }

        if(documentInstance.save(flush:true)){
            f.transferTo( new java.io.File(userDir, rename))
            return documentInstance
        }
        else{
            log.info(documentInstance.errors)
            def message = "Error al guardar el fichero"
            throw new RuntimeException(msg)
        }
    }

    public void deleteDocumentFromDisk(Document document){
        try {
            String filePath = document.url+ File.separator + document.rename
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
