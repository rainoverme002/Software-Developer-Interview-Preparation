# @param {String} s
# @return {String}
def remove_outer_parentheses(s)
    counter1 = 0
    counter2 = 0
    j = 0

    answer = Array.new
    answer[j] = ""

    for i in 0...s.length+1
        puts counter1
        puts counter2
        puts j
        if s[i] == "("
            counter1+=1
            answer[j]+= "("
        elsif s[i] == ")"
            counter2+=1
            answer[j]+= ")"
        end

        if counter1 == counter2
            counter1 = 0
            counter2 = 0
            j+=1
            answer[j] = ""
        end
    end

    cern = ""
    for i in 0...answer.length
        jake = answer[i]

        for j in 1...jake.length-1
            cern += jake[j]
        end
    end
    return cern
end
s = "(()())(())(()(()))"

answer = remove_outer_parentheses(s)

