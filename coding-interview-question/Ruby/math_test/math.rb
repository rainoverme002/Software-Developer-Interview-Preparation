# This is the Math Operator Class
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
puts 'Insert Value'

puts 'Value1 :'
value1 = gets.chomp.to_f

puts 'Value2 :'
value2 = gets.chomp.to_f

c = MathOperator.new

# Addition Method
c.add(value1, value2)
puts 'Addition Result :'
c.getresult

# Substraction Method
c.substract(value1, value2)
puts 'Addition Result :'
c.getresult

# multiply Method
c.multiply(value1, value2)
puts 'Multiply Result :'
c.getresult

# divide Method
c.divide(value1, value2)
puts 'Divide Result :'
c.getresult
