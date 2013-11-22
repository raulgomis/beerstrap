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

### 2. Requirements
**Grails Boostrap** is based in Grails.

- [Grails](http://grails.org): Grails is an Open Source, full stack, web application framework for the JVM. It takes advantage of the Groovy programming language and convention
over configuration to provide a productive and stream-lined development experience.
- [JDK](http://www.oracle.com/technetwork/es/java/javase/downloads/index.html): Grails runs on the JVM, so you will need the latest JDK 1.6 or JDK 1.7 to use it.

### 3. Getting started
It is very easy to start to develop with **Grails Boostrap**, that's the key of the tool. Download it and start to develop within minutes.

<pre>
git clone https://url.com
grails run-app
</pre>
And you will be able to access to [http://localhost:8080](http://localhost:8080) and see the public website.
### 4. Develop
There are three main IDEs that have good integration with Grails:

- [Intellij-IDEA](http://www.jetbrains.com/idea/features/groovy.html)
- [Eclipse (ggts)](http://spring.io/tools/ggts)
- [Netbeans](https://netbeans.org/kb/docs/web/grails-quickstart.html)

### 5. Terms of use
- **Web Layout**: Bootstrap 2.3.2, from Twitter Licensed under the Apache License v2.0. Documentation licensed under CC BY 3.0. (@TwBootstrap , http://twitter.github.com/bootstrap/)
- **Datepicker**: Datepicker for Bootstrap, Copyright 2012 Stefan Petre, Improvements by Andrew Rowls, Licensed under the Apache License v2.0
Copyright 2013 Raúl Gomis
follow @rgomis
</markdown:renderHtml>
</section>
</div>
</body>

</html>