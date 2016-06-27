class Invalid_Unit < StandardError
  def message(other)
    "Entry is not the correct unit for conversion, cannot be added or subtracted."
  end
end

class NaN < StandardError
  def message
    "This is not a number."
  end
end

class Currency
  CURRENCY_CODE = {'$' => 'USD',
            '€' => 'EURO'}
  attr_reader :value

  def initialize(value)
    if value < 0
      STDERR.puts("WARNING: Currency cannot contain negative values.")
      @value = value.abs
    else
    @value = value
    end
  end

  def +(other)
    raise Invalid_Unit.new(other) unless other.is_a?(Currency)#if you give me something that's not a Currency, I'm going to throw you an error.
    Currency.new(@value + other.value)
  end

  def -(other)
    raise  Invalid_Unit.new(other) unless other.is_a?(Currency)#if you give me something that's not a Currency, I'm going to throw you an error.
    final_value = @value - other.value
    if final_value < 0
      STDERR.puts ("WARNING : Final Output was going to be #{final_value}. Cannot have negative Currency")
    else
      Currency.new(final_value)
    end
  end

  def *(other)
    raise NaN unless other.is_a?(Fixnum) || other.is_a?(Float)#if you give me something that's not a Currency, I'm going to throw you an error.
    Currency.new(@value * other)
  end

  def /(other)
    raise NaN unless other.is_a?(Fixnum) || other.is_a?(Float)#if you give me something that's not a Currency, I'm going to throw you an error.
    Currency.new(@value / other)
  end

  def == (other)
    return false unless other.is_a?(Currency) #are you a Currency?
    @value == other.value #are the values the same?
  end
end

class Converter
  Converter = 1.14
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def +(other)
    raise InvalidUnit unless other.is_a?(Converter) || other.is_a?(Currency)
    if other.is_a?(Currency)
      final_value = (other.value * Converter) + @value
      Currency.new(final_value)
    else
    Currency.new(@value + other.value)
    end
  end

  def -(other)
    raise InvalidUnit unless other.is_a?(Currency)
    Currency.new(@value - other.value)
  end

  def ==(other)
    return false unless other.is_a?(Currency)
    @value == other.value
  end
end
