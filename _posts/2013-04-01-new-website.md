---

layout: portfolio_entry  
category: notes  
published: true  
exerpt: Introducing my new website, using Jekyll–a static site generator.

---

I decided to use [Jekyll](http://jekyllrb.com/) for my new website. Jekyll is a static site generator which means there's no database to manage, I can write all of my posts in Markdown and use git for version control and to push updates to my server. I really didn't want to use Wordpress for my new site because compared to Jekyll, Wordpress just feels like a brick.

If using a static site generator sounds interesting to you but you're not sure where to begin, [this tutorial](http://net.tutsplus.com/tutorials/other/building-static-sites-with-jekyll/) got *me* up and running and the [Jekyll Wiki](https://github.com/mojombo/jekyll/wiki) has everything else.

## How to get SVG support in Jekyll

I found the following solution on [Stack Overflow](http://stackoverflow.com/questions/13687030/how-do-i-configure-jekyll-to-serve-svg):

1. Create a ``_plugins`` directory in the root of your Jekyll project.
2. Create a file called ``svg_mime_type.rb`` in ``_plugins``
3. Add this to ``svg_mime_type.rb:``

<pre><code class="language-css">require 'webrick'
include WEBrick
WEBrick::HTTPUtils::DefaultMimeTypes.store 'svg', 'image/svg+xml'
</code></pre>