combination = -> (n) do
  ->(r) do
      n_factorial = 1
      r_factorial = 1
      n_r_factorial = 1
      for i in 0..n-1
          n_factorial*=(n-i)
      end
      for i in 0..r-1
          r_factorial*=(r-i)
      end
      for i in 0..(n-r)-1
          n_r_factorial*=((n-r)-i)
      end
      combinations = n_factorial/(r_factorial*(n_r_factorial))
      return combinations
  end
end
n = 10
r = 7
nCr = combination.(n)
puts nCr.(r)
