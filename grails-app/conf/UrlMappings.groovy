class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/admin/role/$action?/$id?"(controller:"role")
		"/admin/user/$action?/$id?"(controller:"user")
		"/admin/userRole/$action?/$id?"(controller:"userRole")
		"/admin/configuration/$action?/$id?"(controller:"configuration")
		
		"/"(controller:"home")
		
		"500"(view:'/error')
	}
}
