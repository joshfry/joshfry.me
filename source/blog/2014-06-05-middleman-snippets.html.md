---
title: Middleman Snippets
description: Snippets 'n stuff for ERB templating in Middleman.
---

## List all child pages

~~~ ruby
<ul>
<% current_page.children.each do |page| %>
  <li><%= link_to page.data.title, page.url %></li>
<% end %>
</ul>
~~~

## List pages in a specific directory with a specific tag

~~~ ruby
<% sitemap.resources.each do |page| %>
  <% if page.url =~ /^(\/styleguide\/)/ && page.data.tags == 'pattern' %>

    <br><%= link_to page.data.title, page.url %>

  <% end %>
<% end %>
~~~

## Art direction and page-specific CSS &amp; JS

#### In layout file

~~~ ruby
// in the head
<%= yield_content :css %>
// at the bottom
<%= yield_content :js %>
~~~

#### On the page

~~~ ruby
<% content_for :css do %>
<style>

</style>
<% end %>

<% content_for :js do %>
<script>
  (function($){

  })(jQuery);
</script>
<% end %>
~~~

## Title and (meta) description

~~~ html
<title><%= (current_page.data.page_title || current_page.data.title).titleize %> | <%= data.site.name %> </title>
<meta content="<%= current_page.data.description || data.site.description %>" name="description" />
~~~

## Body classes

~~~ html
<body class="<%= page_classes %> <%= current_page.data.layout %>">
~~~
