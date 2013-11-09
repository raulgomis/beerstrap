<div class="modal fade" id="modal-general" style="display: none;">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">×</a>
        <h3><g:message code="app.default.loading.label" /></h3>
    </div>
    <div class="modal-body">
        <p><g:img dir="images" file="loading-small.gif"></g:img></p>
    </div>
    <div class="modal-footer">
        <a class="btn btn-primary" href="#"
           onclick="javascript:document.formdialog.submit();"><g:message code="app.default.dialog.accept.label" /></a> <a
            class="btn btn-default" href="#"
            onclick="javascript:jQuery('#modal-general').modal('hide')"><g:message code="app.default.dialog.cancel.label" /></a>
    </div>
</div>