# Define a method, #e_words(str), that accepts a string as an argument. Your method return the number of words in the string that end with the letter "e".
# e_words("tree") => 1
# e_words("Let be be finale of seem.") => 3
count = 0
int = 1231
#p 1231.to_s.split('').map{|ch| reduce(}	
#p int.to_s.split('').each.map {|ch| ch.to_i}.reduce(:+) == 7 


def magic_number?(n)
  n.to_s.split('').each.map {|ch| ch.to_i}.reduce(:+) == 7 
end

p magic_number?(7)
p magic_number?(34)
p magic_number?(25)
p magic_number?(60)