<%@ page import="com.app.domain.repository.Document" %>

<div class="form-group ${hasErrors(bean: documentInstance, field: 'file', 'error')} ">
    <label class="control-label" for="file">
        <g:message code="document.file.label" default="File" />
    </label>
    <input type="file" name="file" id="file" class="form-control" />
</div>

<div class="form-group ${hasErrors(bean: documentInstance, field: 'title', 'error')} ">
    <label class="control-label" for="title">
        <g:message code="document.title.label" default="Title" />
    </label>
    <g:textField name="title" value="${documentInstance?.title}" class="form-control"/>
</div>

<div class="form-group ${hasErrors(bean: documentInstance, field: 'category', 'error')} ">
    <label class="control-label" for="category">
        <g:message code="document.category.label" default="Category" />
    </label>
    <g:select name="category" from="${com.app.domain.repository.DocumentCategory?.values()}"
              keys="${com.app.domain.repository.DocumentCategory.values()*.name()}" value="${documentInstance?.category?.name()}" noSelection="['': '']"/>
</div>

<div class="form-group ${hasErrors(bean: documentInstance, field: 'description', 'error')} ">
    <label class="control-label" for="description">
        <g:message code="document.description.label" default="Description" />
    </label>
    <g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${documentInstance?.description}" class="form-control"/>
</div>
