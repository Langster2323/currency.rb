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

  def test_currency_multiplication
    assert_equal(Currency.new(22), Currency.new(11) * 2)
  end

  def test_currency_division
    assert_equal(Currency.new(6), Currency.new(30) / 5)
  end

  # def test_currency_equals
  #   assert_equal Converter( Currency.new(10, :USD), :EUR ) == Currency.new(7.40, :EUR)
  # end

#   def test_currency_addition_converter
# assert_equal Currency.new(7.7), Currency.new(1 * Converter) + 2
#   end
end
