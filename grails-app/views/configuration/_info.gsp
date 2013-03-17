
<div class="row">
	<div class="span12">
		<div id="page-body" role="main">

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c"
						in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link
								controller="${c.logicalPropertyName}">
								${c.fullName}
							</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
	</div>
	<div class="span4">
		<div id="status" role="complementary">
			<h2>Application Status</h2>
			<ul>
				<li>App version: <g:meta name="app.version" /></li>
				<li>Grails version: <g:meta name="app.grails.version" /></li>
				<li>Groovy version: ${groovy.lang.GroovySystem.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h2>Installed Plugins</h2>
			<ul>
				<g:each var="plugin"
					in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>
						${plugin.name} - ${plugin.version}
					</li>
				</g:each>
			</ul>
		</div>
	</div>
</div>

<h2>Code generation</h2>
<table class="table">
    <thead>
        <tr>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
          <g:each in="${grailsApplication.domainClasses}" var="domainClass">
              <tr>
                  <td>${domainClass.shortName} (${domainClass.fullName})</td>
                  <td>
                      <g:link action="grailsGenerate" params="['domainClassName':domainClass.fullName,'artifact':'controller']">Controller</g:link> |
                      <g:link action="grailsGenerate" params="['domainClassName':domainClass.fullName,'artifact':'view-create']">Create view</g:link> |
                      <g:link action="grailsGenerate" params="['domainClassName':domainClass.fullName,'artifact':'view-edit']">Edit view</g:link> |
                      <g:link action="grailsGenerate" params="['domainClassName':domainClass.fullName,'artifact':'view-list']">List view</g:link> |
                      <g:link action="grailsGenerate" params="['domainClassName':domainClass.fullName,'artifact':'view-show']">Show view</g:link> |
                      <g:link action="grailsGenerate" params="['domainClassName':domainClass.fullName,'artifact':'view-form']">Form</g:link> |
                      <g:link action="grailsGenerate" params="['domainClassName':domainClass.fullName,'artifact':'view-sidebar']">Sidebar</g:link> |
                      <g:link action="grailsGenerate" params="['domainClassName':domainClass.fullName,'artifact':'test']">Test controller</g:link>
                  </td>
              </tr>
          </g:each>
    </tbody>
</table>