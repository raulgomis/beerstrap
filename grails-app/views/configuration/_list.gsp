<g:if test="${configurationInstanceList}">
<table class="table" cellpadding="0" cellspacing="0" summary="configuration table">
  <thead>
    <tr>
   		<th></th>
    	<th></th>
    </tr>
  </thead>
  <tbody>
    <g:each in="${configurationInstanceList}" status="i" var="configurationInstance">
      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
        <td><strong><g:message code="app.configuration.${configurationInstance?.key}.label" default="${configurationInstance?.key}" /></strong></td>
        <td>
        	<g:textField name="${configurationInstance?.key}" value="${configurationInstance?.value}" />
        	<g:message code="app.configuration.${configurationInstance?.key}.description" default="-- No description --" />
        </td>
      </tr>
    </g:each>
  </tbody>
</table>
</g:if>