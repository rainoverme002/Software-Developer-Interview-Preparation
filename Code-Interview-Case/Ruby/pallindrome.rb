rev = 0
print "Testing Pallindrome \n"

puts "Please Insert the Number"
x = gets

number = x

while(number!=0) do
    y = number%10
    rev = (rev*10)+y
    number = number/10
end

puts rev

if (rev == x)
    print "Ini palindrome\n"
elsif (rev != x)
    print "Ini Bukan palindrome\n"
end