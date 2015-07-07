class TemperatureConverter
  attr_accessor :unit, :temp

  def initialize(unit, temp)
    @unit = unit
    @temp = temp
  end

  def to_celsius
    if unit == :kelvin
      temp - 273.15
    elsif unit == :fahrenheit
      (temp - 32.0) * (5.0 / 9.0)
    else :celsius
      temp
    end
  end

  def to_fahrenheit
    if unit == :kelvin
      (temp - 273.15) * 1.8000 + 32.00
    elsif unit == :celsius
      (temp - 32.0) * (5.0 / 9.0)
    else :fahrenheit
      temp
    end
  end

  def to_kelvin
    if unit == :celsius
      temp + 273.15
    elsif unit == :fahrenheit
      (temp + 459.67) * 5 / 9
    else unit == :kelvin
      temp
    end
  end
end

converter = TemperatureConverter.new(:celsius, -5)
p converter.unit
p converter.temp
p converter.to_kelvin
p converter.to_celsius
p converter.to_fahrenheit
