<div class="page-header">
    <h1>
        <i class="icon-phone-sign"></i> Help <small>Ask for help!</small>
    </h1>
</div>

<ul class="nav nav-pills">
    <li ${(selected == "faq")?("class=\"active\""):""}><g:link action="Faq"><g:message code="app.help.faq.label"/></g:link></li>
    <li ${(selected == "videos")?("class=\"active\""):""}><g:link action="Videos"><g:message code="app.help.tutorials.label"/></g:link></li>
</ul>