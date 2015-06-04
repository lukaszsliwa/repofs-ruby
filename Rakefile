# encoding: utf-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require './lib/rfs'

Jeweler::Tasks.new do |gem|
  gem.name = "repofs"
  gem.homepage = "http://git.apptamers.com/repohub/rfs"
  gem.license = "MIT"
  gem.summary = %Q{RepoFS CLI}
  gem.description = %Q{Provides possibility to manage the repositories}
  gem.email = "lukasz.sliwa@apptamers.com"
  gem.authors = ["Łukasz Śliwa"]
  gem.executables = ['rfs', 'repofs']
  gem.version = Rfs::VERSION
end
Jeweler::RubygemsDotOrgTasks.new