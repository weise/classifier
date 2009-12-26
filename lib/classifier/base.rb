
module Classifier
  class Base
    
    def initialize(options = {})
      options.reverse_merge!(:language => 'en')
      options.reverse_merge!(:encoding => 'UTF_8')

      @options = options
    end
  
    def prepare_category_name val
      val.to_s.gsub("_"," ").capitalize.intern 
    end
    
    # Removes common punctuation symbols, returning a new string. 
    # E.g.,
    #   "Hello (greeting's), with {braces} < >...?".without_punctuation
    #   => "Hello  greetings   with  braces         "
    def without_punctuation str
      str.tr( ',?.!;:"@#$%^&*()_=+[]{}\|<>/`~', " " ) .tr( "'\-", "")
    end
    
    # Return a Hash of strings => ints. Each word in the string is stemmed,
    # interned, and indexes to its frequency in the document.  
  	def word_hash str
  		word_hash_for_words(str.gsub(/[^\w\s]/,"").split + str.gsub(/[\w]/," ").split)
  	end
  	
  	# Return a word hash without extra punctuation or short symbols, just stemmed words
  	def clean_word_hash str
  		word_hash_for_words str.gsub(/[^\w\s]/,"").split
  	end
  	
  	private 
  	
		def stemmer
			@stemmer ||= Lingua::Stemmer.new(@options)
		end

  	def word_hash_for_words(words)
  		d = Hash.new
  		skip_words = StopWords.for(@options[:language])
  		words.each do |word|
  			word = word.mb_chars.downcase.to_s if word =~ /[\w]+/
  			key = stemmer.stem(word).intern
  			if word =~ /[^\w]/ || ! skip_words.include?(word) && word.length > 2
  				d[key] ||= 0
  				d[key] += 1
  			end
  		end
  		return d
  	end
  end
end
