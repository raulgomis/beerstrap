class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		//"/home/$action?/$id?"(controller:"home")
		
		"/admin/role/$action?/$id?"(controller:"role")
		"/admin/user/$action?/$id?"(controller:"user")
		"/admin/userRole/$action?/$id?"(controller:"userRole")
		"/admin/configuration/$action?/$id?"(controller:"configuration")
		
		"/"(controller:"public")
		
		"500"(view:'/error')
	}
}
