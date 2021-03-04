# @param {String} s
# @return {Integer}
def balanced_string_split(s)
    counterR = 0
    counterL = 0
    sum = 0

    for i in 0...s.length
        if s[i] == "R"
            counterR+=1
        end
        if s[i] == "L"
            counterL+=1
        end
        if counterR == counterL
            sum+=1
            counterR = 0
            counterL = 0
        end
    end
    return sum
end

s = "LLLLRRRRLRLR"

asnwer = balanced_string_split(s)