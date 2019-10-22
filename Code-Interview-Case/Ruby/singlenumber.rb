# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  nums.sort!
  for i in 0...nums.length
    if i == 0
      if nums[i] != nums[i+1]
        answer = nums[i]
        break
      end
    else
      if nums[i] != nums[i+1] && nums[i] != nums[i-1]
        answer = nums[i]
        break
      end
    end
  end
  return answer
end

nums = [2,2,1]

answer = single_number(nums)

puts answer
