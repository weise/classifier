require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name        = "budgeteer_classifier"
    s.summary     = "A general classifier module to allow Bayesian and other types of classifications."
    s.description = "Bayesian classifier and others."
    s.homepage    = "http://github.com/logankoester/classifier"
    s.author      = "Luis Parravicini"
    s.email       = "lparravi@gmail.com"

    s.add_dependency "activesupport", ">= 2.2.2"
    s.add_dependency "ruby-stemmer", ">= 0.5.1"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
