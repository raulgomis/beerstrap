package com.app.utils

/**
 * Application utility methods
 *
 * @author Raúl Gomis
 */
import org.apache.commons.logging.LogFactory

class ApplicationSupport {

    private static final log = LogFactory.getLog(this)
    static grailsApplication

    /*
     * PATHS
     */

    static String getPath() {
        def config = grailsApplication.config
        def path = config.documentos.path.toString()
        return path
    }

    static String getPathPhotos() {
        def config = grailsApplication.config
        def path = config.documentos.pathPhotos.toString()
        return path
    }

    static String getPathDocs() {
        def config = grailsApplication.config
        def path = config.documentos.pathDocs.toString()
        return path
    }

    /*
     * FUNCTIONS
     */

    public void generateInitFolders() {

        List folders = [
                getPath(),
                getPathPhotos(),
                getPathDocs()
        ]
        generateFoldersHelper(folders)
    }

    public void generateSubfolder(String subfolder) {
        generateInitFolders()

        List folders = [
                subfolder
        ]
        generateFoldersHelper(folders)
    }

    private void generateFoldersHelper(List folders) {
        for (String folder in folders) {
            if (folder) {
                def dir = new File(folder)
                if (!dir.exists()) {
                    dir.mkdirs()
                    log.debug("Folder created in " + folder)
                }
            } else {
                log.error("Folder '${folder}' not created")
            }
        }
    }
}