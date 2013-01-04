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
	}

    String toString(){
        key+":"+value
    }
}

