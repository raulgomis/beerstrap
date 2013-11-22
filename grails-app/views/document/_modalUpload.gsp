<!-- Modal Upload -->
<div id="modal-upload" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalUploadLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalUploadLabel"><g:message code="app.default.button.upload.label"/></h4>
            </div>

            <div class="modal-body">
                <div id="progress" class="progress">
                    <div class="progress-bar" style="width: 0%;height: 18px;"></div>
                </div>
                <table id="fileUploader" class="table table-bordered table-condensed"></table>
            </div>

            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true"><g:message code="app.default.dialog.cancel.label"/></button>
                <span class="btn btn-primary fileinput-button">
                    <i class="fa fa-plus"></i>
                    <span><g:message code="app.default.button.addFiles.label"/></span>
                    <input id="fileupload" type="file" name="files[]" data-url="fileupload" multiple>
                </span>
            </div>
        </div>
    </div>
</div>

<r:script>
    $(function () {
        $.ajax({
            url: "${createLink(controller: "document", action: "ajaxGetFiles")}"
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
                });
                data.submit();
            },
            done: function (e, data) {
                $.each(data.result, function (index, file) {
                    $('#fileUploader tr[data-file="'+file.name+'"]')
                            .addClass('success')
                            .html('<td>'+file.name + ' ('+file.size+')'+'<span class="pull-right"><i class="fa fa-check"></i></span></td>')

                });
            },
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
    });

</r:script>