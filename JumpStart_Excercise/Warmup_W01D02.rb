# def pizza_slices(circumference, crust_length)
# 	(circumference.to_f/crust_length).round(3)
# end

# puts "---------Pizza Slices----------"
# puts pizza_slices(100, 3) == 33.333
# puts pizza_slices(30, 4) == 7.5
# puts pizza_slices(5000, 135) == 37.037



# # ---------------- Switch Roles! ----------------



# def identify_this(obj)
# 	type_obj = obj.class
# 	return "This ruby object is a %s!" % [type_obj]
# end

# puts "---------Identify This----------"
# puts identify_this(100) == "This ruby object is a Fixnum!"
# puts identify_this("ruby") == "This ruby object is a String!"
# puts identify_this(1.0) == "This ruby object is a Float!"
# puts identify_this([]) == "This ruby object is a Array!"


# # ----------------- Read the solutions!



# Vowel Censor
# ----------------------------------------
# Write the function vowel_censor that takes in a string and replaces
# any vowels in it with an "X". Do not modify the original string.




def vowel_censor(string)
	string.gsub(/[aeiouAEIOU]/,'X')
end

puts "---------Vowel Censor----------"
puts vowel_censor("Let's order a pizza") == "LXt's XrdXr X pXzzX"
puts vowel_censor("Nitwit, blubber, oddment, tweak") == "NXtwXt, blXbbXr, XddmXnt, twXXk"
puts vowel_censor("Supercalifragilisticexpialidocious") == "SXpXrcXlXfrXgXlXstXcXxpXXlXdXcXXXs"

# ----------------- Switch Roles!

def array_print_10
end
# Test your method by calling it! Type "array_print_10" below:
# YOUR TEST HERE

# Write a method, #range_print_10, that prints the numbers 0 - 9 using a range
# and the each method. Remember to test your method by calling it.

def range_print_10
	(0..9).each do |x|
		puts x
	end
end

# Write a method, #integer_print_10, that prints the numbers 0 - 9 using an integer
# and the times method. Remember to test your method by calling it.

def integer_print_10
	
end


# ----------------- Read the solutions!



# With regex
def vowel_censor(string)
  string.gsub(/[aeiouAEIOU]/, 'X')
end

# Without regex
def vowel_censor(string)
  vowels = ['a', 'e', 'i', 'o', 'u']
  new_string = ""
  string.each_char do |c|
    if vowels.include?(c)
      new_string << "X"
    else
      new_string << c
    end
  end
  new_string
end

## Discussion Topics
#   * NOTE: you do not need to know regex to make it through jumpstart, but it is a nice tool!
#   * What does the #each_char method do?
#   * What is the name of this operator '<<' and what string method does it perform?






# Print 10
# ----------------------------------------
# Write a method, #array_print_10, that puts the numbers 0 - 9 using an array
# and the each method

def array_print_10
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].each do |n|
    puts n
  end
end

# Write a method, #range_print_10, that prints the numbers 0 - 9 using a range
# and the each method

def range_print_10
  (0..9).each do |n|
    puts n
  end
end

# Write a method, #integer_print_10, that prints the numbers 0 - 9 using an integer
# and the times method

def integer_print_10
  10.times do |n|
    puts n
  end
end

## Discussion topics:
#   * Which of these loops did you find easiest to write?
