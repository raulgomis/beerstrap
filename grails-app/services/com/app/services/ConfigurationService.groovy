package com.app.services

import com.app.admin.domain.configuration.Configuration

/**
 * Works with configuration values
 *
 * @author Raúl Gomis
 */
class ConfigurationService {

    static transactional = true

    def grailsApplication

    def List<Configuration> beerstrapConfiguration() {
        return Configuration.findAllByKeyLike(ConfigurationService.ROOT_PREFIX + ".%")
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
            if (!c.save(failOnError: true)){
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

    public static final String BT_SITE_NAME = ROOT_PREFIX + ".BT_SITE_NAME",
                               BT_SITE_OFFLINE = ROOT_PREFIX + ".BT_SITE_OFFLINE",
                               BT_SITE_MAXLISTHOME = ROOT_PREFIX + ".BT_SITE_MAXLISTHOME",
                               BT_SITE_MAXLIST = ROOT_PREFIX + ".BT_SITE_MAXLIST",
                               BT_HELP_FAQ = ROOT_PREFIX + ".BT_HELP_FAQ"

    public static final String ROOT_PREFIX = "beerstrap"

    public static enum ConfigurationGroup {
        SITE(ROOT_PREFIX + ".BT_SITE_"),
        SERVER(ROOT_PREFIX + ".BT_SERVER_"),
        HELP(ROOT_PREFIX + ".BT_HELP_"),
        MAIL("grails.mail.")

        private final String prefix;
        ConfigurationGroup(String prefix) {
            this.prefix = prefix
        }
        String getPrefix() {
            return prefix;
        }
    }


    public String getSiteName(){
        return getStringValue(BT_SITE_NAME) as String
    }
    public void setSiteName(String value){
        setStringValue(BT_SITE_NAME, value.toString())
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
