---
date: 2013-05-13

title: omega reset for bourbon neat
description: A Sass mixin for Bourbon Neat that let's you change the number of columns at any breakpoint.

category: notes
tags: sass
---

This mixin assumes you are designing mobile-first using min-width media queries and using [Sass](http://sass-lang.com), [Bourbon](http://bourbon.io) and [Bourbon Neat](http://neat.bourbon.io) in your project.

## The Problem

Your design calls for a grid layout that can morph from 1 column on mobile to 2 columns, 3 columns, 4 columns, etc. as the viewport gets larger. Lets say at `min-width: 480px` our design uses a 2 column layout and at `min-width: 768px` it uses a 3 column layout.

The way that Bourbon Neat handles columns is it gives the `nth:last-child` element `margin-right: 0` and the `nth(*+1)` element `clear:left`; where `*` is the number you pass to Bourbon Neat's `@include omega(n)` mixin. For a 2 column layout it would be `@include omega(2n)`.

When it's time to morph the layout into 3 columns at the `min-width: 768px` media query the `@include omega(2n)` mixin from our 2 column layout gets inherited and interferes with our 3 column layout. We need the omega mixin to be `@include omega(3n)` and we need to reset the styles affected by `@include omega(2n)`. This is currently not possible with Bourbon Neat.

> So, I made Omega Reset. A Sass mixin for Bourbon Neat that let's you change the number of columns at any breakpoint.

## How to Use Omega Reset in Your HTML

Here's how to use `@include omega-reset()` alongside Bourbon and Bourbon Neat.

~~~scss
// ------------------------------------------------------------
// Neat grid using Omega Reset
// ------------------------------------------------------------

.columns {
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
}
~~~

All you have to do is reset the number passed to `@include omega()` from the previous media query into your new media query if you are changing the number of columns.

## Update your Grid Settings

This file is used to override Bourbon Neat's grid settings. I personally feel that the default gutter width is too narrow, so I bump up the `$gutter: golden-ratio` from 1 to 3.

In order to use `@include omega-reset()`, you need to set Bourbon's `$fg-column` and `$fg-gutter` variables to match what Bourbon Neat is doing.

~~~scss
// ------------------------------------------------------------
// Override Neat's grid settings
// ------------------------------------------------------------

$column: golden-ratio(1em, 3) !default; // Column width
$gutter: golden-ratio(1em, 3) !default; // Gutter between each two columns

// ------------------------------------------------------------
// Set Bourbon's flex-grid variables to match what Neat is doing
// http://bourbon.io/docs/#flex-grid
// ------------------------------------------------------------

$fg-column: $column;
$fg-gutter: $gutter;
~~~

## Include Omega Reset Mixin

The `omega-reset` mixin allows you to reset the `@include omega()` styles on new media queries so that you can change the number of columns in your design.

~~~scss
// ------------------------------------------------------------
// Omega Reset
// ------------------------------------------------------------

@mixin omega-reset($nth) {
  &amp;:nth-child(#{$nth}) { margin-right: flex-gutter(); }
  &amp;:nth-child(#{$nth}+1) { clear: none }
}
~~~

<div class="vert-sep">
  <a class="button" href="https://github.com/joshfry/omega-reset-for-bourbon-neat" target="_blank">View on Github</a>
</div>
