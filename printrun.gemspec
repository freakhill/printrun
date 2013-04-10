require File.expand_path('../lib/printrun/version', __FILE__)
require 'rubygems'
::Gem::Specification.new do |s|
  s.name        = 'printrun'
  s.version     = Printrun::VERSION
  s.platform    = ::Gem::Platform::RUBY
  s.required_ruby_version     = '>= 1.9.1'
  s.required_rubygems_version = '>= 1.3.6'
  ###
  s.authors     = ['Johan Gall']
  s.email       = 'johan.gall+github_printrun@gmail.com'
  ###
  s.homepage    = 'https://github.com/freakhill/printrun'
  s.summary     = 'Print and execute ruby code'
  s.description = 'Quick and dirty print and run of ruby code because I was tired of copying my gist'
  s.date        = '2013-04-10'
  ###
  s.files         = Dir['lib/**/*.rb', '*.md']
  s.require_paths = ['lib']
  s.add_dependency 'sourcify'
end
