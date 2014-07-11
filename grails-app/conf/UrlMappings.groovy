class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/admin/users/$action?/$id?"(controller: "user")
        "/admin/documents/$action?/$id?"(controller: "document")
        "/admin/test/$action?/$id?"(controller: "test")
        "/admin/configuration/$action?/$id?"(controller: "configuration")
        "/profile/$action?"(controller: "profile")
        "/search/$action?"(controller: "search")
        "/help/$action?"(controller: "help")

        "/"(controller:"home")

        "500"(view:'/common/error/error')
        "404"(view:'/common/error/error404')
    }
}
