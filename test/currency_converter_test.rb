require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency'

class CurrencyConverter < Minitest::Test
  def test_currency_converter_exist
    assert CurrencyConverter.new(3)
  end

  def test_currency_addition_converter
    assert_equal (CurrencyConverter.new(7.7), CurrencyConverter.new(5) * CurrencyConverter) + 2
  end
end
