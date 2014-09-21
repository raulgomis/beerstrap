<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <parameter name="menu_Sandbox" value="active" />
</head>
<body>
<article>
    <header>
    <g:render template="top" model="['selected':'components']" />
    </header>
    <div id="components">
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Forms</div>
                    <div class="panel-body">
                        <form role="form">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFile">File input</label>
                                <input type="file" id="exampleInputFile">
                                <p class="help-block">Example block-level help text here.</p>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Check me out
                                </label>
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Buttons</div>
                    <div class="panel-body">
                        <!-- Standard button -->
                        <button type="button" class="btn btn-default">Default</button>

                        <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                        <button type="button" class="btn btn-primary">Primary</button>

                        <!-- Indicates a successful or positive action -->
                        <button type="button" class="btn btn-success">Success</button>

                        <!-- Contextual button for informational alert messages -->
                        <button type="button" class="btn btn-info">Info</button>

                        <!-- Indicates caution should be taken with this action -->
                        <button type="button" class="btn btn-warning">Warning</button>

                        <!-- Indicates a dangerous or potentially negative action -->
                        <button type="button" class="btn btn-danger">Danger</button>

                        <!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
                        <button type="button" class="btn btn-link">Link</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>
</body>
</html>
