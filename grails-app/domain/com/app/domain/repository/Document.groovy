package com.app.domain.repository

import java.io.File

class Document implements Comparable {



    String title
    String description
    String category
    Integer downloads = 0

    String url
    String name
    String rename
    String type
    Long size
    String extension

    Date dateCreated
    Date lastUpdated

    Boolean available
    static transients = ['available']

    Boolean getAvailable() {
        File f = new File(url+ File.separator + rename)
        return f.exists()
    }


    static hasMany = []
    static belongsTo = []

    static constraints = {
        title(nullable:true)
        category(nullable:true)
        description(maxSize:1000,nullable:true)
        downloads(nullable:true)

        url(nullable:false)
        name(nullable:false)
        rename(nullable:false)
        type()
        size(min:0L)
        extension(nullable:true)
    }

    static mapping = {
        sort name:"asc"
    }

    static namedQueries = {
    }

    int compareTo(obj) {
        name.compareTo(obj.name)
    }

    String toString(){
        title
    }

    def afterDelete() {
        try {
            File f = new File(url+ File.separator + rename)
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
}
