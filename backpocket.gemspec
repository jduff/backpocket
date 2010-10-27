# -*- encoding: utf-8 -*-
require File.expand_path("../lib/backpocket/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "backpocket"
  s.version     = Backpocket::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/backpocket"
  s.summary     = "A collection of random functions / additions I like to have in my backpocket"
  s.description = "A collection of random functions / additions I like to have in my backpocket"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "backpocket"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
