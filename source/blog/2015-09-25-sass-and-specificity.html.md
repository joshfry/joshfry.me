---
title: Sass and Specificity
description: I love nesting rules in sass but it's making my css too specific!
---

## Nesting Selectors in Sass is Cool

I love nesting CSS selectors in Sass because it helps me visualize my HTML structure. But one thing I've noticed is that my CSS selectors are becoming too specific! I find myself (when I'm in a hurry) writing `!important` (oh no!!) when I just need to make a style tweak to a component I've made.

~~~ scss

// Nested Sass, yay!

.thing {
  background: red;  
  
  .nested_thing_1 {
    background: orange;
  }

  .nested_thing_2 {
    background: yellow;
    
    .nested_thing_3 {
      background: green;
    }
  }
}

// CSS Output

.thing {
  background: red;
}

.thing .nested_thing_1 {
  background: orange;
}

.thing .nested_thing_2 {
  background: yellow;
}

.thing .nested_thing_2 .nested_thing_3 { // <-- Super specific rule right there!
  background: green;
}

~~~

## Super Specific CSS is Not Cool

As you can see, that last CSS selector there is 3 layers deep in specificity. If I needed to alter `.nested_thing_3` under a certain condition, for instance, when the body of my HTML document has a class of `.dude`, simply writing `.dude .nested_thing_3 { ... }` isn't going to get me anywhere.

~~~ scss

// this selector wins every time because it's so specific
.thing .nested_thing_2 .nested_thing_3 {
  background: green;
}

// this selector looses becuase it's not specific enough
.dude .nested_thing_3 {
  background: red;
}

~~~

To accomplish what I want, I have to write my Sass like this:

~~~scss

// This is totally lame!

.dude {
  .thing {
    .nested_thing_2 {
      .nested_thing_3 {
        background: green;
      }
    }
  }
}

~~~

## How To Nest Selectors In Sass Without Generating All That Specificity

> I need some time to test but I think that this style of writing Sass might be beneficial.

Use `&` to print the parent rule next to the nested rule and don't leave any spaces. I like underscores, so it looks like this:

~~~scss

.thing {
  background: red;
  
  &_nested_thing_1 {
    background: greorangeen;
  }
  
  &_nested_thing_2 {
    background: yellow;

    // nested selectors, without the specificity!
    
    &_nested_thing_3 {
      background: green;
    }
  }
}

// The CSS Output

.thing {
  background: red;
}

.thing_nested_thing_1 {
  background: greorangeen;
}

.thing_nested_thing_2 {
  background: yellow;
}

.thing_nested_thing_2_nested_thing_3 { // <-- Look! No Specificity at all!
  background: green;
}

~~~

By writing it this way I can alter that super nested rule very easily, like this:

~~~scss

.dude .thing_nested_thing_2_nested_thing_3 {
  background: red;
}

~~~

## The Cons

- I havent tested this in the real world
- Long class names

I'll give this method a whirl and see if it proves to be an elegant solution. If not, oh well. It'll be fun.
