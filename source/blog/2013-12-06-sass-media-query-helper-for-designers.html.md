---
title: Sass Media Query Helper For Designers
description: A configurable design tool that displays the current min-width media query in the bottom right corner of your screen and updates as you re-size the browser window.
---

A configurable design helper that displays the current min-width media query in the bottom right corner of your screen and updates as you re-size the browser window. When designing in the browser, you'll know exactly which media query you can add styles to when things start to look weird.

## Assumptions

- Designing mobile-first using min-width media queries
- Using ems for all units
- Using Scss flavor of Sass
- You want a better experience when designing in the browser

> The MQ Helper uses the Sass `@for` directive to output incremental min-width media queries in your css and displays those values on screen by injecting content in the `body:before` pseudo element.

## TL;DR

[View on CodePen &rarr;](http://codepen.io/joshfry/pen/DeACs)

~~~scss
// -------------------------------------------
// Sass Media Query Helper for Designers
// -------------------------------------------

$max-width: em(1200);
$show_media_queries: true;

@mixin media-query-helper {
  position: fixed;
  bottom: 0;
  right: 0;
  z-index: 9999;
  padding: .5em .75em;
  font-family: monospace;
  font-size: 1.125em;
  line-height: 1;
  color: #20D832;
  background: rgba(0,0,0,.8);
}

@if $show_media_queries == true {

  $starting-at: 30em;
  $increment-by: 5em;

  $min: floor($starting-at/$increment-by);
  $max: floor($max-width/$increment-by);

  body {
    &amp;:before {
      @include media-query-helper;

      @for $i from $min through $max {
        @media screen and (min-width: #{$i * $increment-by}) {
          content: "@include media(#{$i * $increment-by})";
        }
      }
    }
  }
}
~~~


## How it works

### The Sass @for loop requires 3 variables

- `$max-width` : max-width of the page container;
- `$starting-at` : min-width the MQ Helper should appear on screen;
- `$increment-by` : display the screen min-width every ($nth)ems

#### Set a max-width for your container

If using Bourbon Neat, this is set in `_grid-settings.scss`. `em()` is a function from Bourbon that converts px to ems.

~~~scss
$max-width: em(1200);
~~~

#### Show or hide the MQ Helper

It should definitely be set to false in production!

~~~scss
$show_media_queries: true;
~~~

#### The MQ Helper design styles

I made this a mixin so that the `@if` statement would be more readable.

~~~scss
@mixin media-query-helper {
  position: fixed;
  bottom: 0;
  right: 0;
  z-index: 9999;
  padding: .5em .75em;
  font-family: monospace;
  font-size: 1.125em;
  line-height: 1;
  color: #20D832;
  background: rgba(0,0,0,.8);
}
~~~

#### The MQ Helper begins

If `$show_media_queries` is set to true, show the MQ Helper on screen

~~~scss
@if $show_media_queries == true {
~~~

#### When should the MQ Helper become visible?

Assuming the design is mobile-first, don't display any media query info because we're not writing any styles that are nested in media queries.

~~~scss
$starting-at: 30em;
~~~

#### How many ems should the MQ Helper increment as you resize the browser window?

~~~scss
$increment-by: 5em;
~~~

#### Tell the `@for` loop when to start showing MQ's on the screen

Divide `$starting-at` by `$increment-by`. With the default settings, it will look like this: `30/5` - which gives us `6`. That statement is wrapped in a `floor()` Sass function which removes the em unit and returns the closest integer, rounded down. Don't edit this variable!

~~~scss
$min: floor($starting-at/$increment-by);
~~~

#### Tell the `@for` loop when to stop incrementing min-widths

Divide `$max-width` by `$increment-by`. With the default settings, it will look like this: 75/5 - which gives us 15. That statement is wrapped in a `floor()` Sass function which removes the em unit and returns the closest integer, rounded down. Don't edit this variable!

~~~scss
$max: floor($max-width/$increment-by);
~~~

We're injecting the current min-width media query onto the page using css `content:''` on the `body:before` element.

~~~scss
body {
  &:before {
~~~

Include the design styles for the MQ Helper

~~~scss
@include media-query-helper;
~~~

#### The Sass `@for` loop

~~~scss
@for $i from $from through floor($max-width/$increment-by) {
  @media screen and (min-width: #{$i * $increment-by}) {
    content: "@include media(#{$i * $increment-by})";
  }
}
~~~

#### The Sass `@for` loop, explained

Here's what the `@for` loop looks like if the variables were compiled:

~~~scss
@for $i from 6 through 15
~~~

This loop will run `10 times` starting at `6` and ending at `15`.

For each loop, `$i` is updated with a new value. The first time the loop runs, `$i = 30` because `6 * 5 = 30`. The 2nd time the loop runs, `$i = 35` because `7 * 5 = 35` and so on. Since `floor()` isn't being used on those variables, the output is set in ems.

#### The final css output looks like this:

~~~scss
@media screen and (min-width: 30em) {
  body:before {
    content: "@include media(30em)";
  }
}
@media screen and (min-width: 35em) {
  body:before {
    content: "@include media(35em)";
  }
}
@media screen and (min-width: 40em) {
  body:before {
    content: "@include media(40em)";
  }
}
// ...and so on. Until it reaches $max-width.
~~~

[View Source](http://codepen.io/joshfry/pen/DeACs)
{: .button.half}

[Demo](http://codepen.io/joshfry/full/DeACs)
{: .button.half}
