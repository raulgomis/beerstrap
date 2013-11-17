package com.app.services

import com.app.admin.domain.configuration.Configuration

class ConfigurationService {

    static transactional = false

    def grailsApplication

    //KEY/VALUE database store
    public String getStringValue(String key){
        return Configuration.findByKey(key)?.value
    }

    public void setStringValue(String key, String value){
        Configuration c = Configuration.findByKey(key)
        if (c) {
            //update present config
            c.value = value
            if (!c.save()){
                log.error("error saving "+key)
            }
        }
        else{
            //we create a new config file
            c = new Configuration(key:key,value:value)
            if (!c.save()){
                log.error("error saving "+key)
            }
        }
    }

    def void setConfigValue(String pathString, def newValue) {
        def config = grailsApplication.config /* hope you have injected grailsApplication bean */
        List paths = pathString.tokenize(".")
        String lastVar = paths.last()
        paths.remove(paths.size() - 1);

        paths.each {path ->
            config = config."${path}"
        }
        config."$lastVar" = newValue
    }

}
