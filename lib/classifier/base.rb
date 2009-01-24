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
  	
  	def word_hash_for_words(words)
  	  stemmer = Lingua::Stemmer.new(@options)
  		d = Hash.new
  		skip_words = SKIP_WORDS[@options[:language]] || []
  		words.each do |word|
  			word.mb_chars.downcase! if word =~ /[\w]+/
  			key = stemmer.stem(word).intern
  			if word =~ /[^\w]/ || ! skip_words.include?(word) && word.length > 2
  				d[key] ||= 0
  				d[key] += 1
  			end
  		end
  		return d
  	end
  	  	
  	EN_CORPUS_SKIP_WORDS = [
        "a",
        "again",
        "all",
        "along",
        "are",
        "also",
        "an",
        "and",
        "as",
        "at",
        "but",
        "by",
        "came",
        "can",
        "cant",
        "couldnt",
        "did",
        "didn",
        "didnt",
        "do",
        "doesnt",
        "dont",
        "ever",
        "first",
        "from",
        "have",
        "her",
        "here",
        "him",
        "how",
        "i",
        "if",
        "in",
        "into",
        "is",
        "isnt",
        "it",
        "itll",
        "just",
        "last",
        "least",
        "like",
        "most",
        "my",
        "new",
        "no",
        "not",
        "now",
        "of",
        "on",
        "or",
        "should",
        "sinc",
        "so",
        "some",
        "th",
        "than",
        "this",
        "that",
        "the",
        "their",
        "then",
        "those",
        "to",
        "told",
        "too",
        "true",
        "try",
        "until",
        "url",
        "us",
        "were",
        "when",
        "whether",
        "while",
        "with",
        "within",
        "yes",
        "you",
        "youll",
        ]
    
    # http://snowball.tartarus.org/algorithms/russian/stop.txt
    RU_CORPUS_SKIP_WORDS = [
      "и",              # and
      "в",              # in/into
      "во",             # alternative form
      "не",             # not
      "что",            # what/that
      "он",             # he
      "на",             # on/onto
      "я",              # i
      "с",              # from
      "со",             # alternative form
      "как",            # how
      "а",              # milder form of `no' (but)
      "то",             # conjunction and form of `that'
      "все",            # all
      "она",            # she
      "так",            # so, thus
      "его",            # him
      "но",             # but
      "да",             # yes/and
      "ты",             # thou
      "к",              # towards, by
      "у",              # around, chez
      "же",             # intensifier particle
      "вы",             # you
      "за",             # beyond, behind
      "бы",             # conditional/subj. particle
      "по",             # up to, along
      "только",         # only
      "ее",             # her
      "мне",            # to me
      "было",           # it was
      "вот",            # here is/are, particle
      "от",             # away from
      "меня",           # me
      "еще",            # still, yet, more
      "нет",            # no, there isnt/arent
      "о",              # about
      "из",             # out of
      "ему",            # to him
      "теперь",         # now
      "когда",          # when
      "даже",           # even
      "ну",             # so, well
      "вдруг",          # suddenly
      "ли",             # interrogative particle
      "если",           # if
      "уже",            # already, but homonym of `narrower'
      "или",            # or
      "ни",             # neither
      "быть",           # to be
      "был",            # he was
      "него",           # prepositional form of его
      "до",             # up to
      "вас",            # you accusative
      "нибудь",         # indef. suffix preceded by hyphen
      "опять",          # again
      "уж",             # already, but homonym of `adder'
      "вам",            # to you
      "сказал",         # he said
      "ведь",           # particle `after all'
      "там",            # there
      "потом",          # then
      "себя",           # oneself
      "ничего",         # nothing
      "ей",             # to her
      "может",          # usually with `быть' as `maybe'
      "они",            # they
      "тут",            # here
      "где",            # where
      "есть",           # there is/are
      "надо",           # got to, must
      "ней",            # prepositional form of  ей
      "для",            # for
      "мы",             # we
      "тебя",           # thee
      "их",             # them, their
      "чем",            # than
      "была",           # she was
      "сам",            # self
      "чтоб",           # in order to
      "без",            # without
      "будто",          # as if
      "человек",        # man, person, one
      "чего",           # genitive form of `what'
      "раз",            # once
      "тоже",           # also
      "себе",           # to oneself
      "под",            # beneath
      "жизнь",          # life
      "будет",          # will be
      "ж",              # short form of intensifer particle `же'
      "тогда",          # then
      "кто",            # who
      "этот",           # this
      "говорил",        # was saying
      "того",           # genitive form of `that'
      "потому",         # for that reason
      "этого",          # genitive form of `this'
      "какой",          # which
      "совсем",         # altogether
      "ним",            # prepositional form of `его', `они'
      "здесь",          # here
      "этом",           # prepositional form of `этот'
      "один",           # one
      "почти",          # almost
      "мой",            # my
      "тем",            # instrumental/dative plural of `тот', `то'
      "чтобы",          # full form of `in order that'
      "нее",            # her (acc.)
      "кажется",        # it seems
      "сейчас",         # now
      "были",           # they were
      "куда",           # where to
      "зачем",          # why
      "сказать",        # to say
      "всех",           # all (acc., gen. preposn. plural)
      "никогда",        # never
      "сегодня",        # today
      "можно",          # possible, one can
      "при",            # by
      "наконец",        # finally
      "два",            # two
      "об",             # alternative form of `о', about
      "другой",         # another
      "хоть",           # even
      "после",          # after
      "над",            # above
      "больше",         # more
      "тот",            # that one (masc.)
      "через",          # across, in
      "эти",            # these
      "нас",            # us
      "про",            # about
      "всего",          # in all, only, of all
      "них",            # prepositional form of `они' (they)
      "какая",          # which, feminine
      "много",          # lots
      "разве",          # interrogative particle
      "сказала",        # she said
      "три",            # three
      "эту",            # this, acc. fem. sing.
      "моя",            # my, feminine
      "впрочем",        # moreover, besides
      "хорошо",         # good
      "свою",           # ones own, acc. fem. sing.
      "этой",           # oblique form of `эта', fem. `this'
      "перед",          # in front of
      "иногда",         # sometimes
      "лучше",          # better
      "чуть",           # a little
      "том",            # preposn. form of `that one'
      "нельзя",         # one must not
      "такой",          # such a one
      "им",             # to them
      "более",          # more
      "всегда",         # always
      "конечно",        # of course
      "всю",            # acc. fem. sing of `all'
      "между",          # between
    ]
        
    SKIP_WORDS = {
      'en' => EN_CORPUS_SKIP_WORDS,
      'ru' => RU_CORPUS_SKIP_WORDS
    }
    
  end
end