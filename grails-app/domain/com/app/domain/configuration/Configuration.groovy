package com.app.domain.configuration

class Configuration {

    String key
    String value

    static constraints = {
        key(nullable:false, blank:false, unique:true)
        value(nullable:false)
    }
	
	static mapping = {
		cache true
        version false
	}

    String toString(){
        key+":"+value
    }
}

