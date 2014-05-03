package com.app.core

/**
 * Register custom property editor for dates
 * See http://stackoverflow.com/questions/963922/grails-date-unmarshalling
 *
 * @author Raúl Gomis
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

