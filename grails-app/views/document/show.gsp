<%@ page import="com.app.domain.repository.Document" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <parameter name="menu_Document" value="active"/>
</head>

<body>

<div class="page-header">
    <h1><i class="fa fa-briefcase"></i> <g:message code="default.management.label" args="[entityName]" /> <small><g:message code="default.show.label" args="[entityName]"/></small></h1>
</div>

<div class="row rowbar">
    <div class="col-md-12">
        <div class="pull-left">
            <g:link class="btn btn-default" action="list">
                <i class="fa fa-th-list"></i>
                <g:message code="default.button.list.label" default="List"/>
            </g:link>
        </div>
        <div class="pull-right">
            <g:form action="delete">
                <g:hiddenField name="id" value="${documentInstance?.id}"/>
                <g:link class="btn btn-default" action="edit" id="${documentInstance?.id}">
                    <i class="fa fa-pencil"></i>
                    <g:message code="default.button.edit.label" default="Edit"/>
                </g:link>
                <button class="btn btn-default" type="submit" name="_action_delete"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                    <i class="fa fa-trash"></i>
                    <g:message code="default.button.delete.label" default="Delete"/>
                </button>
            </g:form>
        </div>
    </div>
</div>

<h2><g:message code="app.document.metadata.label"/></h2>

<table class="table table-striped property-list document">
    <g:if test="${documentInstance?.title}">
        <tr>
            <td><span id="title-label" class="property-label"><g:message code="document.title.label" default="Title"/></span></td>
            <td><span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${documentInstance}" field="title"/></span></td>
        </tr>
    </g:if>

    <g:if test="${documentInstance?.category}">
        <tr>
            <td><span id="category-label" class="property-label"><g:message code="document.category.label" default="Category"/></span></td>
            <td><span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${documentInstance}" field="category"/></span></td>
        </tr>
    </g:if>

    <g:if test="${documentInstance?.description}">
        <tr>
            <td><span id="description-label" class="property-label"><g:message code="document.description.label" default="Description"/></span></td>
            <td><span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${documentInstance}" field="description"/></span></td>
        </tr>
    </g:if>


    <g:if test="${documentInstance?.dateCreated}">
        <tr>
            <td><span id="dateCreated-label" class="property-label"><g:message code="document.dateCreated.label" default="Date Created"/></span></td>
            <td><span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${documentInstance?.dateCreated}"/></span></td>
        </tr>
    </g:if>

    <g:if test="${documentInstance?.lastUpdated}">
        <tr>
            <td><span id="lastUpdated-label" class="property-label"><g:message code="document.lastUpdated.label" default="Last Updated"/></span></td>
            <td><span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${documentInstance?.lastUpdated}"/></span></td>
        </tr>
    </g:if>
    <g:if test="${documentInstance?.uuid}">
        <tr>
            <td><span id="uuid-label" class="property-label"><g:message code="document.uuid.label" default="Uuid"/></span></td>
            <td><span class="property-value" aria-labelledby="uuid-label"><g:fieldValue bean="${documentInstance}" field="uuid"/></span></td>
        </tr>
    </g:if>
    <g:if test="${documentInstance?.downloads != null}">
        <tr>
            <td><span id="downloads-label" class="property-label"><g:message code="document.downloads.label" default="Downloads"/></span></td>
            <td><span class="property-value" aria-labelledby="downloads-label"><g:fieldValue bean="${documentInstance}" field="downloads"/></span></td>
        </tr>
    </g:if>

</table>

<h2><g:message code="app.document.fileInfo.label"/></h2>

<table class="table table-striped property-list document">

    <g:if test="${documentInstance?.originalName}">
        <tr>
            <td><span id="originalName-label" class="property-label"><g:message code="document.originalName.label" default="Original Name"/></span></td>
            <td>
                <span class="property-value" aria-labelledby="originalName-label">
                    <g:link action="download" id="${documentInstance.uuid}">
                        <g:fieldValue bean="${documentInstance}" field="originalName"/>
                    </g:link>
                </span>
            </td>
        </tr>
    </g:if>

    <g:if test="${documentInstance?.name}">
        <tr>
            <td><span id="name-label" class="property-label"><g:message code="document.name.label" default="Name"/></span></td>
            <td><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${documentInstance}" field="name"/></span></td>
        </tr>
    </g:if>

    <g:if test="${documentInstance?.type}">
        <tr>
            <td><span id="type-label" class="property-label"><g:message code="document.type.label" default="Type"/></span></td>
            <td><span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${documentInstance}" field="type"/></span></td>
        </tr>
    </g:if>

    <g:if test="${documentInstance?.size}">
        <tr>
            <td><span id="size-label" class="property-label"><g:message code="document.size.label" default="Size"/></span></td>
            <td>
                <span class="property-value" aria-labelledby="size-label">
                    <bs:byteCountToDisplaySize size="${documentInstance.size}"></bs:byteCountToDisplaySize>
                </span>
            </td>
        </tr>
    </g:if>

    <g:if test="${documentInstance?.extension}">
        <tr>
            <td><span id="extension-label" class="property-label"><g:message code="document.extension.label" default="Extension"/></span></td>
            <td><span class="property-value" aria-labelledby="extension-label"><g:fieldValue bean="${documentInstance}" field="extension"/></span></td>
        </tr>
    </g:if>
</table>

</body>
</html>
