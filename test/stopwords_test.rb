# coding:utf-8
require File.dirname(__FILE__) + '/test_helper'
require 'tempfile'

class StopWordsTest < Test::Unit::TestCase
  def test_en
    assert_equal 80, ClassifierBudgeteer::StopWords.for('en').size
  end

  def test_ru
    assert_equal 159, ClassifierBudgeteer::StopWords.for('ru').size
  end

  def test_stopword_es
    list = ClassifierBudgeteer::StopWords.for('es')
    assert list.include?('más')
  end

  def test_unknown
    assert_equal [], ClassifierBudgeteer::StopWords.for('_unknown_')
  end

  def setup
    @tmp = nil
  end
  def teardown
    ClassifierBudgeteer::StopWords.reset
    File.delete(@tmp) unless @tmp.nil?
  end

  def test_custom_lang_file
    lang = 'xxyyzz'
    @tmp = File.join(File.dirname(__FILE__), lang)
    File.open(@tmp, 'w') { |f| f.puts "str1\nstr2" }
    assert_equal ["str1", "str2"], ClassifierBudgeteer::StopWords.for(lang,
      File.dirname(@tmp))
  end
end
