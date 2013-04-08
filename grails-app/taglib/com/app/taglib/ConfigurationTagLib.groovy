package com.app.taglib

class ConfigurationTagLib {
    static namespace = 'bs'

    def configurationService

    def config = { attrs, body ->
        String key = attrs.key
        if(key){
            String value = configurationService.getStringValue(key)
            if(value != null){
                out << value
            }
        }
    }
}
