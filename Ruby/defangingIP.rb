# @param {String} address
# @return {String}
def defang_i_paddr(address)
    n = address.length
    answer = ''
    z = '.'
    for i in 0...n
        y = address[i]
        if y == z
            answer+= '[.]'
        else
            answer+= y
        end
    end
    return answer
end

address1 = '1.1.1.1'

answer = defang_i_paddr(address1)

puts answer