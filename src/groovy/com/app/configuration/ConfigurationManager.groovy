package com.app.configuration

import org.codehaus.groovy.grails.commons.GrailsApplication;

/**==========================================================
 * User: raulgomis
 * Date: 7/03/13 | Time: 17:33
 * ==========================================================
 * Copyright 2013 Grails Bootstrap.
 */
public class ConfigurationManager {

    static configurationService

    public final static String BT_SITE_NAME = "grailsbs.BT_SITE_NAME",
                         BT_SITE_OFFLINE = "grailsbs.BT_SITE_NAME",
                         BT_SITE_MAXLISTHOME = "grailsbs.BT_SITE_MAXLISTHOME",
                         BT_SITE_MAXLIST = "grailsbs.BT_SITE_MAXLIST",
                         BT_HELP_FAQ = "grailsbs.BT_HELP_FAQ"


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
