# Beerstrap
[![Build Status](https://travis-ci.org/raulgomis/beerstrap.svg?branch=master)](https://travis-ci.org/raulgomis/beerstrap)

## 1. What is Beerstrap?
Startup project designed to ease and accelerate software development.
Ideal for startups and web developers who want to rapid-prototype and develop products within weeks without wasting time in configurations and boring stuff.
Software development never has been so fast!

Key things:

- **Productivity**: Don't waste your time in common stuff such as configuring your project: just focus on the specific PRODUCT SOLUTION! Download it and start to develop. Start from a good base: Security ready, Testing ready, Beautiful UI, Code generation, etc.

- **Code generation**: Best scaffolding templates for rapid prototyping. Generate CRUD functionality based on client's requirements and show a functional version to your client within hours. Guaranteed!

- **Save money**: Beerstrap will help you to save money (Yes, you heard right!). As time is money, starting with a solid base project will avoid you coding the starting and boring project setup.

## 2. Technology stack

### 2.1 Backend
The Backend has been implemented using **Grails** framework. Grails is a dynamic web application framework built on Java and Groovy, leveraging best of breed APIs including Spring, Hibernate and SiteMesh. Grails brings to Java and Groovy developers the joys of convention-based rapid development while allowing them to leverage their existing knowledge and capitalize on the proven and performant APIs Java developers have been using for years.

- Grails (version 2.4.2)
- Groovy (version 2.3.3)
- Sitemesh (version 2.4)
- Hibernate (grails plugin, version 4.3.5.4)
- Tomcat (grails plugin, version 7.0.54)
- Grails scaffolding plugin (version 2.1.2)
- Grails cache plugin (version 1.1.7)
- Grails database-migration plugin (version 1.4.0)
- Grails asset pipeline (version 1.9.7)
- Grails spring-security-core plugin (version 2.0-RC4)
- Grails mail plugin (version 1.0.6)

### 2.2 Frontend
In the Frontend, it's been included Twitter Bootstrap as a frontend framework and several
jQuery third party plugins that will help us to develop a high quality front-end.

Technologies:
- Bower [http://bower.io/](http://bower.io/)
- SASS support.

Libraries:
- Twitter Bootstrap SASS (version 3.2.0)
- Bootstrap Datepicker (version 1.3.0)
- d3 (version 3.4.11)
- jQuery Flot Charts (version 0.8.3)
- Font Awesome (version 4.1.0)
- Holderjs (version 2.4.0)
- jQuery (version 2.1.1)
- jQuery cookie (version 1.4.1)
- jQuery File Upload Plugin (version 9.7.0)
- jQuery Iframe Transport Plugin (version 1.6.1)
- jQuery Knob (version 1.2.9)
- jQuery Peity (version 2.0.3)
- Select2 (version 3.5.1)
- Tiny MCE (version 4.1.4)
- Toastr (version 2.0.3)
- Twitter Typeahead.js (version 0.10.5)


## 3. Requirements
**Beerstrap** is based in Grails.

- [Grails](http://grails.org): Grails is an Open Source, full stack, web application framework for the JVM. It takes advantage of the Groovy programming language and convention
over configuration to provide a productive and stream-lined development experience.
- [JDK](http://www.oracle.com/technetwork/es/java/javase/downloads/index.html): Grails runs on the JVM, so you will need the latest JDK 1.6 or JDK 1.7 to use it. Set the environment variable JAVA_HOME pointing to a valid Java JDK directory (e.g. C:\Program Files\Java\jdk1.7.0_65)

## 4. Getting started
It is very easy to start to develop with **Beerstrap**, that's the key of the tool. Download it and start to develop within minutes.

Download or clone the [Beerstrap](https://github.com/raulgomis/beerstrap) repo and execute the following command:
<pre>
grailsw run-app (or grailsw.bat run-app on Windows)
</pre>
After that you will be able to access to [http://localhost:8080](http://localhost:8080) and see the website.

There are three main IDEs that have good integration with Grails:

- [Intellij-IDEA](http://www.jetbrains.com/idea/features/groovy.html)
- [Eclipse (GGTS)](http://spring.io/tools/ggts)
- [Netbeans](https://netbeans.org/kb/docs/web/grails-quickstart.html)

## 5. Demo
[Demo version](http://beerstrap.rgomis.eu.cloudbees.net/) (user: admin, password: admin)

## 6. Changelog

### Release v0.2: Alhambra
- SASS support integrated via *Grails asset pipeline* plugin.
- Bower package manager integrated. Now, all the javascript libraries can be updated via bower. Note: for the moment, in order to ease the project build, the packages are loaded in the GIT repo, in the future they will be integrated in the build process.
- Updated the third party Frontend plugins to the new versions.

### Release v0.1: Franziskaner
- Initial project release.
