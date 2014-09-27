function updateDatepicker() {
    $('input[datadatepicker]').datepicker({
        format: 'dd/mm/yyyy', autoclose: "true", language: "es"
    }).on('show', function () {
        var today = new Date();
        $('input[datadatepicker]').data({ date: today }).datepicker('update');
    });
}