<%=packageName%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <parameter name="menu_${className}" value="active" />
    </head>
    <body>
        <div class="page-header">
            <h1><i class="fa fa-briefcase"></i> \${entityName} management <small><g:message code="default.create.label" args="[entityName]" /></small></h1>
        </div>
        <g:hasErrors bean="\${${propertyName}}">
        <div class="alert alert-message alert-danger" data-alert="alert">
            <a class="close" data-dismiss="alert" href="#">×</a>
            <ul role="alert">
                <g:eachError bean="\${${propertyName}}" var="error">
                <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
                </g:eachError>
            </ul>
        </div>
        </g:hasErrors>

        <g:form action="save" class="form-vertical" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
            <fieldset class="form">
                <g:render template="form"/>
                <div class="form-group form-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-check"></i>
                        <g:message code="default.button.create.label" default="Create" />
                    </button>
                    <g:link class="btn btn-default" action="list">
                        <i class="fa fa-th-list"></i>
                        <g:message code="default.button.list.label" default="List" />
                    </g:link>
                </div>
            </fieldset>
        </g:form>
    </body>
</html>
