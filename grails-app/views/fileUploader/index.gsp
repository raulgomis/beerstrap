<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <parameter name="menu_FileUploader" value="active" />
</head>
<body>

    <div class="page-header">
        <h1><i class="icon-briefcase"></i>${entityName} management <small><g:message code="default.create.label" args="[entityName]" /></small></h1>
    </div>
    <div class="row rowbar">
        <div class="span6">
            <div id="search_bar" class="rowbar-left pull-left">
                <g:form action="list" class="form-inline" method="GET">
                    <div class="input-append">
                        <g:textField name="q" placeholder="Text to search" value="${params.q}" elementId="appendedInputButton" class="span3" />
                        <button class="btn" type="submit">Search</button>
                    </div>
                </g:form>
            </div>
        </div>
        <div class="span6">
            <div id="options_bar" class="rowbar-right pull-right">
                <a href="#myModal" class="btn btn-success" data-toggle="modal">
                    <i class="icon-plus icon-white"></i>
                    <g:message code="default.button.upload.label" args="[entityName]" />
                </a>
            </div>
        </div>
    </div>


<!-- Modal Upload -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Upload your files</h3>
    </div>
    <div class="modal-body">
        <div id="progress" class="progress">
            <div class="bar" style="width: 0%;height: 18px"></div>
        </div>
        <table id="fileUploader" class="table table-bordered table-condensed"></table>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <span class="btn btn-primary fileinput-button">
            <i class="icon-plus icon-white"></i>
            <span>Add files...</span>
            <input id="fileupload" type="file" name="files[]" data-url="fileupload" multiple>
        </span>
    </div>
</div>



<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

<h2>Docs</h2>
<div id="fileContainer">
    Loading...
</div>


<script>
    $(function () {
        $.ajax({
            url: "${createLink(controller:"fileUploader",action:"ajaxGetFiles")}"
            }).done(function(data) {
                $('#fileContainer').html('');
                $.each(data, function (index, file) {
                    $('<p/>').text(file.name + " ("+file.size+")").appendTo("#fileContainer");
                });
        });

        $('#fileupload').fileupload({
            dataType: 'json',
            //maxFileSize: 5000000,       //5MB
            //acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,

            add: function (e, data) {
                $.each(data.files, function (index, file) {
                    $('#fileUploader').append('<tr data-file="'+file.name+'"><td>'+file.name + ' ('+file.size+')'+'</td></tr>');
                    //data.context = $('#fileUploader').append('<tr data-file="'+file.name+'"><td>'+file.name + ' ('+file.size+')'+'</td></tr>');
                });
                data.submit();
            },
            /*send: function (e, data) {
                if (data.context && data.dataType && data.dataType.substr(0, 6) === 'iframe') {
                     // Iframe Transport does not support progress events.
                     // In lack of an indeterminate progress bar, we set
                     // the progress to 100%, showing the full animated bar:
                     data.context
                     .find('.progress').addClass(
                     !$.support.transition && 'progress-animated'
                     )
                     .attr('aria-valuenow', 100)
                     .find('.bar').css(
                     'width',
                     '100%'
                     );
                 }
            },*/
            done: function (e, data) {
                /*
                if (data.context) {
                    data.context.each(function (index) {
                        var file = files[index]
                        alert(file);
                        data.context
                                .addClass('success')
                                .html('<td>'+file.name + ' ('+file.size+')'+'<span class="pull-right"><i class="icon-ok"></i></span></td>')
                    }
                }
                else {
                    $.each(data.result, function (index, file) {
                        $('#fileUploader tr[data-file="'+file.name+'"]')
                                .addClass('success')
                                .html('<td>'+file.name + ' ('+file.size+')'+'<span class="pull-right"><i class="icon-ok"></i></span></td>')

                    });
                }
                */
                $.each(data.result, function (index, file) {
                    $('#fileUploader tr[data-file="'+file.name+'"]')
                        .addClass('success')
                        .html('<td>'+file.name + ' ('+file.size+')'+'<span class="pull-right"><i class="icon-ok"></i></span></td>')

                });
            },
            /*progress: function (e, data) {

                if (data.context) {

                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    data.context.find('.progress')
                            .attr('aria-valuenow', progress)
                            .find('.bar').css(
                                    'width',
                                    progress + '%'
                            );
                }
            }, */
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress')
                    .attr('aria-valuenow', progress)
                    .find('.bar').css(
                            'width',
                            progress + '%'
                    );
            }

        });
        /*
        $('#fileupload').fileupload('option', {
            maxFileSize: 5000000,       //5MB
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
        });
         */

    });

</script>


<%--
<g:form action="upload" method="POST" enctype="multipart/form-data">
    <input id="fileupload2" type="file" name="files[]" data-url="fileupload" multiple>
    <button class="btn">Upload</button>
</g:form>
 --%>
<%--
<div class="row fileupload-buttonbar">
    <div class="span7">
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="btn btn-success fileinput-button">
            <i class="icon-plus icon-white"></i>
            <span>Add files...</span>
            <input type="file" name="files[]" multiple="">
        </span>
        <button type="submit" class="btn btn-primary start">
            <i class="icon-upload icon-white"></i>
            <span>Start upload</span>
        </button>
        <button type="reset" class="btn btn-warning cancel">
            <i class="icon-ban-circle icon-white"></i>
            <span>Cancel upload</span>
        </button>
        <button type="button" class="btn btn-danger delete">
            <i class="icon-trash icon-white"></i>
            <span>Delete</span>
        </button>
        <input type="checkbox" class="toggle">
    </div>
    <!-- The global progress information -->
    <div class="span5 fileupload-progress fade">
        <!-- The global progress bar -->
        <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
            <div class="bar" style="width:0%;"></div>
        </div>
        <!-- The extended global progress information -->
        <div class="progress-extended">&nbsp;</div>
    </div>
</div>
  --%>


</body>
</html>
