# <<<<<<< HEAD
# # Define a method, #e_words(str), that accepts a string as an argument. Your method return the number of words in the string that end with the letter "e".
# # e_words("tree") => 1
# # e_words("Let be be finale of seem.") => 3
# count = 0
# int = 1231
# #p 1231.to_s.split('').map{|ch| reduce(}	
# #p int.to_s.split('').each.map {|ch| ch.to_i}.reduce(:+) == 7 
# =======
# <<<<<<< HEAD
# # Define a method that returns a boolean indicating whether 
# # any two elements in the argument (an array) sum to 0.
# def sum0(arr)
# 	#1 combination of 2
# 	#map sum to each, include 0?
# 	p arr.combination(2).map{|total| total.reduce(:+)}.include?(0)
# end

# sum0([0,2,4,5,7,8])


# def twosumzero?(arr)
# 	i = 0 
# 	while i < arr.length
# 		j = i + 1
# 		while j < arr.length
# 			if arr[i] + arr[j] == 0
# 				p arr[i],arr[j]
# 				return true
# 			end
# 			j = j + 1
# 		end
# 		i = i + 1
# 	end
# end
# p twosumzero?([0,2,4,5,7,8])
# =======
# <<<<<<< HEAD
# # p blasphemous_characters = ["Robb", "Sansa", "Arya", "Bran", "Rickon"]
# # p blasphemous_characters[0] = "Rick"
# # p blasphemous_characters #=> ["Rick", "Sansa", "Arya", "Bran", "Rickon"]
# >>>>>>> d4b78e1cc70a5d77e8cd672baa854704367997cd


# def magic_number?(n)
#   n.to_s.split('').each.map {|ch| ch.to_i}.reduce(:+) == 7 
# end

# <<<<<<< HEAD
# p magic_number?(7)
# p magic_number?(34)
# p magic_number?(25)
# p magic_number?(60)
# =======
# # traversed_thrice_is_all_right = [1, 2, 3]
# # traversed_thrice_is_all_right.each_index do |idx|
# #   puts "my argument is #{idx}"
# #   puts traversed_thrice_is_all_right[idx]
# # end #=> [1, 2, 3]
arr = ['a', 'b', 'c', 'd', 'e', 'f']
# # p arr.take(3)
# # p arr.drop(2)

# # def my_rotate(arr, offset=1)
# #   p arr.drop(offset) + arr.take(offset)
# # end

# # p 'doGgIE'.split('').delete_if{|char| char == char.upcase}.join




# # vowels = ['a','e','i','o','u']
# # count = 0
# # p 'Aruba'.downcase.each_char.map{|ch| count = count + 1 if vowels.include?(ch)}
# # p count

# # ls = ''
# # ["k", "i", "t", "t", "y"].each do |x|
# # 	ls = ls + x
# # end
# # # p ls

# # arr = "Looks like my luck has reversed"
# # ls = ''
# # i = -1
# # while i > -arr.length
# # 	ls += arr[i]
# # 	i -= 1
# # end


# # num = 125
# # for i in (1..Math.sqrt(num).to_i)
# # 	if num % i == 0
# # 		return true
# # 	else
# # 		return false
# # end


# # def factors(num)
# #   # your code goes here
# #   ls = []
# #   i = 1
# #   while i < num+1
# #     if num % i == 0
# #       ls << i
# #     end
# #   	i = i + 1
# #   end
# #   return ls
# # end

# # p ls = factors(54)
# # count = 0

# # arr = ["hello", "bye", "greetings"]
# # tgt = 'byebye'
# # arr_target = []
# # i = 0
# # while i < arr.length
# # 	j = i + 1
# # 	while j < arr.length
# # 		arr_target << arr[i]+arr[j]
# # 		arr_target << arr[j]+arr[i]
# # 		j += 1
# # 	end
# # 	i = i + 1
# # end
# # p arr_target#.include?(tgt)




# # def prime?(num)
# # 	return false if num == 1
# #   (2..num/2).none?{|i| num % i == 0}
# # end

# # # Write a method that returns a sorted array of the factors of its argument.
# # def factors(num)
# #   # your code goes here
# #   ls = []
# #   i = 1
# #   while i < num+1
# #     if num % i == 0
# #       ls << i
# #     end
# #     i = i + 1
# #   end
# #   return ls
# # end

# # p prime?(24)

# # ls = factors(54)
# # ls_new = []

# # ls.each do |x|
# # 	ls_new << x if prime?(x)
# # end

# # p ls_new

# # #prime_factors(54): expected [2, 3]

