---

layout: article  
category: uncategorized  
tags: frontend  
category: notes  
published: true 
exerpt: Front end notes (In progress)

---

## SVG support in Jekyll

I found the following solution on [Stack Overflow](http://stackoverflow.com/questions/13687030/how-do-i-configure-jekyll-to-serve-svg):

1. Create a ``_plugins`` directory in the root of your Jekyll project.
2. Create a file called ``svg_mime_type.rb`` in ``_plugins``
3. Add this to ``svg_mime_type.rb:``

<pre><code class="language-css">require 'webrick'
include WEBrick
WEBrick::HTTPUtils::DefaultMimeTypes.store 'svg', 'image/svg+xml'
</code></pre>

## Use Pow with iOS devices

Say your development computer’s LAN IP address is 10.0.0.1. With the new version of Pow, you can now access your app at `http://myapp.10.0.0.1.xip.io/`. And xip.io supports wildcard DNS, so any and all subdomains of 10.0.0.1.xip.io resolve too.

[View More](http://37signals.com/svn/posts/3191-announcing-pow-040-with-xipio-support)

## Livereload js

<pre><code class="language-javascript">// Livereload
document.write('&lt;script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"&gt;&lt;/' + 'script&gt;');
</code></pre>
