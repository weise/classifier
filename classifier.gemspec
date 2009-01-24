# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{classifier}
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yury Korolev"]
  s.date = %q{2009-01-24}
  s.description = %q{A general classifier module to allow Bayesian and other types of classifications.}
  s.email = %q{yury.korolev@gmail.com}
  s.extra_rdoc_files = ["lib/classifier/base.rb", "lib/classifier/bayes.rb", "lib/classifier/extensions/vector.rb", "lib/classifier/extensions/vector_serialize.rb", "lib/classifier/lsi/content_node.rb", "lib/classifier/lsi/summary.rb", "lib/classifier/lsi/word_list.rb", "lib/classifier/lsi.rb", "lib/classifier.rb", "lib/init.rb", "LICENSE", "README"]
  s.files = ["lib/classifier/base.rb", "lib/classifier/bayes.rb", "lib/classifier/extensions/vector.rb", "lib/classifier/extensions/vector_serialize.rb", "lib/classifier/lsi/content_node.rb", "lib/classifier/lsi/summary.rb", "lib/classifier/lsi/word_list.rb", "lib/classifier/lsi.rb", "lib/classifier.rb", "lib/init.rb", "LICENSE", "Rakefile", "README", "test/base_test.rb", "test/bayes/bayesian_test.rb", "test/lsi/lsi_test.rb", "test/test_helper.rb", "Manifest", "classifier.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/yury/classifier}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Classifier", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{classifier}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A general classifier module to allow Bayesian and other types of classifications.}
  s.test_files = ["test/base_test.rb", "test/bayes/bayesian_test.rb", "test/lsi/lsi_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0", "= 2.2.2"])
      s.add_runtime_dependency(%q<ruby-stemmer>, [">= 0", "= 0.5.1"])
    else
      s.add_dependency(%q<activesupport>, [">= 0", "= 2.2.2"])
      s.add_dependency(%q<ruby-stemmer>, [">= 0", "= 0.5.1"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0", "= 2.2.2"])
    s.add_dependency(%q<ruby-stemmer>, [">= 0", "= 0.5.1"])
  end
end
