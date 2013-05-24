---

layout: portfolio_entry  
category: notes  
published: true  
exerpt: Front end notes (In progress)

---

_(in progress)_

## New front end workflow

I plan to make this post about my latest project on Github: [https://github.com/joshfry/point-guard](https://github.com/joshfry/point-guard)

## Use Pow with iOS devices

Say your development computer’s LAN IP address is 10.0.0.1. With the new version of Pow, you can now access your app at `http://myapp.10.0.0.1.xip.io/`. And xip.io supports wildcard DNS, so any and all subdomains of 10.0.0.1.xip.io resolve too.

[http://37signals.com/svn/posts/3191-announcing-pow-040-with-xipio-support](http://37signals.com/svn/posts/3191-announcing-pow-040-with-xipio-support)

- - - 

## Livereload js

<pre><code class="language-js">// Livereload
document.write('&lt;script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"&gt;&lt;/' + 'script&gt;');
</code></pre>