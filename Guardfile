# Guardfile
# More info at https://github.com/guard/guard#readme

# guard-concat
# Add bower components here. Do not add .js at the end of the file.
    # To add a package via bower, run $ bower install <name-of-plugin> --save
    # Adding the --save flag, saves the plugin as a dependancy in compenent.json
guard :concat, type: "js", 
  files: %w(
    app
  ), 
  input_dir: "js", 
  output: "js/app.min"

# guard-sass
guard 'sass', 
  :input => 'scss', 
  :output => 'css', 
  :style => :compressed

# guard-livereload
guard 'livereload' do
  watch(%r{.+\.(css|html|js)$})
end