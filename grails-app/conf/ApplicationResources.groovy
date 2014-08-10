modules = {

    jquery {
        resource url:'js/jquery/jquery-2.0.3.min.js'
    }

    application {
        dependsOn 'jquery,bootstrap,fontawesome,datepicker,select2,graphs,jqueryfileuploader,holder,toastr,beerstrap'
    }

    beerstrap {
        resource url:'css/beerstrap-bootstrap-overrides.css'
        resource url:'css/beerstrap.css'
        resource url:'css/beerstrap-boxes.css'

        resource url:'js/beerstrap-init.js'
        resource url:'js/beerstrap-utils.js'
        resource url:'js/beerstrap-ajax.js'
        resource url:'js/jquery/jquery.cookie.js'
    }

    login {
        dependsOn 'fontawesome'
        resource url:'css/bootstrap/css/bootstrap.min.css'
        resource url:'css/bootstrap/css/bootstrap-theme.min.css'
        resource url:'css/beerstrap-login.css'
    }

    error {
        resource url:'css/bootstrap/css/bootstrap.min.css'
        resource url:'css/bootstrap/css/bootstrap-theme.min.css'
        resource url:'css/beerstrap-errors.css'
    }

    bootstrap {
        dependsOn 'jquery'
        resource url:'css/bootstrap/css/bootstrap.min.css'
        resource url:'css/bootstrap/js/bootstrap.min.js'
        resource url:'js/typeahead/typeahead.bundle.min.js'
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

    graphs {
        resource url:'js/graph/d3.v3.min.js'
        resource url:'js/graph/d3-stacked-graph.js'
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
