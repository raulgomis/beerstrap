<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="public" />
<title>Password recovery</title>
</head>
<body>

    <h2 class="section_header">
        <span><i class="icon-info-sign"></i> Password recovery <small> Have you forgot your
                password? Recover it within seconds</small>
        </span>
        <hr class="right visible-desktop">
    </h2>

    <g:hasErrors bean="${command}">
        <div class="alert alert-block alert-error" data-alert="alert">
            <a class="close" href="#" data-dismiss="alert">×</a>
            <p>
                <strong>Oh snap! You got an error!</strong> Change this and that and try again.
            </p>
            <g:renderErrors bean="${command}" as="list" />
        </div>
    </g:hasErrors>

    <g:form action="forgotPassword" class="form-horizontal">

        <div class="control-group">
            <label class="control-label" for="email">Email</label>
            <div class="controls">
                <input type="text" name="email" placeholder="Email"
                    value="${command?.email }" />
            </div>
        </div>

        <div class="form-actions">
            <button class="btn btn-primary">Send</button>
        </div>
    </g:form>

</body>
</html>