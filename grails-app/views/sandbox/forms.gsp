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
    <g:render template="top" model="['selected':'forms']" />
    </header>
    <div id="forms">
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
                    <div class="panel-heading">Tiny MCE</div>
                    <div class="panel-body">
                        <form role="form">
                            <div class="form-group">
                                <label for="descriptionInputFile">Description</label>
                                <input type="text" id="descriptionInputFile" name="descriptionInputFile" value="" class="tiny form-control"/>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</article>
</body>
</html>
