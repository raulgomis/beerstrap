<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'file.label', default: 'File')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <parameter name="menu_FileUploader" value="active" />
</head>
<body>

    <div class="page-header">
        <h1><i class="icon-briefcase"></i>${entityName} management <small><g:message code="default.create.label" args="[entityName]" /></small></h1>
    </div>

<%--
<g:form action="upload" method="POST" enctype="multipart/form-data">
    <input id="fileupload2" type="file" name="files[]" data-url="fileupload" multiple>
    <button class="btn">Upload</button>
</g:form>
 --%>

<input id="fileupload" type="file" name="files[]" data-url="fileupload" multiple>
<div id="progress">
    <div class="bar" style="width: 0%;height: 18px;background: green;"></div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<h2>Docs</h2>
<div id="raul">
    Loading...
</div>

<script>
    $(function () {
        $.ajax({
            url: "${createLink(action:"ajaxGetFiles")}"
            }).done(function(data) {
                $('#raul').html('');
                $.each(data, function (index, file) {
                    $('<p/>').text(file.name + " ("+file.size+")").appendTo("#raul");
                });
        });

        $('#fileupload').fileupload({
            dataType: 'json',
            done: function (e, data) {
                $.each(data.result, function (index, file) {
                    $('<p/>').text(file.name + " ("+file.size+")").appendTo("#raul");
                });
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .bar').css(
                        'width',
                        progress + '%'
                );
            }
        });
    });
</script>


</body>
</html>
