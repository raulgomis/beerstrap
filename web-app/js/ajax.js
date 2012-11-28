jQuery(document).ready(function () {

    jQuery('#button-ajax').click(function (event) {
        event.preventDefault();
        var link = jQuery(this);
        var href = link.attr("href")
        $.ajax({
            type: 'GET',
            url: href,
            success: function (data) {
                $('#modal-general').html(data)
            }
        });
    });

    jQuery("a.button-ajax").click(function (event) {
        event.preventDefault();
        var link = jQuery(this);
        var href = link.attr("href")
        $.ajax({
            type: 'GET',
            url: href,
            success: function (data) {
                $('#modal-general').html(data)
            }
        });
    });

});