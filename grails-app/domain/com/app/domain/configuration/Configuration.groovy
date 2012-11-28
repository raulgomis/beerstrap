package com.app.domain.configuration

class Configuration {

    String name
    String value

    static constraints = {
        name(nullable:false, blank:false, unique:true)
        value(nullable:false)
    }
	
	static mapping = {
		cache true
	}

    String toString(){
        name+":"+value
    }
}

