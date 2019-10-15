class Math_Operator
    def add(a,b)
        $result = a + b
    end

    def substract(a,b)
        $result = a - b
    end

    def divide(a,b)
        $result = a / b
    end

    def multiply(a,b)
        $result = a * b
    end

    def get_result()
        puts $result
    end
end
puts "Hello World"

a = 1.0
b = 2.0

c = Math_Operator.new

#Addition Method
c.add(a,b)
c.get_result()

#Substraction Method
c.substract(a,b)
c.get_result()

#multiply Method
c.multiply(a,b)
c.get_result()

#divide Method
c.divide(a,b)
c.get_result()