# # # Write a method that returns a sorted array of the prime factors of its argument.
# # def prime_factors(num)
# #   # your code goes here
# #   ls = factors(num)
# # end



# p 'dolla ' * 5

# # def compound_words?(array, target)
# #   # your code here
# #   array.combination(2).each{|x,y| }
# # end

# # arr = ["dolla", "dolla", "dolla","dolla"]
# # sep = "-"
# # p arr.length
# # p arr[0]
# # p arr[0] + sep + arr[1] + sep + arr[2] + sep + arr[3]
# # # Write your own version of the join method. separator="" ensures that the default argument is "".
# def my_join(arr, separator="")
#   # your code goes here
#   i = 0 
#   result = ""
#   while i < arr.length
#   	if i == arr.length - 1
#   		result = result + arr[i]
#   	else
#   		result = result + arr[i] + separator
#   	end
#   	i = i + 1
#   end
#   return result
# end

# p my_join(["k", "i", "t", "t", "y"])
# p my_join(["dolla", "dolla"], "$")#, "dolla$dolla")

# "To strive, to seek, to find, and not to yield.".each_char do |ch|
#     puts "Who's talking about yield?"
#     puts "That topic's for a later date!"
#   end
# =======
# u = " unity "
# i = "in the "
# k = "kangaroo community"
# # "1 unity in the kangaroo community"
# p 1.to_s + u + i + k
# p 1.to_s + " unity " << i << k
# p 1.to_s + " " + k[-5..-1] + " " + i + k
# >>>>>>> a9a1509e432ca4ff7228e9a239518917c1ba9b93
# >>>>>>> 4693690499fd8cb8a353cf66f3cdbb4c2be5c90c
# >>>>>>> d4b78e1cc70a5d77e8cd672baa854704367997cd


# # Write a method that returns the number of vowels in its argument

# vowels = ["a", "e", "i", "o", "u"]

# # def num_vowels(str)
# #   # your code goes here
# #   count = 0
# #   vowels = ["a", "e", "i", "o", "u"]
# #   str.split("")
# # end
# # str = 'aeiozh'
# # count = 0
# # str.each_char.map{|ch| count = count + 1 if str.include?(ch)}
# # count

# str = 'abcd'
# p  str = str.downcase.split("")
# p str.length == str.uniq.length

# Write a method that is functionally equivalent to the rotate(offset) method of arrays. offset=1 ensures that the value of offset is 1 if no argument is provided. 
# HINT: use the take(num) and drop(num) methods. You won't need much code, but the solution is tricky!
# def my_rotate(arr, offset=1)
  # your code goes here
  
# end

# def is_slippery?(n)
# 	# if n.modulo(15) == 0
# 	#  return false
# 	# elsif n.modulo(3) == 0 || n.modulo(5) == 0
# 	#  return true
# 	# else
# 	# return false
# 	# end 
# 	(n.modulo(3) == 0 || n.modulo(5)==0) && (n.modulo(15)!=0)
# end

# def slippery_numbers(n)
# 	lst = []
# 	i = 1
# 	while lst.length < n
# 		lst << i if is_slippery?(i)
# 		i = i + 1
# 	end
# 	return lst
# end

# p slippery_numbers(7)

# Define a method, #e_words(str), that accepts a string as an argument. 
#Your method return the number of words in the string that end with the letter "e".
# e_words("tree") => 1
# e_words("Let be be finale of seem.") => 3


# def e_words(str)
# str = "Let be be finale of seem."
# count = 0
# str.delete('.').split.each do |word|
# 	count += 1 if word[-1] =='e'
# end
# p count
# end


# p  !('1024'.to_s.split('').each.map {|ch| ch.to_i}.reduce(:+) == 7 )
# ls = []

# ls << '1025' if '1025'.to_s.split('').each.map {|ch| ch.to_i}.reduce(:+) == 7

# p ls

# arr1 = [1,2,3,4]
# arr2 = [3,4,5,6]
# # p arr1|arr2
# ls = ''
# p ls '1738'.to_s[-1]
# def pair_product?(arr, target_product)
# # => 1 line with map reduce
# #	arr.combination(2).map{|pair| pair.reduce(:*)}.include?target_product
# 	ls = []
# 	i = 0
# 	while i < arr.length
# 		p "i start-loop: %d" % [i]
# 		j = i + 1
# 			while j < arr.length
# 				ls << arr[i] * arr[j]
# 				p "j start-loop: %d" % [j]
# 				p "arr.i is %d" % [arr[i]]
# 				p "arr.j is %d" % [arr[j]]
# 				j += 1
# 				p "j end-loop: %d" % [j]				
# 			end
# 		i += 1
# 		p "i end-loop: %d" % [i]
# 	end
# 	return ls
# 	return ls.include?(target_product)
# end
# def num_vowels(str)
#   # your code goes here
#   vowels = ['a','e','i','o','u']
#   count = 0
# #  str.downcase.each_char.map{|ch| count = count + 1 if vowels.include?(ch)}
#   str.downcase.each_char do |x|
#   	count += 1 if vowels.include?(x)
#   end
#   return count
# end

