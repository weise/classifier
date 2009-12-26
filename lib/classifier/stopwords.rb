module Classifier

  module StopWords

    def self.for(language)
      unless STOP_WORDS.has_key?(language)
        STOP_WORDS[language] = load_stopwords(language) || []
      end
      STOP_WORDS[language]
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
        
    STOP_WORDS = {}
  end
end
