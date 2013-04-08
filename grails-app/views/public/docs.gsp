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

<div class="documentation" style="display: none">

Just write in the comment box *the same way it's shown in this file*, it's
really that simple.

(See bottom for more info about Markdown itself.)

Links
-----

For a URL or email, just write it like this:


To use text for the link, write it [like this](http://someurl).

You can add a *title* (which shows up under the cursor),
[like this](http://someurl "this title shows up when you hover").

Reference Links
---------------

You can also put the [link URL][1] below the current paragraph like [this][2].

[1]: http://url
[2]: http://another.url "A funky title"

Here the text "link URL" gets linked to "http://url", and the lines showing
"[1]: http://url" won't show anything.


Or you can use a [shortcut][] reference, which links the text "shortcut"
to the link named "[shortcut]" on the next paragraph.

[shortcut]: http://goes/with/the/link/name/text



Text
----

Use * or _ to emphasize things:

*this is in italic*  and _so is this_

**this is in bold**  and __so is this__

***this is bold and italic***  and ___so is this___


Just write paragraphs like in a text file and they will display how you would
expect.  A blank line separates paragraphs.

So this is a new paragraph. But any text on adjacent lines
will all end up
in the same paragraph.


Blockquotes
----------

> Use the > character in front of a line, *just like in email*.
> Use it if you're quoting a person, a song or whatever.

> You can use *italic* or lists inside them also.
And just like with other paragraphs,
all of these lines are still
part of the blockquote, even without the > character in front.

To end the blockquote, just put a blank line before the following paragraph.


Preformatted Text
----------------

If you want some text to show up exactly as you write it, without Markdown
doing anything to it, just indent every line by at least 4 spaces (or 1 tab).

This line won't *have any markdown* formatting applied.
I can even write <b>HTML</b> and it will show up as text.
This is great for showing program source code, or HTML or even Markdown.
<b>this won't show up as HTML</b> but exactly <i>as you see it in
this text file</i>.

(In a normal paragraph, <b>this will show up in bold</b> just like normal HTML.)

Remember, you have to indent by *at least 4 spaces* to do it.  This paragraph
won't be preformatted.

And if you use [reference][] links, make sure the links are indented
by *fewer than* 4 spaces.

[reference]: http://example.com/blah

(woops, that link didn't work, see? It just got displayed as preformatted text.)

As a shortcut you can use backquotes to do the same thing while inside
a normal pargraph.  `This won't be *italic* or **bold** at all.`

Lists
--------

* an asterisk starts an unordered list
* and this is another item in the list
+ or you can also use the + character
- or the - character

To start an ordered list, write this:

1. this starts a list *with* numbers
+  this will show as number "2"
*  this will show as number "3."
9. any number, +, -, or * will keep the list going.
* just indent by 4 spaces (or tab) to make a sub-list
1. keep indenting for more sub lists
* here i'm back to the second level


Headers
---------

This is a huge header
==================

this is a smaller header
------------------

Just put 1 or more dashes or equals signs (--- or ===) below the title.

You might use the huge header at the very top of your text for a title or
something (except weblog posts usually already have a title), and use the
smaller header for subtitles or sections.


Horizontal Rule
---------------

just put three or more *'s or -'s on a line:

----------------

or you can use single spaces between then, like this:

* * *

or

- - - - - - -

Make sure you have a blank line above the dashes, though, or else:

you will get a header
---


Images
-----------

To include an image, just put a "!" in front of a text link:

![alternate text](http://someurl/image.gif)


The "alternate text" will show up if the browser can't load the image.

You can also use a title if you want, like this:

![tiny arrow](http://greg.vario.us/img/extlink.png "tiny arrow")



Escapes
---------

What if you want to just show asterisks, not italics?

* this shows up in italics: *a happy day*
* this shows the asterisks: \*a happy day\*

The backslashes will disappear and leave the asterisks.

You can do the same with any of the characters that have a special meaning
for Markdown.


More Headers
----------

More ways of doing headers:

# this is a huge header #
## this is a smaller header ##
### this is even smaller ###
#### more small ####
##### even smaller #####
###### smallest still: `<h6>` header

You can use up to 6 `#` characters at the beginning of the line.
(You can optionally put them on the end, too, and they will disappear.)



HTML crap
-------------

Don't worry about special HTML characters. I can write an ampersand & a
less-than sign, and they show up as I intend them to:  3 < 4.

(You can still write `&amp;` (& character) and `&lt;` (<) or `&gt;` (>) if you
want.  or ignore what I just said.)


About
---------

This text file shows you how to use [Markdown][] instead of crappy HTML when
writing posts or comments.

[Markdown]: http://daringfireball.net/projects/markdown/syntax

Markdown is an easier way of making HTML pages from text, rather than having to
know HTML.

* See this file as it looks when [rendered with Markdown][].
* See the [original text file][].

[rendered with Markdown]: http://greg.vario.us/doc/markdown.text
[original text file]: http://greg.vario.us/doc/markdown.txt

Thanks
---------

Thanks to John Gruber and Aaron Swartz for creating Markdown.

Fin
---------

No rights reserved, do with this what you like.
Written by Greg Schueler, greg@@vario.us




#Grails Bootstrap
Productivity booster. Kick-start your project with the combined knowledge and effort of 100s of developers, all in one little package. Web development never has been so fast!

##License
- Grails Bootstrap is licensed under the CC BY 3.0 License - http://creativecommons.org/licenses/by/3.0/

##Contact
- Email: raulgomis@hotmail.com
- Twitter: http://twitter.com/rgomis
- Linkedin: http://linkd.in/11eyTDE
- Work: Software developer @ http://tallerdigital.com




# Usage

Once you have cloned or downloaded HTML5 Boilerplate, creating a site or app
usually involves the following:

1. Set up the basic structure of the site.
2. Add some content, style, and functionality.
3. Run your site locally to see how it looks.
4. (Optionally run a build script to automate the optimization of your site -
e.g. [ant build script](https://github.com/h5bp/ant-build-script) or [node
build script](https://github.com/h5bp/node-build-script)).
5. Deploy your site.


## Basic structure

A basic HTML5 Boilerplate site initially looks something like this:

```
code here
```

What follows is a general overview of each major part and how to use them.

### css

This directory should contain all your project's CSS files. It includes some
initial CSS to help get you started from a solid foundation. [About the
CSS](css.md).

### doc

This directory contains all the HTML5 Boilerplate documentation. You can use it
as the location and basis for your own project's documentation.

### js

This directory should contain all your project's JS files. Libraries, plugins,
and custom code can all be included here. It includes some initial JS to help
get you started. [About the JavaScript](js.md).

### .htaccess

The default web server config is for Apache. [About the .htaccess](htaccess.md).

Host your site on a server other than Apache? You're likely to find the
corresponding configuration file in our [server configs
repo](https://github.com/h5bp/server-configs). If you cannot find a
configuration file for your setup, please consider contributing one so that
others can benefit too.

### 404.html

A helpful custom 404 to get you started.

### index.html

This is the default HTML skeleton that should form the basis of all pages on
your site. If you are using a server-side templating framework, then you will
need to integrate this starting HTML with your setup.

Make sure that you update the URLs for the referenced CSS and JavaScript if you
modify the directory structure at all.

If you are using Google Analytics, make sure that you edit the corresponding
snippet at the bottom to include your analytics ID.

### humans.txt

Edit this file to include the team that worked on your site/app, and the
technology powering it.

### robots.txt

Edit this file to include any pages you need hidden from search engines.

### crossdomain.xml

A template for working with cross-domain requests. [About
crossdomain.xml](crossdomain.md).

### icons

Replace the default `favicon.ico` and apple touch icons with your own. You
might want to check out Hans Christian's handy [HTML5 Boilerplate Favicon and
Apple Touch Icon
PSD-Template](http://drublic.de/blog/html5-boilerplate-favicons-psd-template/).
</div>


<r:script>
    $(function () {
        // When using more than one `textarea` on your page, change the following line to match the one you’re after
        var convert = new Markdown.getSanitizingConverter().makeHtml;

        $('.documentation').html(convert($('.documentation').html()));
        $('.documentation').show();

    });
</r:script>

</body>

</html>