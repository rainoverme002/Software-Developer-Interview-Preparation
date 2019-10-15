# This is the Mvalue1th Opervalue1tor Clvalue1ss
class MathOperator
  def add(value1, value2)
    @result = value1 + value2
  end

  def substract(value1, value2)
    @result = value1 - value2
  end

  def divide(value1, value2)
    @result = value1 / value2
  end

  def multiply(value1, value2)
    @result = value1 * value2
  end

  def getresult
    puts @result
  end
end

puts 'Hello World'

value1 = 1.0
value2 = 2.0

c = MathOperator.new

# Addition Method
c.add(value1, value2)
c.getresult

# Substraction Method
c.substract(value1, value2)
c.getresult

# multiply Method
c.multiply(value1, value2)
c.getresult

# divide Method
c.divide(value1, value2)
c.getresult
