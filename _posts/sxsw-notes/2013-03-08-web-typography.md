---

layout: portfolio_entry  
image: /img/post.gif  
title: Web typography you should do now  
category: notes  
published: false  

---

<!--# Web typography you should do now-->

<p class="intro">Simple techniques you can use now that will help you create better typography.</p>

## Notes

- Impact and Immersion
- Immersion = reading
- Good typography induces a good mood

## Responsive typography

- 45 to 75 characters is a satisfactory line length
- 22em - 38em

<pre><code class='language-css'>(min-width: 38em)
.main {
	padding: 0 21%
}
p, table {
  -moz
  -ms
  -o
  -webkit
  hyphens: auto;
}
(min-width: 38em)
p, table {
  hyphens: none
}
(min-width 66em)
  columns count: 2
  columns gap: 1.5em</code></pre>

## Use a Modular Scale
- [http://modularscale.com](http://modularscale.com)
- bigger the text smaller the line-height
- try using the golden ratio scale for heiography


## Microtypography

- Treat numbers as letters to make sure they don't stand out
- Use old style numerals
- Source Sans

<pre><code class='language-css'>p {
  -mox
  -ms
  -0
  -webkit
  font-vfeature-settings: "onum" 1, "pnum" 1;
}</code></pre>


## Tabular data should NOT use old style numerals

<pre><code class='language-css'><acronym class="c2sc">PADI</acronym>
  .c2sc {
   look for "small caps" css property
}</code></pre>

## Choosing fonts

- Does it have the characters you need
- Does it have enought useful weights and styles
- Does it have the features you need
- Is it saying what the text is saying
- Create a specimen. Compare the same paragraph with many different fonts.

## On loading web fonts

- Research webfont loading on google code
- Look into iOS 6.1 fallback fonts

[type-together.com](http://type-together.com)

- Abril
- Tablet Gothiic

[fontdeck.com](http://fontdeck.com)

- Trilogy Fatface

<pre><code class='language-css'>Explor<span class="swash">e</span>
  .swsh {
    font-feature-settings "swsh" 1;
  }</code></pre>

---
	
**Richard Rutter**  
Fontdeck.com  
@clagnut

[http://webtypography.net/talks/sxsw13](http://webtypography.net/talks/sxsw13)