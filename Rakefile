require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('classifier', '1.3.2') do |p|
  p.description    = "A general classifier module to allow Bayesian and other types of classifications."
  p.url            = "http://github.com/yury/classifier"
  p.author         = "Yury Korolev"
  p.email          = "yury.korolev@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
  p.runtime_dependencies = ["activesupport >= 2.2.2", "yury-ruby-stemmer >= 0.5.3"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }