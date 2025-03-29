require 'rake'
require 'rbconfig'

task default: :run

desc 'Run the game'
task :run do
  main_file = File.expand_path('lib/rubytris.rb', __dir__)
  ruby_executable = RbConfig.ruby
  system("#{ruby_executable} \"#{main_file}\"")
end

desc 'Install dependencies'
task :setup do
  system('bundle install')
end
