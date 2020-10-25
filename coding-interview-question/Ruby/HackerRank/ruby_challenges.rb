# print the hello world
print ("Hello World!!")


# we have to check whether a given number a is within the range b and c (where b <= c, and both inclusive ).

a.range?(b, c)

# You've updated the score of every HackerRank user who participated in a contest. Sometimes, HackerRank admins also participate in a given contest but care is taken to ensure that their submissions do not get any score and their score is not updated.

def scoring(array)
    
  for i in 0..array.length-1
    array[i].update_score unless array[i].is_admin? 
  end
end

# or

def scoring(array)
    
  for i in 0..array.length-1
      unless array[i].is_admin?
          array[i].update_score
      end
  end
end




