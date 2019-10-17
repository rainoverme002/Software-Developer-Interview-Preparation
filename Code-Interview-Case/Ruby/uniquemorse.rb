# @param {String[]} words
# @return {Integer}
def unique_morse_representations(words)
    answer = Array.new
    unique_morse = Array.new
    morse = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    for i in 0...words.length
        zen = words[i]
        answer[i] = ""
        for j in 0...zen.length
            case zen[j]
            when "a"
                answer[i] += morse[0]
            when "b"
                answer[i] += morse[1]
            when "c"
                answer[i] += morse[2]
            when "d"
                answer[i] += morse[3]
            when "e"
                answer[i] += morse[4]
            when "f"
                answer[i] += morse[5]
            when "g"
                answer[i] += morse[6]
            when "h"
                answer[i] += morse[7]
            when "i"
                answer[i] += morse[8]
            when "j"
                answer[i] += morse[9]
            when "k"
                answer[i] += morse[10]
            when "l"
                answer[i] += morse[11]
            when "m"
                answer[i] += morse[12]
            when "n"
                answer[i] += morse[13]
            when "o"
                answer[i] += morse[14]
            when "p"
                answer[i] += morse[15]
            when "q"
                answer[i] += morse[16]
            when "r"
                answer[i] += morse[17]
            when "s"
                answer[i] += morse[18]
            when "t"
                answer[i] += morse[19]
            when "u"
                answer[i] += morse[20]
            when "v"
                answer[i] += morse[21]
            when "w"
                answer[i] += morse[22]
            when "x"
                answer[i] += morse[23]
            when "y"
                answer[i] += morse[24]
            when "z"
                answer[i] += morse[25]
            end
        end

        if unique_morse.length == 0
            unique_morse[0] = answer[i]
        end

        puts "Jawaban"
        puts answer
        for z in 0...unique_morse.length
            if answer[i] == unique_morse[z]
                break
            elsif answer[i] != unique_morse[z] && z == unique_morse.length-1
                unique_morse[z+1] = answer[i]
            end
        end

        puts "Unique Morse Array"
        puts unique_morse

        puts "Length Unique Morse"
        puts unique_morse.length
    end

    return unique_morse.length
end

words = ["zocd","gjkl","hzqk","hzgq","gjkl"]

puts words

answer = unique_morse_representations(words)

puts answer