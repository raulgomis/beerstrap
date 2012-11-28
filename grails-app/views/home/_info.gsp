
        

				
        <div class="row">
          <div class="span12">
			<div id="page-body" role="main">

				<h2>Welcome to Grails Bootstrap</h2>
				<p>Congratulations, you have successfully started your first Grails application! At the moment
				   this is the default page, feel free to modify it to either redirect to a controller or display whatever
				   content you may choose. Below is a list of controllers that are currently deployed in this application,
				   click on each to execute its default action:</p>
	
				<div id="controller-list" role="navigation">
					<h2>Available Controllers:</h2>
					<ul>
						<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
						</g:each>
					</ul>
				</div>
			</div>
          </div>
          <div class="span4">
			<div id="status" role="complementary">
				<h2>Application Status</h2>
				<ul>
					<li>App version: <g:meta name="app.version"/></li>
					<li>Grails version: <g:meta name="app.grails.version"/></li>
					<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
					<li>JVM version: ${System.getProperty('java.version')}</li>
					<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
					<li>Domains: ${grailsApplication.domainClasses.size()}</li>
					<li>Services: ${grailsApplication.serviceClasses.size()}</li>
					<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
				</ul>
				<h2>Installed Plugins</h2>
				<ul>
					<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
						<li>${plugin.name} - ${plugin.version}</li>
					</g:each>
				</ul>
			</div>
          </div>
        </div>