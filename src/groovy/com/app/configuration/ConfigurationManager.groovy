package com.app.configuration

import com.app.services.ConfigurationService

/**
 * Used to manage application configuration values
 *
 * @author Raúl Gomis
 */
public class ConfigurationManager {

    static ConfigurationService configurationService

    public final static String BT_SITE_NAME = ROOT_PREFIX + ".BT_SITE_NAME",
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


    public static String getSiteName(){
        return configurationService.getStringValue(BT_SITE_NAME) as String
    }
    public static void setSiteName(String value){
        configurationService.setStringValue(BT_SITE_NAME,value.toString())
    }

    public static Boolean isSiteActive(){
        return configurationService.getStringValue(BT_SITE_OFFLINE) as Boolean
    }
    public static void setSiteActive(Boolean value){
        configurationService.setStringValue(BT_SITE_OFFLINE, value.toString())
    }

    public static Integer getMaxListHome(){
        return configurationService.getStringValue(BT_SITE_MAXLISTHOME) as Integer
    }
    public static void setMaxListHome(Integer value){
        configurationService.setStringValue(BT_SITE_MAXLISTHOME,value.toString())
    }

    public static Integer getMaxList(){
        return configurationService.getStringValue(BT_SITE_MAXLIST) as Integer
    }
    public static void setMaxList(Integer value){
        configurationService.setStringValue(BT_SITE_MAXLIST,value.toString())
    }

    public static String getFAQText(){
        return configurationService.getStringValue(BT_HELP_FAQ) as String
    }
    public static void setFAQText(String value){
        configurationService.setStringValue(BT_HELP_FAQ,value.toString())
    }
}
