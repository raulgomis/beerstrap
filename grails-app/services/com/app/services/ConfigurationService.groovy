package com.app.services

import com.app.domain.configuration.Configuration

class ConfigurationService {
	
	static transactional = false
    static scope = "singleton"

	def grailsApplication

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
    /*
    "grailsbs.BT_SITE_NAME":"Grails Bootstrap",
    "grailsbs.BT_SITE_OFFLINE":"False",
    "grailsbs.BT_SITE_MAXLISTHOME":"5",
    "grailsbs.BT_SITE_MAXLIST":"30",
    "grailsbs.BT_HELP_FAQ":"FAQ text goes here",
     */

    private final String BT_SITE_NAME = "grailsbs.BT_SITE_NAME",
        BT_SITE_OFFLINE = "grailsbs.BT_SITE_NAME",
        BT_SITE_MAXLISTHOME = "grailsbs.BT_SITE_MAXLISTHOME",
        BT_SITE_MAXLIST = "grailsbs.BT_SITE_MAXLIST",
        BT_HELP_FAQ = "grailsbs.BT_HELP_FAQ"


    public String getSiteName(){
        return getStringValue(BT_SITE_NAME) as String
    }
    public void setSiteName(String value){
        setStringValue(BT_SITE_NAME,value.toString())
    }

    public Boolean isSiteActive(){
        return getStringValue(BT_SITE_OFFLINE) as Boolean
    }
    public void setSiteActive(Boolean value){
        setStringValue(BT_SITE_OFFLINE, value.toString())
    }

    public Integer getMaxListHome(){
        return getStringValue(BT_SITE_MAXLISTHOME) as Integer
    }
    public void setMaxListHome(Integer value){
        setStringValue(BT_SITE_MAXLISTHOME,value.toString())
    }

    public Integer getMaxList(){
        return getStringValue(BT_SITE_MAXLIST) as Integer
    }
    public void setMaxList(Integer value){
        setStringValue(BT_SITE_MAXLIST,value.toString())
    }

    public String getFAQText(){
        return getStringValue(BT_HELP_FAQ) as String
    }
    public void setFAQText(String value){
        setStringValue(BT_HELP_FAQ,value.toString())
    }

}
