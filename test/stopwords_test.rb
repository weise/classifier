# coding:utf-8
require File.dirname(__FILE__) + '/test_helper'

class StopWordsTest < Test::Unit::TestCase
  def test_en
    assert_equal 80, Classifier::StopWords.for('en').size
  end

  def test_ru
    assert_equal 159, Classifier::StopWords.for('ru').size
  end

  def test_stopword_es
    list = Classifier::StopWords.for('es')
    assert list.include?('más')
  end

  def test_unknown
    assert_equal [], Classifier::StopWords.for('xxyyzz')
  end
end
