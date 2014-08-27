<html>

<head>
    <meta name="layout" content="login">
    <title><g:message code="app.security.register.title"/></title>
</head>

<body>
<div class="container">
    <h2 class="section_header">
        <i class="fa fa-sign-in"></i> <g:message code="app.security.register.title"/> <small><g:message
            code="app.security.register.description"/></small>
        <hr class="right visible-desktop">
    </h2>

    <g:if test="${flash.success}">
        <div class="alert alert-block alert-danger">${flash.success}</div>
    </g:if>
    <g:if test="${flash.message}">
        <div class="alert alert-block alert-danger">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="alert alert-block alert-danger">${flash.error}</div>
    </g:if>

    <g:hasErrors bean="${command}">
        <div class="alert alert-block alert-danger">
            <a class="close" href="#">×</a>

            <p>
                <strong>Oh snap! You got an error!</strong> Change this and that and try again.
            </p>
            <g:renderErrors bean="${command}" as="list"/>
        </div>
    </g:hasErrors>

    <div class="form-register">
        <g:form action="register" class="form-vertical">
            <div class="form-group">
                <label class="control-label" for="name"><g:message code="app.registerCommand.name.label"/></label>
                <div class="controls">
                    <g:textField type="text" name="name" placeholder="${message(code: 'app.registerCommand.name.label')}" class="form-control"
                           value="${command?.name}"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label" for="username"><g:message code="app.registerCommand.username.label"/></label>
                <div class="controls">
                    <g:textField type="text" name="username" class="form-control"
                           placeholder="${message(code: 'app.registerCommand.username.label')}"
                           value="${command?.username}"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label" for="email"><g:message code="app.registerCommand.email.label"/></label>
                <div class="controls">
                    <g:textField type="text" name="email" placeholder="${message(code: 'app.registerCommand.email.label')}" class="form-control"
                           value="${command?.email}"/>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label" for="password"><g:message code="app.registerCommand.password.label"/></label>
                <div class="controls">
                    <g:field type="password" name="password" class="form-control"
                           placeholder="${message(code: 'app.registerCommand.password.label')}"
                           value="${command?.password}"/>
                </div>
            </div>

            <div class="checkbox">
                <label>
                    <g:checkBox name="terms" value="${true}" checked="${command?.terms}" />
                    <g:message code="app.registerCommand.agree.label"/>
                    <a href="#" role="button" data-toggle="modal" data-target="#modalTerms"><g:message
                            code="app.registerCommand.terms.label"/></a>
                </label>
            </div>

            <div class="form-group form-actions">
                <button type="submit" class="btn btn-primary"><g:message code="app.security.register.submit"/></button>
            </div>
        </g:form>

    </div>

    <!-- Modal Terms and Conditions -->
    <div id="modalTerms" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalTermsLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel"><g:message code="app.registerCommand.terms.label"/></h3>
        </div>

        <div class="modal-body">
            <p><g:message code="app.registerCommand.terms.description"/></p>
        </div>

        <div class="modal-footer">
            <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Close</button>
        </div>
    </div>
</div>
</body>

</html>