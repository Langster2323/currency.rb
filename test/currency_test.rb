require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_exists
    assert Currency.new(10)
  end

  def test_currency_addition
    assert_equal(Currency.new(10), Currency.new(5) + Currency.new(5))
  end

  def test_currency_subtraction
    assert_equal(Currency.new(2), Currency.new(4) - Currency.new(2))
  end
end
