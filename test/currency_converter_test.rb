require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency'

class CurrencyConverter < Minitest::Test
  def test_currency_converter_exist
    assert Converter.new(3)
  end

  def test_currency_addition_converter
      assert_equal(Converter.new(7.7), 5 * CurrencyConverter ) + 2
  end
end
