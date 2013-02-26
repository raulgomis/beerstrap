package com.app.domain.repository

class Document implements Comparable {

    transient documentService

    String title
    String description
    String category
    Integer downloads = 0

    byte[] data //see if it is the best option
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
        //medatada
        title()
        category(nullable:true)
        description(maxSize:1000,nullable:true)
        downloads()

        //fileinfo
        url(nullable:false)
        name(nullable:false)
        rename(nullable:false)
        type()
        size(min:0L)
        extension(nullable:true)
    }

    static mapping = {
        sort name:"asc"
        data lazy: true
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
        documentService.deleteDocumentFromDisk(this)
    }
}

