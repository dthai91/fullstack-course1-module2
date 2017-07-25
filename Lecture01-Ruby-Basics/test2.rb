# Write a method that returns the number of vowels in its argument

vowels = ["a", "e", "i", "o", "u"]

# def num_vowels(str)
#   # your code goes here
#   count = 0
#   vowels = ["a", "e", "i", "o", "u"]
#   str.split("")
# end
# str = 'aeiozh'
# count = 0
# str.each_char.map{|ch| count = count + 1 if str.include?(ch)}
# count

str = 'abcd'
p  str = str.downcase.split("")
p str.length == str.uniq.length

# Write a method that is functionally equivalent to the rotate(offset) method of arrays. offset=1 ensures that the value of offset is 1 if no argument is provided. 
# HINT: use the take(num) and drop(num) methods. You won't need much code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here
  
end