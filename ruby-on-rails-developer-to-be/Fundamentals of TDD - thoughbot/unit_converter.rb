require "rspec/autorun"

# the cases and problem:
# Make the unit converter:
# UnitConverter.convert.new(2, :cup, :liter) ==> 0.473
# UnitConverter.convert.new(2, :cup, :gram) ==> "Dimensionless Mismatch"

# the main code

DimensionalMismatchError = Class.new(StandardError)

Quantity = Struct.new(:amount, :unit)

class UnitConverter
  def initialize (initial_quantity, target_unit)
    @intial_quantity = initial_quantity
    @target_unit = target_unit
  end

  def convert

    @initial_amount * conversion_factor(from: @initial_quantity.unit, to: @target_unit)

  end

  private

  CONVERSION_FACTORS = {
    cup: {
      liter: 0.236588
    }
  }

  def conversion_factor(from:, to:)
    CONVERSION_FACTORS[from][to] || raise(DimensionalMismatchError, "Can't convert from #{from} to #{to}")
  end
  
end

# the testing code
describe UnitConverter do
  describe "#convert" do
    it "Convert the cup to liter" do

      new_cup = Quantity.new(2, :cup)

      converter = UnitConverter.new(new_cup, :liter)

      result = converter.convert

      expect(result).to be_within(0.001).of(0.473)
    end
    it "Convert the cup to gram" do

      new_cup = Quantity.new(2, :cup)

      converter = UnitConverter.new(new_cup, :grams)

      result = converter.convert

      expect{result}.to raise_error(DimensionalMismatchError)
    end
  end
end