# p num_vowels('Arubaailoy')


# def slice_between_vowels(word)
# 	vowels = ["a","e","i","o","u"]
# 	word = word.split('')
# 	ls = []
# 	for i in (0..word.length)
# 		ls << i if vowels.include?(word[i])
# 	end
# 	return "" if 2 >= ls.length
#    	return word[(ls[0]+1)...ls[-1]].join
# end


# p slice_between_vowels("serendipity") #=> "rendip"
# p slice_between_vowels("train") #=> ""
# p slice_between_vowels("dog") #=> ""
# arr = [1,2,3]
# p arr.map{|x| x*2}
# arr = "Full fathom five thy father lies;/ Of his bones are coral made"
# arr2 = []
# arr.split.each do |word|
# 	if word.length == 5
# 		arr2 << '##### '
# 	else
# 		arr2 << word
# 	end
# end
# p arr2.join(' ')
# p arr

# largest_pair([[-4,0],[-2,-1],[-3,2]]) => [-3,2]
# largest_pair([[1,0]]) => [1,0]
# def largest_pair(pairs_array)
  
# end
# arr = [[-4,0],[-2,-1],[-3,2]]
# sum = arr.each.map{|pair| pair.reduce(:+)}
# return arr[sum.find_index(sum.max)]

# mins = 90
# hour = mins/60
# minute = mins.modulo(60)

# p '%02d:%02d' %[hour,minute]


# p arr.each.map{|x| x**2 }


# str = "Capital is reckless of the health or length of life of the laborer, unless under compulsion from society."
# #remove punction from a string
# lst = str.gsub(/[[:punct:]]/, '').split
# num = []
# lst.each do |word|
# 	num << word.length
# end
# lst[num.find_index(num.max)]


# def three_digit_format(n)
#   # your code here
#   len = n.to_s.length
#   if len == 3
#   	n.to_s
#   elsif len == 2
#   	'0'+n.to_s
#   else
#   	'00'+n.to_s
#   end
# end


# def three_digit_format(n)
# 	'%03d' %[n]
# end

# puts "------Three Digit Format------"
# puts three_digit_format(100) == "100"
# puts three_digit_format(15) == "015"
# puts three_digit_format(6) == "006"



# 10.times do |n|
#     puts n
# end

#print [1,2,3] # no new line

# p 'bye'

# p [2, 4, 4].reduce([88]) {|acc, el| acc << acc.last / el}

# p "leopold" =~ /leo/

# str = "yger! Tyger! burning bright In the forest of the night What immortal hand or eye Could frame thy fearful symmetry?"
# # p str.delete(',.').split.sort_by{|word| word.length}[-2..-1]
# tbl = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.downcase.split("")

# p string = str.delete('!? ').downcase.split("").uniq.sort
# p tbl.select{|char| !string.include?(char)}


# str = "r is among the most menacing of sounds. That's why they call it murder and not muckduck."
# str = str.delete("'.").split.select{|char| char.include?('c')}
# ls = str.each.map{|word| word.split("").reverse.find_index('c')}
# p str[ls.find_index(ls.min)]


# def c_distance(word)
# 	word.split("").reverse.find_index('c')
# end
# ls1 = []
# l1 = [1,2,3,4]
# a1 = "1234"
# #p a1.chars.map {|char| ls1 << char.to_i * 2}
# p l1.each



# puts '___'

# ls = []
# p "1234".each_char {|char| ls << char.to_i*2}
# p ls
# def every_other_letter(string)
#   	# your code here
#   	new_w = ''
# 	string.split('').each_with_index do |c, idx|
# 		new_w << c if idx % 2 == 0
# 	end
# 	return new_w
# end
# new_w = ''
# "an apple a day...".split('').each_with_index do |c, idx|
# 	new_w << c if idx % 2 == 0
# end
# p new_w

# puts "------Every Other Letter------"
# puts every_other_letter("abcde") == "ace"
# puts every_other_letter("i heart ruby") == "ihatrb"
# puts every_other_letter("an apple a day...") == "a pl  a.."
def the(a)
					'a good ' + a
				end
puts "now is #{the ''} for all good coders..."