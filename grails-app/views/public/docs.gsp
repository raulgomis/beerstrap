<%@ page contentType="text/html" %>
<html>
<head>
    <meta name="layout" content="public"/>
    <parameter name="menu_Docs" value="active"/>
    <title>Docs</title>
</head>

<body>
<h2 class="section_header">
    <span><i class="icon-file-alt"></i> Docs <small>See all plan details here</small>
    </span>
    <hr class="right visible-desktop"></hr>
</h2>

<markdown:renderHtml>

Just write in the comment box *the same way it's shown in this file*, it's
really that simple.

# Item 1
## Item 1.1


# Item 2
## Item 2.2
    This is text for item 2


</markdown:renderHtml>


</body>

</html>