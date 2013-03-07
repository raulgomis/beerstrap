package com.app.domain.repository

class Document implements Comparable {

    transient documentService
    //metadata
    String title
    String description
    DocumentCategory category
    Integer downloads = 0

    Date dateCreated
    Date lastUpdated
    String uuid = UUID.randomUUID().toString()

    //fileinfo
    String url
    String originalName //user's name
    String name //after rename
    String type
    Long size
    String extension

    Boolean available
    static transients = ['available']

    Boolean getAvailable() {
        File f = new File(url+ File.separator + name)
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
        dateCreated()
        lastUpdated()

        //fileinfo
        url(nullable:false)
        originalName(nullable:false)
        name(nullable:false)
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
        title.compareTo(obj.title)
    }

    String toString(){
        title
    }
    /*
    def beforeInsert() {
        uuid = UUID.randomUUID().toString()
    }
    */
    def afterDelete() {
        documentService.deleteDocumentFromDisk(this)
    }
}


public enum DocumentCategory {
    Category1("Category1"),Category2("Category2"),Category3("Category3"),Category4("Category4")

    final String id

    DocumentCategory(String id) {
        this.id = id
    }

    public static list() {
        return [Category1,Category2,Category3,Category4]
    }
}
