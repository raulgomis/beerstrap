$(function () {
    // Twitter bootstrap: Popover ---------
    $("a[rel=popover]")
          .popover({
              offset: 10,
              trigger: 'hover'
          })
          .click(function (e) {
              e.preventDefault()
          });

    // Twitter bootstrap: Tooltip ---------
    $("a[rel=tooltip], span[rel=tooltip]").tooltip({
        placement: 'top'
    });

    // Twitter bootstrap: Datepicker ---------
    $('input[datadatepicker]').datepicker({
        format: 'yyyy/mm/dd', autoclose: "true", language: "en"
    }).on('show', function (ev) {
        var today = new Date();
        var t = today.getDate() + "/" + today.getMonth() + "/" + today.getFullYear();
        $('input[datadatepicker]').data({ date: today }).datepicker('update');
    });

    // Tab cookie (Bootstrap tab) -------------------
    $('a[data-toggle="tab"]').on('shown', function (e) {
        //save the latest tab using a cookie:
        $.cookie('last_tab', $(e.target).attr('href'));
    });
    var lastTab = $.cookie('last_tab');
    if (lastTab) {
        $('ul.nav-tabs').children().removeClass('active');
        $('a[href=' + lastTab + ']').parents('li:first').addClass('active');
        $('div.tab-content').children().removeClass('active');
        $(lastTab).addClass('active');
    }

    // Select2 -------------------
    $('select').select2({ /*width: 'resolve'*/ });

    // Peity -------------------
    $(".pbar").peity("bar", {
        colours: ["#EA494A"],
        strokeWidth: 4,
        height: 32,
        max: null,
        min: 0,
        spacing: 4,
        width: 58
    });

    // Knob -------------------
    $(".dial").knob();

    // Tiny MCE -------------------
    tinymce.init({
        selector: ".tiny"
    });
});




