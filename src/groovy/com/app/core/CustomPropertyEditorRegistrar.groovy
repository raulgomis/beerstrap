package com.app.core

/**==========================================================
 * User: raulgomis
 * Date: 4/03/13 | Time: 16:33
 * ==========================================================
 * Copyright 2013 Beerstrap.
 * See http://stackoverflow.com/questions/963922/grails-date-unmarshalling
 */
import java.text.SimpleDateFormat
import org.springframework.beans.propertyeditors.CustomDateEditor
import org.springframework.beans.PropertyEditorRegistrar
import org.springframework.beans.PropertyEditorRegistry

public class CustomPropertyEditorRegistrar implements PropertyEditorRegistrar {
    public void registerCustomEditors(PropertyEditorRegistry registry) {
        String dateFormat = "yyyy/MM/dd"

        registry.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat(dateFormat), true));
        registry.registerCustomEditor(Calendar.class, new CustomDateEditor(new SimpleDateFormat(dateFormat), true));
    }
}

