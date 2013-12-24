class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        //"/home/$action?/$id?"(controller:"home")

        "/admin/users/$action?/$id?"(controller:"user")
        "/admin/documents/$action?/$id?"(controller:"document")
        "/admin/configuration/$action?/$id?"(controller:"configuration")

        "/"(controller:"public")

        "500"(view:'/common/error/error')
        "404"(view:'/common/error/error404')
    }
}
