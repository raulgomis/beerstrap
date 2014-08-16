/*
 * Copyright 2004-2005 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import grails.util.GrailsNameUtils
import org.codehaus.groovy.grails.validation.DomainClassPropertyComparator
import org.codehaus.groovy.grails.validation.ConstrainedProperty

includeTargets << grailsScript("Init")
includeTargets << grailsScript("_GrailsBootstrap")
includeTargets << grailsScript("_GrailsCreateArtifacts")

generateForName = null

target(main: "Generates i18n messages for domain classes") {
    depends(checkVersion, parseArguments, packageApp)
    promptForName(type: "Domain Class")
    generateI18nMessages()
}

setDefaultTarget(main)

target(generateI18nMessages: "The implementation target") {
    try {
        def name = argsMap["params"][0]
        if (!name || name == "*") {
            uberGenerate()
        }
        else {
            generateForName = name
            generateForOne()
        }
    }
    catch (Exception e) {
        logError("Error running generate-i18n-messages", e)
        exit(1)
    }
}

target(generateForOne: "Generates i18n messages for only one domain class") {
    depends(loadApp)

    def name = generateForName
    name = name.indexOf('.') > -1 ? name : GrailsNameUtils.getClassNameRepresentation(name)
    def domainClass = grailsApp.getDomainClass(name)

    if (!domainClass) {
        println "Domain class not found in grails-app/domain, trying hibernate mapped classes..."
        bootstrap()
        domainClass = grailsApp.getDomainClass(name)
    }

    if (domainClass) {
        generateForDomainClass(domainClass)
        event("StatusFinal", ["Finished generation for domain class ${domainClass.fullName}. Copy messages to appropriate resource bundle(s)"])
    }
    else {
        event("StatusFinal", ["No domain class found for name ${name}. Please try again and enter a valid domain class name"])
    }
}

target(uberGenerate: "Generates i18n messages for all domain classes") {
    depends(loadApp)

    def domainClasses = grailsApp.domainClasses

    if (!domainClasses) {
        println "No domain classes found in grails-app/domain, trying hibernate mapped classes..."
        bootstrap()
        domainClasses = grailsApp.domainClasses
    }

   if (domainClasses) {
        domainClasses.each { domainClass ->
            generateForDomainClass(domainClass)
        }
        event("StatusFinal", ["Finished generation for domain classes. Copy messages to appropriate resource bundle(s)"])
    }
    else {
        event("StatusFinal", ["No domain classes found"])
    }
}

def generateForDomainClass(domainClass) {
    // print generic messages for this domain class
    println "\n"
    println "# ${domainClass.shortName} messages"
    println "${domainClass.propertyName}.label=${domainClass.shortName}"
    println "${domainClass.propertyName}.create.label=Create ${domainClass.shortName}"
    println "${domainClass.propertyName}.edit.label=Edit ${domainClass.shortName}"
    println "${domainClass.propertyName}.list.label=${domainClass.shortName} List"
    println "${domainClass.propertyName}.new.label=New ${domainClass.shortName}"
    println "${domainClass.propertyName}.show.label=Show ${domainClass.shortName}"
    println "${domainClass.propertyName}.created.message=${domainClass.shortName} {0} created"
    println "${domainClass.propertyName}.updated.message=${domainClass.shortName} {0} updated"
    println "${domainClass.propertyName}.deleted.message=${domainClass.shortName} {0} deleted"
    println "${domainClass.propertyName}.not.found.message=${domainClass.shortName} not found with id {0}"
    println "${domainClass.propertyName}.not.deleted.message=${domainClass.shortName} not deleted with id {0}"
    println "${domainClass.propertyName}.optimistic.locking.failure.message=Another user has updated this ${domainClass.shortName} while you were editing"

    // print messages for all properties contained by domain class
    props = domainClass.properties.findAll { it.name != 'version' }
    Collections.sort(props, new DomainClassPropertyComparator(domainClass))
    props.each { p ->
        println "${domainClass.propertyName}.${p.name}.label=${p.naturalName}"

        // print messages for inList constaint values
        cp = domainClass.constrainedProperties[p.name]
        if (cp?.inList) {
            cp.inList.each { v ->
                println "${domainClass.propertyName}.${p.name}.${v}.label=${v}"
            }
        }

        // print error messages for constraints
        cp?.appliedConstraints?.each { c ->
            switch (c.name) {
                case ConstrainedProperty.BLANK_CONSTRAINT:
                    if (!c.parameter)
                        println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] cannot be blank"
                    break
                case ConstrainedProperty.CREDIT_CARD_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] is not a valid credit card number"
                    break
                case ConstrainedProperty.EMAIL_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] is not a valid e-mail address"
                    break
                case ConstrainedProperty.IN_LIST_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] is not contained within the list [{3}]"
                    break
                case ConstrainedProperty.MATCHES_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] does not match the required pattern [{3}]"
                    break
                case ConstrainedProperty.MAX_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] exceeds maximum value [{3}]"
                    break
                case ConstrainedProperty.MAX_SIZE_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] exceeds the maximum size of [{3}]"
                    break
                case ConstrainedProperty.MIN_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] is less than minimum value [{3}]"
                    break
                case ConstrainedProperty.MIN_SIZE_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] is less than the minimum size of [{3}]"
                    break
                case ConstrainedProperty.NOT_EQUAL_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] cannot equal [{3}]"
                    break
                case ConstrainedProperty.NULLABLE_CONSTRAINT:
                    if (!c.nullable)
                        println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] cannot be empty"
                    break
                case ConstrainedProperty.RANGE_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] does not fall within the valid range from [{3}] to [{4}]"
                    break
                case ConstrainedProperty.SIZE_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] does not fall within the valid size range from [{3}] to [{4}]"
                    break
                case ConstrainedProperty.URL_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] is not a valid URL"
                    break
                case ConstrainedProperty.VALIDATOR_CONSTRAINT:
                    println "${domainClass.propertyName}.${p.name}.${c.name}.error=Property [${p.naturalName}] with value [{2}] does not pass custom validation"
                    break
            }
        }
    }
    println "\n"
}
