# Guardfile
# More info at https://github.com/guard/guard#readme

# Guard Jekyll Plus - By Brandon Mathis
# Reload static resources without generating entire site
guard :jekyll do
  watch /.*/
  ignore /^_site/
end

# guard-concat
# Add bower components here. Do not add .js at the end of the file.
  # To add a package via bower, run $ bower install <name-of-plugin> --save
  # Adding the --save flag, saves the plugin as a dependancy in compenent.json
guard :concat, type: "js",
  files: %w(
    plugins/mobile-fixes
    plugins/prism
    site
  ),
  input_dir: "js",
  output: "js/site.min"

# guard-sass
guard 'sass',
  :input => 'scss',
  :output => 'css',
  :style => :compressed

# guard-livereload
guard 'livereload' do
  watch(%r{.+\.(css|html|js)$})
end
