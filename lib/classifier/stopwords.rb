module Classifier

  module SkipWords

    def self.for(language)
      unless SKIP_WORDS.has_key?(language)
        SKIP_WORDS[language] = load_stopwords(language) || []
      end
      SKIP_WORDS[language]
    end

    protected

      def self.load_stopwords(language)
        lang_file = File.join(File.dirname(__FILE__), 'stopwords', language)
        if File.exist?(lang_file)
          data = []
          File.open(lang_file, 'r:utf-8') do |f|
            f.each_line do |line|
              line = line.gsub(/#.*/, '').strip
              data << line unless line.empty?
            end
          end
          data
        end
      end
        
    SKIP_WORDS = {}
  end
end
