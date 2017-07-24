<<<<<<< HEAD
# Define a method that returns a boolean indicating whether 
# any two elements in the argument (an array) sum to 0.
def sum0(arr)
	#1 combination of 2
	#map sum to each, include 0?
	p arr.combination(2).map{|total| total.reduce(:+)}.include?(0)
end

sum0([0,2,4,5,7,8])


def twosumzero?(arr)
	i = 0 
	while i < arr.length
		j = i + 1
		while j < arr.length
			if arr[i] + arr[j] == 0
				p arr[i],arr[j]
				return true
			end
			j = j + 1
		end
		i = i + 1
	end
end
p twosumzero?([0,2,4,5,7,8])
=======
<<<<<<< HEAD
# p blasphemous_characters = ["Robb", "Sansa", "Arya", "Bran", "Rickon"]
# p blasphemous_characters[0] = "Rick"
# p blasphemous_characters #=> ["Rick", "Sansa", "Arya", "Bran", "Rickon"]

# p blasphemous_characters[3..-1]# = "Morty", "Snuffles" # this is called multiple assignment
# #p blasphemous_characters #=> ["Rick", "Sansa", "Arya", "Morty", "Snuffles"]

# p (-5..-1).to_a.

# traversed_thrice_is_all_right = [1, 2, 3]
# traversed_thrice_is_all_right.each_index do |idx|
#   puts "my argument is #{idx}"
#   puts traversed_thrice_is_all_right[idx]
# end #=> [1, 2, 3]

"To strive, to seek, to find, and not to yield.".each_char do |ch|
    puts "Who's talking about yield?"
    puts "That topic's for a later date!"
  end
=======
u = " unity "
i = "in the "
k = "kangaroo community"
# "1 unity in the kangaroo community"
p 1.to_s + u + i + k
p 1.to_s + " unity " << i << k
p 1.to_s + " " + k[-5..-1] + " " + i + k
>>>>>>> a9a1509e432ca4ff7228e9a239518917c1ba9b93
>>>>>>> 4693690499fd8cb8a353cf66f3cdbb4c2be5c90c
