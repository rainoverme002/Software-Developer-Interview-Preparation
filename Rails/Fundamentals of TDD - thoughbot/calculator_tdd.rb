"
  Thoughbot
  Fundamental of TDD
  Video - 2
  Calculator TDD
"

require "rspec/autorun"

# this is the application code

class Calculator

  def add (a,b)
    a+b
  end

  def factorial (n)

    if n == 0
      return 1
    else
      return n * factorial(n-1)
    end
  end

end




# This is the testing code section

# 1. Add method on the calculator
describe Calculator do
  describe "#add" do

    it "add two numbers" do
      @calc = Calculator.new

      expect(@calc.add(1,2)).to eq(3)
    end
  
  end
end

# 2. Factorial method on the calculator

describe Calculator do
  describe "#factorial" do

    it "factorial of n" do
      @calc = Calculator.new

      expect(@calc.factorial(3)).to eq(6)
      expect(@calc.factorial(0)).to eq(1)
    end
  end
end
