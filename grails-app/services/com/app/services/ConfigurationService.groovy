package com.app.services

import com.app.admin.domain.configuration.Configuration
import com.app.configuration.ConfigurationManager

/**
 * Works with configuration values
 *
 * @author Raúl Gomis
 */
class ConfigurationService {

    static transactional = false

    def grailsApplication

    def List<Configuration> beerstrapConfiguration() {
        return Configuration.findAllByKeyLike(ConfigurationManager.ROOT_PREFIX + ".%")
    }

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
            //we create a new config entry
            c = new Configuration(key:key,value:value)
            if (!c.save()){
                log.error("error saving "+key)
            }
        }
    }

    def void setConfigValue(String pathString, def newValue) {
        def config = grailsApplication.config
        List paths = pathString.tokenize(".")
        String lastVar = paths.last()
        paths.remove(paths.size() - 1);

        paths.each {path ->
            config = config."${path}"
        }
        config."$lastVar" = newValue
    }
}
