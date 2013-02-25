package com.app.utils

/**
 * @author raul.gomis
 *
 */

import org.codehaus.groovy.grails.commons.ApplicationHolder
import grails.util.Metadata
import org.apache.commons.logging.LogFactory

class ApplicationSupport {

    private static final log = LogFactory.getLog(this)
    def grailsApplication

    /*
     * PATHS
     */
    static String getPath(){
        def config = ApplicationHolder.application.config
        def dirPath = config.documentos.path.toString()
        return dirPath
    }

    static String getPathFotos(){
        def config = ApplicationHolder.application.config
        def dirPathFotos = config.documentos.pathFotos.toString()
        return dirPathFotos
    }

    static String getPathGeneral(){
        def config = ApplicationHolder.application.config
        def dirPathGeneral = config.documentos.pathGeneral.toString()
        return dirPathGeneral
    }

    /*
     * FUNCTIONS
     */
    static private generateFoldersGeneral (List folders) {
        for(String folder in folders){
            if(folder){
                def dir = new File(folder)
                if (!dir.exists()){
                    dir.mkdirs()
                    log.debug("Directorio creado en "+folder)
                }
            }
            else{
                log.error("No se ha creado el directorio ${folder} para subir los ficheros")
            }
        }
    }


    public void generateSubfolder(String subfolder){
        generateFolders()

        List folders = [
                subfolder
        ]

        generateFoldersGeneral(folders)
    }

    static public generateFolders() {

        def dirPath = getPath()
        def dirPathFotos = getPathFotos()
        def dirPathGeneral = getPathGeneral()

        List folders = [
                dirPath,
                dirPathFotos,
                dirPathGeneral
        ]

        generateFoldersGeneral(folders)
    }

    static public generateFoldersYear(Integer year) {

        def dirPath = getPath()
        def dirPathYear = dirPath + File.separator + year.toString()

        List folders = [
                dirPath,
                dirPathYear,
                dirPathYear + File.separator + "usuarios",
                dirPathYear + File.separator + "informes",
                dirPathYear + File.separator + "otros"
        ]

        generateFoldersGeneral(folders)
    }

    static public generateFoldersUsuario(Integer year, String username) {

        def dirPath = getPath()
        def dirPathYear = dirPath + File.separator + year.toString()
        def dirPathUser = dirPath + File.separator + year.toString() + File.separator + username

        List folders = [
                dirPath,
                dirPathYear,
                dirPathUser,
                dirPathUser + File.separator + "justificantes",
                dirPathUser + File.separator + "personales"
        ]

        generateFoldersGeneral(folders)
    }



}