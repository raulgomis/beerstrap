
<div class="row">
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


<h2>Controllers (${grailsApplication.controllerClasses.size()})</h2>
<table class="table table-condensed">
    <thead>
    <tr>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
        <tr>
            <td>
                <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>


<h2>Domain classes (${grailsApplication.domainClasses.size()})</h2>
<table class="table table-condensed">
    <thead>
        <tr>
            <th>Name</th>
            <th>Code generation</th>
        </tr>
    </thead>
    <tbody>
          <g:each in="${grailsApplication.domainClasses.sort {it.shortName}}" var="domainClass">
              <tr>
                  <td><strong>${domainClass.shortName}</strong> (${domainClass.fullName})</td>
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


<h2>Controllers (${grailsApplication.serviceClasses.size()})</h2>
<table class="table table-condensed">
    <thead>
    <tr>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="c" in="${grailsApplication.serviceClasses.sort { it.fullName } }">
        <tr>
            <td>
                ${c.fullName}
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
