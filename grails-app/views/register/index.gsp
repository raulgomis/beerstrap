<html>

<head>
<meta name="layout" content="public">
<title><g:message code="app.security.register.title" /></title>
</head>

<body>

    <h2 class="section_header">
        <i class="fa fa-signin"></i> <g:message code="app.security.register.title" /> <small><g:message code="app.security.register.description" /></small>
        <hr class="right visible-desktop">
    </h2>

    <g:hasErrors bean="${command}">
        <div class="alert alert-block alert-danger">
            <a class="close" href="#">×</a>
            <p>
                <strong>Oh snap! You got an error!</strong> Change this and that and try again.
            </p>
            <g:renderErrors bean="${command}" as="list" />
        </div>
    </g:hasErrors>

    <div class="form-register">
        <g:form action="register" class="form-horizontal">
            <div class="form-group">
                <label class="control-label" for="name"><g:message code="app.registerCommand.name.label"/></label>
                <div class="controls">
                    <input type="text" name="name" placeholder="${message(code:'app.registerCommand.name.label')}"
                        value="${command?.name }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="username"><g:message code="app.registerCommand.username.label"/></label>
                <div class="controls">
                    <input type="text" name="username" placeholder="${message(code:'app.registerCommand.username.label')}"
                        value="${command?.username }" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="email"><g:message code="app.registerCommand.email.label"/></label>
                <div class="controls">
                    <input type="text" name="email" placeholder="${message(code:'app.registerCommand.email.label')}"
                        value="${command?.email}" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label" for="password"><g:message code="app.registerCommand.password.label"/></label>
                <div class="controls">
                    <input type="password" name="password" placeholder="${message(code:'app.registerCommand.password.label')}"
                        value="${command?.password}" />
                </div>
            </div>

            <div class="form-group">
                <div class="controls">
                    <label class="checkbox"> <g:checkBox name="terms"
                            value="${true}" checked="${command?.terms}" />
                        <g:message code="app.registerCommand.agree.label"/>
                        <a href="#" role="button" data-toggle="modal" data-target="#modalTerms"><g:message code="app.registerCommand.terms.label"/></a>
                    </label>
                </div>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary"><g:message code="app.security.register.submit" /></button>
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
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    </div>
</div>

</body>


</html>