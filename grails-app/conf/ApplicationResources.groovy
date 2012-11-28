modules = {
	
	jquery {
		resource url:'js/jquery/jquery-1.8.3.min.js'
	}
	
    application {
		dependsOn 'jquery'
		resource url:'css/bootstrap-overrides.css'
		resource url:'css/app.css'
		resource url:'js/ajax.js'
    }
	
	login {
		resource url:'css/bootstrap/css/bootstrap.min.css'
		resource url:'css/bootstrap/css/bootstrap-responsive.min.css'
		resource url:'css/login.css'
	}
	

	
	jquerycookie {
		dependsOn 'jquery'
		
	}
	
	init {
		dependsOn 'jquery'
		resource url:'js/init.js'
		resource url:'js/jquery/jquery.cookie.js'
	}
	
	bootstrap {
		dependsOn 'jquery'
		resource url:'css/bootstrap/css/bootstrap.min.css'
		resource url:'css/bootstrap/css/bootstrap-responsive.min.css'
		resource url:'css/bootstrap/js/bootstrap.min.js'
	}

}
