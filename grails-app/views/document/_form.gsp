<%@ page import="com.app.domain.repository.Document" %>

<div class="control-group ${hasErrors(bean: documentInstance, field: 'file', 'error')} ">
    <label class="control-label" for="file">
        <g:message code="document.file.label" default="File" />
    </label>
    <div class="controls">
        <input type="file" name="file" id="file" />
    </div>
</div>

<div class="control-group ${hasErrors(bean: documentInstance, field: 'title', 'error')} ">
    <label class="control-label" for="title">
        <g:message code="document.title.label" default="Title" />

    </label>
    <div class="controls">
        <g:textField name="title" value="${documentInstance?.title}"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: documentInstance, field: 'category', 'error')} ">
    <label class="control-label" for="category">
        <g:message code="document.category.label" default="Category" />
    </label>
    <div class="controls">
        <g:select name="category" from="${com.app.domain.repository.DocumentCategory?.values()}" keys="${com.app.domain.repository.DocumentCategory.values()*.name()}" value="${documentInstance?.category?.name()}" noSelection="['': '']"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: documentInstance, field: 'description', 'error')} ">
    <label class="control-label" for="description">
        <g:message code="document.description.label" default="Description" />
    </label>
    <div class="controls">
        <g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${documentInstance?.description}"/>
    </div>
</div>
