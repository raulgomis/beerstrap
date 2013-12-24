<!DOCTYPE html>
<html>
<head>
    <title>Grails Runtime Exception</title>
    <meta name="layout" content="error">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'app-errors.css')}" type="text/css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1>
                    Oops!</h1>
                <h2>
                    404 Not Found</h2>
                <div class="error-details">
                    Sorry, an error has occured, Requested page not found!
                </div>
                <div class="error-actions">
                    <g:link controller="home" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span> Take Me Home </g:link>
                    <g:link controller="home" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-envelope"></span> Contact Support </g:link>
                </div>
            </div>
        </div>
    </div>
</div>

<g:renderException exception="${exception}" />
</body>
</html>
