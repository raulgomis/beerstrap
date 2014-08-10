jQuery(function () {
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
    $(".dial").knob({});
});

// Tiny MCE -------------------
tinyMCE.init({
    mode: "textareas",
    theme: "advanced",
    editor_selector: "tiny",
    plugins: "paste",
    theme_advanced_buttons1: "bold,italic,underline,strikethrough,link,|,justifyleft,justifycenter,justifyright,justifyfull,|,pastetext,pasteword,",
    theme_advanced_buttons2: "",
    theme_advanced_buttons3: "",
    theme_advanced_buttons4: "",
    theme_advanced_toolbar_location: "top",
    theme_advanced_toolbar_align: "left",
    theme_advanced_statusbar_location: "bottom",
    theme_advanced_resize_horizontal: false,
    width: '100%',
    theme_advanced_resizing_min_height : 300,
    theme_advanced_resizing: false
});




