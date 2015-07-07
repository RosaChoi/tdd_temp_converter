require 'spec_helper'
require_relative '../converter'

describe TemperatureConverter do
  describe 'initialization' do
    it "stores the type and temp" do
      converter = TemperatureConverter.new(:fahrenheit, 78)
      expect(converter.unit).to be == :fahrenheit
      expect(converter.temp).to be == 78

      converter = TemperatureConverter.new(:celsius, 20.4)
      expect(converter.unit).to be == :celsius
      expect(converter.temp).to be == 20.4

      converter = TemperatureConverter.new(:kelvin, 111)
      expect(converter.unit).to be == :kelvin
      expect(converter.temp).to be == 111
    end
  end

  describe '#to_celsius' do
    it 'returns the original temperature when given celsius' do
      converter = TemperatureConverter.new(:celsius, 20.4)

      expect(converter.to_celsius).to eq(20.4)
    end

    it 'returns the temperature in celsius when given kelvin' do
      # The formula to convert kelvin to celsius is:
      # celsius_temperature = kelvin_temperature -  273.15
      converter = TemperatureConverter.new(:kelvin, 78)

      expect(converter.to_celsius).to be_within(0.1).of(-195.14)
      #be_within().of()
    end

    it 'returns the temperature in celsius when given fahrenheit' do
      # The formula to convert fahrenheit to celsius is:
    # celsius_temperature = (fahrenheit_temperature - 32.0) * (5.0/9.0)
      converter = TemperatureConverter.new(:fahrenheit, 52)

      expect(converter.to_celsius).to be_within(0.1).of(11.11)
    end
  end

  describe '#to_fahrenheit' do
    it 'returns the original temperature when given fahrenheit' do
      converter = TemperatureConverter.new(:fahrenheit, 120)

      expect(converter.to_fahrenheit).to eq(120)
    end

    it 'returns the temperature in fahrenheit when given celsius' do
      converter = TemperatureConverter.new(:celsius, 120)

      expect(converter.to_fahrenheit).to be_within(0.1).of(48.89)
    end

    it 'returns the temperature in fahrenheit when given kelvin' do
      converter = TemperatureConverter.new(:kelvin, 120)

      expect(converter.to_fahrenheit).to be_within(0.1).of(-243.67)
    end
  end

  describe '#to_kelvin' do
    it 'returns the original temperature when given kelvin' do
      converter = TemperatureConverter.new(:kelvin, 55)

      expect(converter.to_kelvin).to eq(55)
    end

    it 'returns the temperature in kelvin when given celsius' do
      converter = TemperatureConverter.new(:celsius, -1)

      expect(converter.to_kelvin).to be_within(0.1).of(272.15)
    end

    it 'returns the temperature in kelvin when given fahrenheit' do
      converter = TemperatureConverter.new(:fahrenheit, 32)

      expect(converter.to_kelvin).to be_within(0.1).of(273.15)
    end
  end

end
