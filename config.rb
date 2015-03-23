# -------------------------------------------------------------------
# Blog settings
# -------------------------------------------------------------------

activate :blog do |blog|

  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"

  blog.sources = "{year}-{month}-{day}-{title}"
  blog.permalink = "{year}/{month}/{day}/{title}"

  # Calendar
  # blog.calendar_template = "blog/calendar.html"
  # blog.year_link = "{year}"
  # blog.month_link = "{year}/{month}"
  # blog.day_link = "{year}/{month}/{day}"

  # Tags
  # blog.tag_template = "blog/tag.html"
  # blog.taglink = "tags/{tag}"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"

  blog.layout = "blog_layout"

  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250

  # Default extension
  blog.default_extension = ".md"
end

page "blog/feed.xml", layout: false

# -------------------------------------------------------------------
# Page options, layouts, aliases and proxies
# -------------------------------------------------------------------

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

require 'lib/extensions/pages_directory.rb'
activate :pages_directory

require 'lib/extensions/custom_urls.rb'
activate :custom_urls

# -------------------------------------------------------------------
# Global settings
# -------------------------------------------------------------------

# http://alexpeattie.com/blog/better-syntax-highlighting-with-rouge/
# Requires: gem 'middleman-syntax'
activate :syntax, line_numbers: true

activate :livereload
activate :directory_indexes
activate :automatic_image_sizes

set :css_dir,      'assets/scss'
set :js_dir,       'assets/js'
set :images_dir,   'assets/img'
set :data_dir,     'source/_templates/data'
set :partials_dir, '_templates/partials'
set :layouts_dir,  '_templates/layouts'
set :helpers_dir,  'lib/helpers'
set :fonts_dir,    'assets/fonts'
set :build_dir,    'build' # legacy from Jekyll

# -------------------------------------------------------------------
# Build-specific config
# -------------------------------------------------------------------

configure :build do
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  # activate :cache_buster
  # activate :asset_hash

  # Favicon generator
  # https://github.com/follmann/middleman-favicon-maker
  activate :favicon_maker do |f|
    f.template_dir  = File.join(root, 'source/assets/img')
    f.output_dir    = File.join(root, 'build')
    f.icons = {
      "favicon.ico" => [
        { icon: "favicon.ico", size: "32x32,16x16" },
      ]
    }
  end

  # Alt image path
  # set :http_prefix, "/Content/images/"
end

# -------------------------------------------------------------------
# Deployment -- bitballoon
# -------------------------------------------------------------------

activate :bitballoon do |bitballoon|
  # How to set an environment variable
  # https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps
  bitballoon.token = ENV["BB_TOKEN"]
  bitballoon.site  = "joshfry.bitballoon.com/"

  # Optional: always run a build before deploying
  bitballoon.build_before = true
end
