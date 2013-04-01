


jQuery(function () {


    //Twitter bootstrap ---------
    $("a[rel=popover]")
          .popover({
              offset: 10,
              trigger: 'hover'
          })
          .click(function (e) {
              e.preventDefault()
          });

    /*$(".btn").attr('data-loading-text', 'Cargando...');

    $("button[data-loading-text]").click(function () {
        $(this).button('loading')
    });*/

    $("a[rel=tooltip], span[rel=tooltip]").tooltip({
        placement: 'top'
    });
    
    $('input[datadatepicker]').datepicker({
        format: 'yyyy/mm/dd', autoclose: "true", language: "en"
    })
    .on('show', function (ev) {
        var today = new Date();
        var t = today.getDate() + "/" + today.getMonth() + "/" + today.getFullYear();
        $('input[datadatepicker]').data({ date: today }).datepicker('update');
    });



    // ------------------- TAB COOKIE
    $('a[data-toggle="tab"]').on('shown', function (e) {
        //save the latest tab using a cookie:
        $.cookie('last_tab', $(e.target).attr('href'));
    });

    //activate latest tab, if it exists:
    var lastTab = $.cookie('last_tab');
    if (lastTab) {
        $('ul.nav-tabs').children().removeClass('active');
        $('a[href=' + lastTab + ']').parents('li:first').addClass('active');
        $('div.tab-content').children().removeClass('active');
        $(lastTab).addClass('active');
    }
    // ------------------- FIN TAB COOKIE

    $('select').select2({ width: 'resolve' });

    $(".pbar").peity("bar", {
        colours: ["#EA494A"],
        strokeWidth: 4,
        height: 32,
        max: null,
        min: 0,
        spacing: 4,
        width: 58
    });

    $(".dial").knob();

	if($("#activeUsers").length) {
	    var d1 = [];
	    
	    for (var i = 0; i <= 160; i += 1) {
	        d1.push([i, parseInt(Math.random() * 123123)]);
		}	

	    var stack = 0, bars = true, lines = false, steps = false;

	    function plotWithOptions2() {
					
	        $.plot($("#activeUsers"), [ d1 ], {
	            series: {
	                bars: { show: bars, 
							fill: true, 
							barWidth: 0.1, 
							align: "center",
							lineWidth: 5,
							fillColor: { colors: [ { opacity: 1 }, { opacity: 0.5 } ] }
						}
	            },
				grid: { hoverable: true, 
						   clickable: true, 
						   tickColor: "#f6f6f6",
						   borderWidth: 0
						},
				colors: ["#CBE968"],
				xaxis: {ticks:0, tickDecimals: 0, tickFormatter: function(v, a) {return v }},
				yaxis: {ticks:5, tickDecimals: 0, tickFormatter: function (v) { return v }}
	        });
	    }
	
	    plotWithOptions2();

	}
	
	
});



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



    function updateDatepicker() {
        $('input[datadatepicker]').datepicker({
            format: 'dd/mm/yyyy', autoclose: "true", language: "es"
        }).on('show', function (ev) {
             var today = new Date();
             var t = today.getDate() + "/" + today.getMonth() + "/" + today.getFullYear();
             $('input[datadatepicker]').data({ date: today }).datepicker('update');
         });
    }




