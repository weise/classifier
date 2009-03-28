require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.description              = "A general classifier module to allow Bayesian and other types of classifications."
    s.homepage                 = "http://github.com/yury/classifier"
    s.author                   = "Yury Korolev"
    s.email                    = "yury.korolev@gmail.com"

    s.add_dependency "activesupport >= 2.2.2"
    s.add_dependency "ruby-stemmer >= 0.5.1"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
