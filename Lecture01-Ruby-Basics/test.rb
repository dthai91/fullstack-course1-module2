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
