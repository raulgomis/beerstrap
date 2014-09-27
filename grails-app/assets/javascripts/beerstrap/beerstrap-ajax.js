jQuery(document).ready(function () {
    $("a.btn-ajax").click(function (event) {
        event.preventDefault();
        var link = jQuery(this);
        var href = link.attr("href");
        $.ajax({
            type: 'GET',
            url: href,
            success: function (data) {
                $('#modal-general').html(data)
            }
        });
    });
});