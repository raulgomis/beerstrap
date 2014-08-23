function updateDatepicker() {
    $('input[datadatepicker]').datepicker({
        format: 'dd/mm/yyyy', autoclose: "true", language: "es"
    }).on('show', function (ev) {
        var today = new Date();
        var t = today.getDate() + "/" + today.getMonth() + "/" + today.getFullYear();
        $('input[datadatepicker]').data({ date: today }).datepicker('update');
    });
}