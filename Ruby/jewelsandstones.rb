# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
    sum = 0
    for x in 0...j.length
        for y in 0...s.length
            if j[x] == s[y]
                sum+=1
            end
        end
    end
    return sum
end

j = "aA"
s = "aAAbbbbb"

answer = num_jewels_in_stones(j,s)
puts answer
