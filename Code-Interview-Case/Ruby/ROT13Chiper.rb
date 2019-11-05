def rot13(secret_messages)
  # your code here
  # using the ord method in ruby for determine the char ASCII number
  secret_messages.map do |x|
      if x.ord >= "A".ord && x.ord <= "M".ord then
          (x.ord+13).chr
      elsif x.ord >= "N".ord && x.ord <= "Z".ord then
          (x.ord-13).chr
      elsif x.ord >= "a".ord && x.ord <= "m".ord then
          (x.ord+13).chr
      elsif x.ord >= "n".ord && x.ord <= "z".ord then
          (x.ord-13).chr
      else
          x
      end
  end
end

answer = rot13("Why did the chicken cross the road?".chars)
puts answer.join()
answer = rot13("Gb trg gb gur bgure fvqr!".chars)
puts answer.join()
