---

layout: portfolio_entry  
title: Em Limited Content  
category: notes  
tags: typography  
published: false  

---

<!-- # Em-limited Content -->

<p class="intro">A relative approach to typographic measure.</p>
<p class="postdate">December 12, 2012</p>

Lorem ipsum dolor sit amet, consectetur adip\*isicing elit, sed do eiusmod \*tempor incididunt ut labore et dolore magna aliqua.

The number of characters per line is an important part of typography. It’s the basis of how comfortable or exhausted a visitor will be while reading your site.

[The Elements of Typographic Style](#) prescribes the ideal <abbr title="Characters Per Line">CPL</abbr> as 45-75 characters, with 66 being most ideal. Thankfully, there are lots of [different](#) [methodologies](#) to achieve a good measure in a responsive layout. No surprise, for client work we typically subscribe to Trent’s Fluid Type methodology of achieving a healthy CPL. A strong typographic base is crucial to a great responsive design.

##Em-limited Content

Mid-codeout of my redesign, I became fascinated with the idea “Em-limited Content”. Given that an em is based on a unit of type, and given that an ideal CPL exists, why not govern on how far content can expand in em units? Here’s what I came up with:

<pre><code class="language-css">.container {
	margin: 0 auto;
	width: 90%;
	max-width: 44em;
}</code></pre>

My site is a single column of content. The content container is governed by a 44em limit, this results in a maximum CPL of ~96 characters. Admittedly, this is long, but code blogs can typically tolerate a longer CPL as code samples need to skimmable.

I see a lot of possibilities with em-limited content containers. It could be as simple as:

<pre><code class="language-css">p {
    max-width: 40em;
}</code></pre>

That is an over-generalization, you’ll still need to massage your font-size with a technique like Fluid Type, but your content will remained limited to your target CPL. Ultimately, you determine what is best in your situation, but hopefully this approach can help your readability.