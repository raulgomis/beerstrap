<%@ page contentType="text/html" %>
<html>
<head>
    <meta name="layout" content="public"/>
    <parameter name="menu_Docs" value="active"/>
    <title>Docs</title>
</head>

<body>
<div class="container">
<h2 class="section_header">
    <span><i class="fa fa-file-o"></i> Docs <small>All the info</small>
    </span>
    <hr class="right visible-desktop"></hr>
</h2>

<section id="docs">
<markdown:renderHtml>

### 1. What is <g:meta name="app.name"/>?
Startup project designed to ease and accelerate software development.
Ideal for startups and web developers who want to rapid-prototype and develop products within weeks without wasting time in configurations and boring stuff.
Software development never has been so fast!

### 2. Technology stack

#### 2.1 Backend
The Backend has been implemented using **Grails** framework. Grails is a dynamic web application framework built on Java and Groovy, leveraging best of breed APIs including Spring, Hibernate and SiteMesh. Grails brings to Java and Groovy developers the joys of convention-based rapid development while allowing them to leverage their existing knowledge and capitalize on the proven and performant APIs Java developers have been using for years.

- Grails (version 2.3.4)
- Groovy (version 2.1.9)
- Sitemesh (version 2.4)
- Hibernate (grails plugin, version 3.6.10.6)
- Tomcat (grails plugin, version 7.0.47)
- Grails scaffolding plugin (version 2.0.1)
- Grails cache plugin (version 1.1.1)
- Grails database-migration plugin (version 1.3.8)
- Grails resources plugin (version 1.2.1)
- Grails spring-security-core plugin (version 2.0-RC2)
- Grails mail plugin (version 1.0.1)
- Grails markdown plugin (version 1.1.1)

#### 2.2 Frontend
In the Frontend, it's been included Twitter Bootstrap as a frontend framework and several
jQuery third party plugins that will help us to develop a high quality front-end:

- Twitter Bootstrap v3.0.3
- Font Awesome 4.0.3
- jQuery v2.0.3
- jQuery cookie
- jQuery File Upload Plugin 5.21.1
- jQuery Iframe Transport Plugin 1.6.1
- jQuery Knob 1.2.0
- jQuery Flot Charts 0.8.1
- jQuery Peity 1.0.0
- jQuery Sparklines 2.1.2
- Toastr Version 2.0.1
- Bootstrap Datepicker
- Select2 3.4.5
- Twitter Typeahead.js 0.9.3


### 3. Requirements
**Grails Boostrap** is based in Grails.

- [Grails](http://grails.org): Grails is an Open Source, full stack, web application framework for the JVM. It takes advantage of the Groovy programming language and convention
over configuration to provide a productive and stream-lined development experience.
- [JDK](http://www.oracle.com/technetwork/es/java/javase/downloads/index.html): Grails runs on the JVM, so you will need the latest JDK 1.6 or JDK 1.7 to use it.

### 4. Getting started
It is very easy to start to develop with **Grails Boostrap**, that's the key of the tool. Download it and start to develop within minutes.

<pre>
git clone https://url.com
grails run-app
</pre>
And you will be able to access to [http://localhost:8080](http://localhost:8080) and see the public website.
### 5. Develop
There are three main IDEs that have good integration with Grails:

- [Intellij-IDEA](http://www.jetbrains.com/idea/features/groovy.html)
- [Eclipse (ggts)](http://spring.io/tools/ggts)
- [Netbeans](https://netbeans.org/kb/docs/web/grails-quickstart.html)

### 6. Terms of use
- **Web Layout**: Bootstrap 2.3.2, from Twitter Licensed under the Apache License v2.0. Documentation licensed under CC BY 3.0. (@TwBootstrap , http://twitter.github.com/bootstrap/)
- **Datepicker**: Datepicker for Bootstrap, Copyright 2012 Stefan Petre, Improvements by Andrew Rowls, Licensed under the Apache License v2.0
Copyright 2013 Raúl Gomis
follow @rgomis

</markdown:renderHtml>
</section>
</div>
</body>

</html>