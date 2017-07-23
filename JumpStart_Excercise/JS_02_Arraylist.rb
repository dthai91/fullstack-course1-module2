# Reverse Digits

# Define a method, #reverse_digits(int), that reverses the digits of its argument
# and returns the resulting number.
def reverse_digits(int)
  int.to_s.reverse.to_i
end

puts "-------Reverse Digits-------"
puts reverse_digits(1) == 1
puts reverse_digits(123) == 321
puts reverse_digits(1005) == 5001
puts reverse_digits(12345678) == 87654321

# ------------------------------------------------------------------------------

# Thirds Product

# Define a method, #thirds_product(array), that accepts an array of integers as an
# argument. Your method should return the product of every third element multiplied
# together. It should return 1 if there is no third element.

# ex: thirds_product([0, 1, 2, 3, 4, 5, 6, 7, 8]) ==> 2 * 5 * 8 == 80


def thirds_product(array)
  return 1 if array.length < 3
  
  count = 2
  p = 1
  while count < array.length
    p *= array[count]
    count += 3
  end 
  p
end

puts "-------Thirds Product-------"
puts thirds_product([1, 2]) == 1
puts thirds_product([1, 2, 0]) == 0
puts thirds_product([0, 1, 2, 3, 4, 5]) == 10
puts thirds_product([1, 2, 5, 3, 4, 2, 6, 4, 2]) == 20

# ------------------------------------------------------------------------------

# How Many Likes?

# Define a method, #how_many_likes?(sentence) that accepts a string as an argument.
# Your method should cound the number of times the sentence uses the word "like".

def how_many_likes?(sentence)
  sentence.split.reduce(0) { |acc, word|
    if word == "like"
      acc += 1
    else
      acc
    end
  }
end

puts "-------How Many Likes?-------"
puts how_many_likes?("this sentence is just fine") == 0
puts how_many_likes?("i really like ruby") == 1
puts how_many_likes?("i like really like how ruby works") == 2
puts how_many_likes?("this is like totally like too many like words") == 3

# ------------------------------------------------------------------------------

# Pair Product?

# Define a boolean method, #pair_product?, that accepts two arguments: an array of integers
# and a target_product (an integer). The method returns a boolean indicating whether
# any pair of elements in the array multiplied together equals that product. You
# cannot multiply an element by itself. An element on its own is not a product.

def pair_product?(arr, target_product)
  arr.combination(2).map {|pair| pair.reduce(:*)}.include?(target_product)

end

puts "-------Pair Product?-------"
puts pair_product?([2, 3, 4], 6) == true
puts pair_product?([2, 3, 4], 10) == false
puts pair_product?([1, 6, 7, 8], 1) == false
puts pair_product?([2, 8, 6, 2], 4) == true