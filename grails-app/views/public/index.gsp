<html>

<head>
    <meta name="layout" content="public" />
    <parameter name="menu_Home" value="active" />
</head>
<body>
    <div class="jumbotron">
        <h1>
            <bs:config key="${com.app.configuration.ConfigurationManager.BT_SITE_NAME}" />
        </h1>
        <p class="lead"><strong>Startup project designed to ease and accelerate software development.</strong><br> Ideal for startups and web developers who want to rapid-prototype
        and develop products within weeks without wasting time in configurations and boring stuff. <br> Software development never has been so fast!</p>
        <g:link class="btn btn-lg btn-success" controller="home">Get started now</g:link>
        <g:link class="btn btn-lg btn-info" controller="home"><i class="fa fa-github"></i>GitHub project</g:link>
    </div>

    <hr>

    <section id="why" class="clearfix">
        <div class="row">
            <div class="col-md-4">
                <h2>
                    <i class="icon-dashboard"></i> Productivity
                </h2>
                <p><strong>Don't waste your time</strong> in common stuff such as configuring your project: just focus on the specific ENGINEERING SOLUTION! Download it and start to develop. Start from a good base: Security ready, Testing ready, Beautiful UI, Code generation, etc.</p>
            </div>
            <div class="col-md-4">
                <h2>
                    <i class="icon-magic"></i> Code generation
                </h2>
                <p><strong>Best scaffolding templates</strong> for rapid prototyping. Generate
                    CRUD functionality based on client's requirements and show a
                    functional version to your client within 15 minutes.</p>
            </div>
            <div class="col-md-4">
                <h2>
                    <i class="icon-money"></i> Money, money...
                </h2>
                <p>Grails bootstrap will <strong>give you money</strong> (Yes, you heard right!): save more than 1500$ each time you start a project. It is the money it would cost to develop the features presented in Grails Bootstrap.</p>
            </div>
        </div>
    </section>

    <hr>

    <section id="features" class="clearfix">
        <h2 class="page-header">Features</h2>
        <div class="row">
            <div class="col-md-3">
                <h4>
                    <i class="icon-magic"></i> Scaffolding templates
                </h4>
                <p>Scaffolding templates to generate code that the application can use to create, read, update and delete database entries.</p>
            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-group"></i> User management
                </h4>
                <p>User management is already implemented, manage users from the first second.</p>
            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-lock"></i> Security ready
                </h4>
                <p>Don't waste your time configuring and programming security basic stuff: Grails bootstrap is already secured.
                    <a href="http://grails.org/plugin/spring-security-core">Spring Security Core</a>
                </p>

            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-user"></i> User registration
                </h4>
                <p>User registration and password reminder is already implemented. Why should developers do it in every web application?</p>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-3">
                <h4>
                    <i class="icon-cog"></i> Configuration
                </h4>
                <p>Ready to define configuration options from database. Every application should have global variables to configure.</p>
            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-beaker"></i> Made with Grails
                </h4>
                <p>It's been implemented using <a href="http://twitter.github.com/bootstrap/">Grails 2.2.4</a>: a rapid, dynamic & robust
                    framework which uses the Groovy programming language (based on the Java platform).
                </p>
            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-share-alt"></i> Easy ajax
                </h4>
                <p>Well structured way to make ajax calls and modals with little code. See docs for more information about how to do it.</p>
            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-eye-open"></i> User interface
                </h4>
                <p>Catching user's eye with a extremely good looking interface using <a href="http://twitter.github.com/bootstrap/">Twitter bootstrap 2.3.2</a> and <a href="http://fortawesome.github.com/Font-Awesome/">Font awesome 3.2.1</a>.</p>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-3">
                <h4>
                    <i class="icon-envelope-alt"></i> Email sending
                </h4>
                <p>Grails bootstrap comes with a structured way to send emails. Configure your credentials and start sending emails to the users.</p>
            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-flag"></i> I18N ready
                </h4>
                <p>Grails bootstrap has it own core translated into English and Spanish. Help us translate it into your own language.</p>
            </div>

            <div class="col-md-3">
                <h4>
                    <i class="icon-tasks"></i> File management <small></small>
                </h4>
                <p>
                    Upload your files using a dropbox-style file uploader via AJAX and manage them with a fully-featured interface.
                </p>
            </div>
        </div>
    </section>

    <hr>

    <section id="roadmap" class="clearfix">
        <h2 class="page-header">Roadmap</h2>

        <div class="row">
            <div class="col-md-3">
                <h4>
                    <i class="icon-copy"></i> Documentation <small>Coming soon!</small>
                </h4>
                <p>
                    Documentation is one key to success. The more documented and easier Grails Bootstrap is to use, the more productive you will be at work.
                </p>
            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-thumbs-up"></i> Testing <small>Coming soon!</small>
                </h4>
                <p>
                    Using <a href="http://www.spockframework.org">Spock Framework</a> to test and
                also the great plugins <a href="http://grails.org/plugin/build-test-data">Build test data</a>, <a href="http://grails.org/plugin/fixtures">Fixtures</a> and <a href="http://grails.org/plugin/code-coverage">Code Coverage</a> to ease this testing process.
                </p>
            </div>
            <div class="col-md-3">
                <h4>
                    <i class="icon-puzzle-piece"></i> Rest <small>Coming soon!</small>
                </h4>
                <p>
                    Create rest interfaces easily (scaffolding for rest) is one of our priorities in Grails Bootstrap, using <a href="http://jackson.codehaus.org/">Jackson</a> library.
                </p>
            </div>

            <div class="col-md-3">
                <h4>
                    <i class="icon-magic"></i> More Scaffolding
                </h4>
                <p>Scaffolding is a very powerful tool if it is used in the right way. We will add <a href="http://grails.org/plugin/fields">Fields plugin</a> and try to improve the
                scaffolding with code generation techniques</p>
            </div>
        </div>
    </section>

    <hr>

    <section id="testimonials" class="clearfix">
        <h2 class="page-header">Testimonials</h2>
        <div class="well well-large well-transparent">
            <blockquote>
            <p>Use a
            few of the new styles together, and you've got easy pull quotes or a
            great introductory article image. Or spinning icons for loading and
            multi-line buttons. You can combine all of them in any combination to
            get lots of new possibilities.</p>
              <small>Someone famous <cite title="Source Title">Source Title</cite></small>
            </blockquote>
        </div>
        <div class="well well-large well-transparent">
            <blockquote>
            <p>Use a
            few of the new styles together, and you've got easy pull quotes or a
            great introductory article image. Or spinning icons for loading and
            easy pull quotes or a great introductory article image. Or spinning
            icons for loading and refreshing content. Or fun big icons in
            multi-line buttons. You can combine all of them in any combination to
            get lots of new possibilities.</p>
              <small>Someone famous <cite title="Source Title">Source Title</cite></small>
            </blockquote>
        </div>
    </section>

</body>

</html>