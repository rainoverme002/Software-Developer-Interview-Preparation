def sum_terms(n)
  (1..n).reduce(0) do |sum, x|
      sum+= (x * x) +1
  end
end

n = 25
answer = sum_terms(n)
puts answer
