#CAUTION :
# It's been done but never test in the LeetCode

# @param {Integer[]} nums
# @return {Integer[][]}
  # Soal !
  # Input : n = 3
  # Output : 123 132 312 321 231 213
          
  # Input : n = 4
  # Output : 1234 1243 1423 4123 4132
  # 1432 1342 1324 3124 3142 3412 4312 
  # 4321 3421 3241 3214 2314 2341 2431
  # 4231 4213 2413 2143 2134

# swapping algorithm solutions

def permute(nums)
  #read the n 
  #integer can't use the length method so :
  nums.digits
  # => [1,2,3] 
  n = nums.digits.count
  k = n

  nums = nums.to_s

  #number of permutations
  #P(n,k) == n!/(n-k)!
  #call number_permutation function

  n_permutation = permutation_func(n)
  n_k_permutation = permutation_func(n-k)

  p_n_k = n_permutation/ n_k_permutation

  #value of each main root permutations = P(n,k)/n

  each_root_permutations = p_n_k / n

  #init new array
  array = Array.new

  array.insert(0,nums)

  puts "Hasil First State"
  puts nums

  # first state for swapping the main root
  # 1234 > 2341 > 3412 > 4123
  first_state(array, nums, n, each_root_permutations)

end

def first_state(array, nums, n, each_root_permutations)
  for i in 0...n
    # call swapping function for main root
    # second state swapping
    # 1234 > 1243 > 1423 > 1432 > 1342 > 1324
    # end while swapping result == first second state 1234
    second_state(nums, n, each_root_permutations)

    if i < n-1
      nums = fullswap(nums,n)
      puts "This is the First State"
      puts nums
    end

  end
end

def second_state(nums, n, each_root_permutations)
    if n > 2
      first_secondstate = nums

      #secondstate counter init
      j_secondstate = 0

      #secondstate init
      secondstate = 0

      i = n-1

      puts "This is the Permutation Result"
      
      while (j_secondstate!=(each_root_permutations))
          #call for secondstate swapping function 
          if j_secondstate == 0
            secondstate = swap(first_secondstate, i)
            puts secondstate
          elsif j_secondstate > 0
            secondstate = swap(secondstate, i)
            puts secondstate
          end 
          #secondstate number counter
          j_secondstate+=1
          #counter down
          i-=1
          #reset swapping map
          if i == 1
            i = n-1
          end
      end
    end
end

# build fullswapping functions for the main root 
def fullswap(nums, n)
  for i in 1...n
    nums = swap(nums,i)
  end
  return nums
end

# build swapping functions for the second root
def swap(nums, i)
  passing = nums[i]
  nums[i] = nums[i-1]
  nums[i-1] = passing
  return nums
end

# permutation function

def permutation_func(n)
  permutation = 1
  for i in 0...n
    permutation*= (n-i)
  end
  return permutation
end

#main program

nums = 12345

permute(nums)

