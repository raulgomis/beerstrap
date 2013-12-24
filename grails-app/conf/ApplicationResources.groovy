modules = {

    jquery {
        resource url:'js/jquery/jquery-2.0.3.min.js'
    }

    application {
        dependsOn 'jquery'
        resource url:'css/bootstrap-overrides.css'
        resource url:'css/app.css'
        resource url:'css/app-boxes.css'
        resource url:'js/ajax.js'
        resource url:'css/google-font.css'
    }

    login {
        resource url:'css/bootstrap/css/bootstrap.min.css'
        resource url:'css/bootstrap/css/bootstrap-theme.min.css'
        resource url:'css/app-login.css'
    }

    error {
        resource url:'css/bootstrap/css/bootstrap.min.css'
        resource url:'css/bootstrap/css/bootstrap-theme.min.css'
        resource url:'css/app-errors.css'
    }

    publicpart {
        dependsOn 'jquery'
        resource url:'css/bootstrap/css/bootstrap.min.css'
        resource url:'css/app-public.css'
        //resource url:'css/bootstrap/css/bootstrap-theme.min.css'
        resource url:'css/bootstrap/js/bootstrap.min.js'
        resource url:'css/fontawesome/css/font-awesome.min.css'
    }

    jquerycookie {
        dependsOn 'jquery'
    }

    init {
        dependsOn 'jquery'
        resource url:'js/init.js'
        resource url:'js/jquery/jquery.cookie.js'
    }

    bootstrap {
        dependsOn 'jquery'
        resource url:'css/bootstrap/css/bootstrap.min.css'
        //resource url:'css/bootstrap/css/bootstrap-theme.min.css'
        resource url:'https://raw.github.com/jharding/typeahead.js-bootstrap.css/master/typeahead.js-bootstrap.css'
        resource url:'css/bootstrap/js/bootstrap.min.js'
        resource url:'http://twitter.github.com/typeahead.js/releases/latest/typeahead.min.js'
    }

    fontawesome {
        resource url:'css/fontawesome/css/font-awesome.min.css'
    }

    datepicker {
        resource url:'js/bootstrap-datepicker/css/datepicker.css'
        resource url:'js/bootstrap-datepicker/js/bootstrap-datepicker.js'
    }

    select2 {
        resource url:'js/select2/select2.css'
        resource url:'js/select2/select2-bootstrap.css'
        resource url:'js/select2/select2.js'

    }

    d3js {
        resource url:'js/graph/d3.v3.min.js'
        resource url:'js/d3-setup.js'
    }

    peity {
        resource url:'js/graph/jquery.peity.min.js'
        resource url:'js/graph/jquery.knob.js'
        resource url:'js/graph/jquery.flot.min.js'
    }

    jqueryfileuploader {
        resource url:'js/jquery-file-uploader/css/jquery.fileupload-ui.css'
        resource url:'js/jquery-file-uploader/js/vendor/jquery.ui.widget.js'
        resource url:'js/jquery-file-uploader/js/jquery.iframe-transport.js'
        resource url:'js/jquery-file-uploader/js/jquery.fileupload.js'
        //resource url:'js/jquery-file-uploader/js/jquery.fileupload-ui.js'
    }

    //For prototyping
    holder {
        resource url:'js/holder.js'
    }

    toastr {
        resource url:'js/toastr/toastr.min.css'
        resource url:'js/toastr/toastr.min.js'
    }

}
