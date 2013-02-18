package com.app.services

import java.io.File;
import java.util.List;

import org.codehaus.groovy.grails.exceptions.*

import com.app.domain.*
import grails.util.Metadata

class FileUploaderService {

    private static final String DB_DOCS_ALLOWED = 'GM_DOCS_ALLOWED_EXT'
    private static final String DB_DOCS_MAXTAM = 'GM_DOCS_MAXTAM'
    private static final String DB_DOCS_PATH = 'GM_DOCS_PATH'
    private static final String DB_DOCS_PATH_GENERAL = 'DB_DOCS_PATH_GENERAL'

    def grailsApplication

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
        if (maxSize) { //si existe el maxSize
            def maxSizeInKb = ((int) (maxSize))
            if (fileSize > maxSize) {
                return false
            }
            return true
        }
        return false
    }

    private List getAllowedExtensions(){
        def config = grailsApplication.config.docs
        return ['doc','pdf','docx']
        /*
        def allowedExtensionsConfig = (config.allowedExtensions)?:"*"
        def allowedExtensionsBD = Configuracion.findByNombre(DB_DOCS_ALLOWED)
        def allowedExtensions = (allowedExtensionsBD)?allowedExtensionsBD.valor:allowedExtensionsConfig
        allowedExtensions = allowedExtensions.replaceAll(" ","")
        allowedExtensions = allowedExtensions.tokenize(",")

        return allowedExtensions
        */
    }

    private Long getMaxSize(){
        def config = grailsApplication.config.docs
        return 10000000

        /*def maxSizeConfig = (config.maxSize)?config.maxSize:"10000"
        def maxSizeBD = Configuracion.findByNombre(DB_DOCS_MAXTAM)
        def maxSize = ((maxSizeBD)?maxSizeBD.valor:maxSizeConfig).toInteger()*1024 // Si son KB hay que multiplicar x 1024

        return maxSize*/
    }

    private File getFilePath(String subfolder = null){
        def config = grailsApplication.config.docs
        String appName = Metadata.current['app.name']
        def pathConfig = (config.path)?config.path:new File(System.getProperty('user.home'), appName).canonicalPath

        /*def pathBD = Configuracion.findByNombre(DB_DOCS_PATH)
        def path = (pathBD)?pathBD.valor:pathConfig*/

        def path = pathConfig

        if (!path.endsWith('/')) path=path+'/'

        /*if(subfolder){
            path = ""
            path = path+subfolder+File.separator
            ApplicationSupport apps = new ApplicationSupport()
            apps.generateSubfolder(path)
        }*/

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



    def saveFile(f, String subfolder = null) {

        /*********************
         Comprobamos si existe el fichero
         ********************* */
        if(!f || f.empty){
            throw new RuntimeException("Error. File empty or not valid")
        }

        def size = f.size
        def name = f.originalFilename
        def rename = getRenameFile(name)
        def tipo = f.contentType

        //config handler

        List allowedExtensions = getAllowedExtensions()
        Long maxSize = getMaxSize()



        /************************
         comprobamos la extensiones
         *********************** */
        String fileExtension = name.substring(name.lastIndexOf('.') + 1)
        if(!checkAllowedExtensions(fileExtension,allowedExtensions)){
            def msg = "Extensions not allowed"
            log.debug(msg)
            throw new RuntimeException(msg)
        }

        /*********************
         Comprobamos el tamaño del fichero
         ********************* */
        if(!checkSize(size, maxSize)){
            def msg = "Se ha intentado insertar un fichero que ocupa más espacio del adecuado. El fichero máximo es ${maxSize}B"
            log.debug(msg)
            throw new RuntimeException(msg)
        }

        def userDir = getFilePath(subfolder)

        /*********************
         Guardamos el documento
         ********************* */
        /*documentoInstance.url = userDir
        documentoInstance.tamanyo = size
        documentoInstance.nombre = name
        documentoInstance.renombre = rename
        documentoInstance.tipo = tipo
        documentoInstance.extension = fileExtension
        documentoInstance.descargas = 0
        if(!documentoInstance.titulo){
            documentoInstance.titulo = name
        }

        if(documentoInstance.save(flush:true)){
            f.transferTo( new java.io.File(userDir, rename)) //movemos el fichero
            return documentoInstance
        }
        else{
            log.info(documentoInstance.errors)
            def msg = "Error al guardar el fichero"
            throw new RuntimeException(msg)
        } */

        try{
            f.transferTo( new java.io.File(userDir, rename))
        }
        catch(Exception ex){
            def msg = "Error al guardar el fichero"
            throw new RuntimeException(msg)
        }
    }


}
