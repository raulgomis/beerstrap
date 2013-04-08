grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        //runtime 'mysql:mysql-connector-java:5.1.20'
        //test "org.spockframework:spock-grails-support:0.7-groovy-2.0"
        //compile 'org.mongodb:mongo-java-driver:2.10.1'

    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        //compile ':mongodb:1.0.0.GA'

        //runtime ":jquery:1.8.0"
        runtime ":resources:1.2.RC2"

        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"

        build ":tomcat:$grailsVersion"

        runtime ":database-migration:1.2.2"

        compile ":spring-security-core:1.2.7.3"
        compile ":mail:1.0.1"
        compile ':cache:1.0.1'

        //Uncomment these if you have good support for testing
        //test(":spock:0.7") { exclude "spock-grails-support" }
        //test ':fixtures:1.0.7'
        //test ":build-test-data:2.0.4"
        //test ":code-coverage:1.2.5"

    }
}
