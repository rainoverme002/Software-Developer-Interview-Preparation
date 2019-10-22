# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
  if (s.length % 2 == 0)
      for i in 0...s.length/2
          #puts "tertukar"

          temp = s[i]
          s[i] = s[s.length - (i+1)]
          s[s.length - (i+1)] = temp

          puts s[i]
          puts s[s.length - (i+1)]
      end
  else
    for i in 0...(s.length-1)/2
      #puts "tertukar"

      temp = s[i]
      s[i] = s[s.length - (i+1)]
      s[s.length - (i+1)] = temp
      puts s[i]
      puts s[s.length - (i+1)]
    end
  end
end

s = ["h","e","l","l","o"]
#s = ["H","a","n","n","a","h"]
reverse_string(s)
