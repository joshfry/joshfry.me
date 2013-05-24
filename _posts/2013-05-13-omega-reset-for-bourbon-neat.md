---

layout: portfolio_entry  
category: notes  
published: true  
exerpt: Omega Reset. A Sass mixin for Bourbon Neat that let's you change the number of columns at any breakpoint.

---

This mixin assumes you are designing "mobile first" and using `min-width` media queries. As well as using Sass, Bourbon and Bourbon Neat in your project.

## The problem

Your design calls for a grid layout that can morph from 1 column on mobile to 2 columns, 3 columns, 4 columns, etc. as the viewport gets larger. Lets say at `min-width: 480px` our design uses a 2 column layout and at `min-width: 768px` it uses a 3 column layout.

The way that Bourbon Neat handles columns is it gives the `nth:last-child` element `margin-right: 0` and the `nth(*+1)` element `clear:left`; where `*` is the number you pass to Bourbon Neat's `@include omega(n)` mixin. For a 2 column layout it would be `@include omega(2n)`.

When it's time to morph the layout into 3 columns at the `min-width: 768px` media query the `@include omega(2n)` mixin from our 2 column layout gets inherited and interferes with our 3 column layout. We need the omega mixin to be `@include omega(3n)` and we need to reset the styles affected by `@include omega(2n)`. This is currently not possible with Bourbon Neat.

### So, I made Omega Reset. A Sass mixin for Bourbon Neat that let's you change the number of columns at any breakpoint. 

## `_author.scss`

Here's how to use `@include omega-reset()` alongside Bourbon and Bourbon Neat. `.thing` is just an arbitrary class name for our columns.

<pre><code class="language-scss">// ------------------------------------------------------------
// Neat grid using Omega Reset
// ------------------------------------------------------------

.thing {
  @include breakpoint(480px)  {
    @include span-columns(6);
    @include omega(2n);
  }
  @include breakpoint(768px)  {
    @include omega-reset(2n);
    @include span-columns(4);
    @include omega(3n);
  }
  @include breakpoint(1024px) {
    @include omega-reset(3n);
    @include span-columns(3);
    @include omega(4n);     
  }
  @include breakpoint(1280px) {
    @include omega-reset(4n);
    @include span-columns(2);
    @include omega(6n); 
  }
}</code></pre>

All you have to do is reset the number passed to `@include omega()` from the previous media query into your new media query if you are changing the number of columns.

## `_grid-settings.scss`

This file is used to override Bourbon Neat's grid settings. I personally feel that the default gutter width is too narrow, so I bump up the `$gutter: golden-ratio` from 1 to 3.

In order to use `@include omega-reset()`, you need to set Bourbon's `$fg-column` and `$fg-gutter` variables to match what Bourbon Neat is doing.

<pre><code class="language-scss">// ------------------------------------------------------------
// Override Neat's grid settings
// ------------------------------------------------------------

$column: golden-ratio(1em, 3) !default; // Column width
$gutter: golden-ratio(1em, 3) !default; // Gutter between each two columns

// ------------------------------------------------------------
// Set Bourbon's flex-grid variables to match what Neat is doing
// http://bourbon.io/docs/#flex-grid
// ------------------------------------------------------------

$fg-column: $column;
$fg-gutter: $gutter;</code></pre>

## `_mixins.scss`

This mixin includes a default media query mixin that I normally start out with. I included it here because the HTML example uses it.

The `omega-reset` mixin allows you to reset the `@include omega()` styles on new media queries so that you can change the number of columns in your design.

<pre><code class="language-scss">// ------------------------------------------------------------
// Media queries
// ------------------------------------------------------------
//
// Useage:
//
// @include breakpoint(480px)  {}
// @include breakpoint(768px)  {}
// @include breakpoint(1024px) {}
// @include breakpoint(1280px) {}
// 
// ------------------------------------------------------------

@mixin breakpoint($point) {
  @if $point == 480px {
    @media (min-width: 30em) { @content; }
  }
  @else if $point == 768px {
    @media (min-width: 48em) { @content; }
  }
  @else if $point == 1024px {
    @media (min-width: 60em)  { @content; }
  }
  @else if $point == 1280px {
    @media (min-width: 80em)  { @content; }
  }
}

// ------------------------------------------------------------
// Omega Reset for Bourbon Neat
// ------------------------------------------------------------
//
// Allows you to reset omega() styles on new media queries
// when you need to change the number of columns
//
// Useage:
//
// @include breakpoint(480px)  {
//  @include span-columns(6);
//  @include omega(2n);
// }
// @include breakpoint(768px)  {
//  @include omega-reset(2n);
//  @include span-columns(4);
//  @include omega(3n);
// }
//
// ------------------------------------------------------------

@mixin omega-reset($nth) {
  &amp;:nth-child(#{$nth}) { margin-right: flex-gutter(); }
  &amp;:nth-child(#{$nth}+1) { clear: none }
}</code></pre>

## `example.html`

<pre><code class="language-markup">&lt;div class="main"&gt;
  &lt;div class="container"&gt;

    &lt;div class="thing"&gt;&lt;h2&gt;Column 1&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 2&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 3&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 4&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 5&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 6&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 7&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 8&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 9&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 10&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 11&lt;/h2&gt;&lt;/div&gt;
    &lt;div class="thing"&gt;&lt;h2&gt;Column 12&lt;/h2&gt;&lt;/div&gt;

  &lt;/div&gt;&lt;!-- / container --&gt;
&lt;/div&gt;&lt;!-- / main --&gt;</code></pre>

View more: [https://github.com/joshfry/point-guard](https://github.com/joshfry/point-guard)