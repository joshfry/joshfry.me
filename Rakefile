def consoleHeading(taskName)

  puts
  puts '---------------------------------------'
  puts taskName + '...'
  puts '---------------------------------------'

end

task :default do

  consoleHeading('Available rake commands')
  puts 'rake install'
  puts 'rake clean'

end

task :install do

  consoleHeading('Installing Ruby Gems')
  sh 'bundle install --path=vendor'

  consoleHeading('Installing Node Modules')
  sh 'npm install'

  consoleHeading('Installing Bower Dependencies')
  sh 'bower install'

end

task :clean do

  consoleHeading('Cleaning up')
  sh 'rm -rf ./.bundle'
  sh 'rm -rf ./.cache'
  sh 'rm -rf ./.sass-cache'
  sh 'rm -rf ./build'
  sh 'rm -rf ./dist'
  sh 'rm -rf ./node_modules'
  sh 'rm -rf ./vendor'

end
