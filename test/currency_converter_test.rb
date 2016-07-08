require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/currency'

class CurrencyConverter < Minitest::Test
  def test_currency_converter_exist
    assert Converter.new.convert(Currency.new(5, "USD"), "EUR")
  end

  def test_currency_addition_converter

  end
end
