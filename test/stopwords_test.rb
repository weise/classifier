require File.dirname(__FILE__) + '/test_helper'
class SkipWordsTest < Test::Unit::TestCase
  def test_en
    assert_equal 80, Classifier::SkipWords.for('en').size
  end

  def test_ru
    assert_equal 159, Classifier::SkipWords.for('ru').size
  end

  def test_unknown
    assert_equal [], Classifier::SkipWords.for('xxyyzz')
  end
end
