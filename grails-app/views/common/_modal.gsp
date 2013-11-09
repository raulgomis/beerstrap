<div class="modal fade" id="modal-general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><g:message code="app.default.loading.label"/></h4>
            </div>

            <div class="modal-body">
                <p><g:img dir="images" file="loading-small.gif"></g:img></p>
            </div>

            <div class="modal-footer">
                <a class="btn btn-primary" href="#"
                   onclick="javascript:document.formdialog.submit();"><g:message code="app.default.dialog.accept.label"/></a> <a
                    class="btn btn-default" href="#"
                    onclick="javascript:jQuery('#modal-general').modal('hide')"><g:message code="app.default.dialog.cancel.label"/></a>
            </div>
        </div>
    </div>
</div>
