# Anagrams are two words with exactly the same letters. Order does not matter. Define a method that, given two strings, returns a boolean indicating whether they are anagrams.
def anagrams?(str1, str2)

end

# An isogram is a word of only non-repeating letters. Define a method that, given two isograms of the same length, returns an array of two elements indicating matches: the first number is the number of letters matched in both words at the same position, and the second is the number of letters matched in both words but not in the same position.
def isogram_matcher(isogram1, isogram2)

end

# You have a panoramic view in front of you, but you only can take a picture of two landmarks at a time (your camera is small). You want to capture every pair of landmarks that are next to each other. Define a method that, given an array of landmarks, returns an array of every adjacent pair from left to right. Assume the panorama wraps around.
def panoramic_pairs(landmarks)

end

# Xbonacci

# Define a Xbonacci method that works similarly to the fibonacci sequence.
# The fibonacci sequence takes the previous two numbers in the sequence and adds
# them together to create the next number.
#
# First five fibonacci numbers = [1, 1, 2, 3, 5]
# The fourth fibonacci number (3) is the sum of the two numbers before it
# (1 and 2).
#
# In Xbonacci, the sum of the previous X numbers (instead of the previous 2 numbers)
# of the sequence becomes the next number in the sequence.
#
# The method will take two arguments: the starting sequence with X number of
# elements and an integer N. The method will return the first N elements in the given
# sequence.
#
# xbonacci([1, 1], 5) => [1, 1, 2, 3, 5]
# xbonacci([1, 1, 1, 1], 8) => [1, 1, 1, 1, 4, 7, 13, 25]
#
# X is the length of the starting sequence.
#
# number_of_xbonacci_numbers_to_return is the same as N.

def xbonacci(starting_sequence, number_of_xbonacci_numbers_to_return)

end
$success_count = 0
$failure_count = 0

def deep_dup(arr)
  arr.inject([]) { |acc, el| el.is_a?(Array) ? acc << deep_dup(el) : acc << el }
end

def note_success(returned, invocation, expectation)
  puts "success: #{invocation} => #{expectation}"
  $success_count += 1
end

def note_failure(returned, invocation, expectation)
  puts "failure: #{invocation}: expected #{expectation}, returned #{returned}"
  $failure_count += 1
end

def format_args(args)
  o_args = deep_dup(args)
  o_args.map! do |arg|
    arg = prettify(arg)
    arg.class == Array ? arg.to_s : arg
  end
  o_args.join(', ')
end

def prettify(statement)
  case statement
  when Float
    statement.round(5)
  when String
    "\"#{statement}\""
  when NilClass
    "nil"
  else
    statement
  end
end

def equality_test(returned, invocation, expectation)
  if returned == expectation && returned.class == expectation.class
    note_success(returned, invocation, expectation)
  else
    note_failure(returned, invocation, expectation)
  end
end

def identity_test(returned, invocation, expectation, args)
  if returned.__id__ == args[0].__id__
    equality_test(returned, invocation, expectation)
  else
    puts "failure: #{invocation}: You did not mutate the original array!"
    $failure_count += 1
  end
end

def method_missing(method_name, *args)
  method_name = method_name.to_s
  expectation = args[-1]
  args = args[0...-1]
  if method_name.start_with?("test_")
    tested_method = method_name[5..-1]
    print_test(tested_method, args, expectation)
  else
    method_name = method_name.to_sym
    super
  end
end

def print_test(method_name, args, expectation)
  returned = self.send(method_name, *args)
  returned = prettify(returned)
  expectation = prettify(expectation)
  args_statement = format_args(args)
  invocation = "#{method_name}(#{args_statement})"
  method_name.include?("!") ? identity_test(returned, invocation, expectation, args) : equality_test(returned, invocation, expectation)
  rescue Exception => e
    puts "failure: #{invocation} threw #{e}"
    puts e.backtrace.select {|t| !t.include?("method_missing") && !t.include?("print_test")}
    $failure_count += 1
end

landmarks_1 = ["House", "Horse"]
pairs_1 = [["House", "Horse"], ["Horse", "House"]]
landmarks_2 = ["Tree", "Mountain", "Ocean", "Cottage"]
pairs_2 = [["Tree", "Mountain"], ["Mountain", "Ocean"], ["Ocean", "Cottage"], ["Cottage", "Tree"]]

puts "\wanagrams?:\n" + "*" * 15 + "\n"
test_anagrams?("desert", "rested", true)
test_anagrams?("banana", "fofanna", false)
puts "\wisogram_matcher:\n" + "*" * 15 + "\n"
test_isogram_matcher("or", "go", [0,1])
test_isogram_matcher("unpredictably", "hydromagnetic", [1,8])
puts "\wpanoramic_pairs:\n" + "*" * 15 + "\n"
test_panoramic_pairs(landmarks_1, pairs_1)
test_panoramic_pairs(landmarks_2, pairs_2)
puts "\wxbonacci:\n" + "*" * 15 + "\n"
test_xbonacci([1, 1], 5, [1, 1, 2, 3, 5])
test_xbonacci([1, 1, 1, 1], 8, [1, 1, 1, 1, 4, 7, 13, 25])
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0


###SOLUTION
# def anagrams?(str1, str2)
#   str1.chars.sort == str2.chars.sort

# end

# def isogram_matcher(isogram1, isogram2)
#   idx_match = 0
#   letter_match = 0

#   isogram1.chars.each_index do |i|
#     if isogram1[i] == isogram2[i]
#       idx_match += 1
#     elsif isogram2.include?(isogram1[i])
#       letter_match += 1
#     end
#   end

#   [idx_match, letter_match]
# end

# def panoramic_pairs(landmarks)
#   pairs = []

#   landmarks.each_with_index do |landmark, idx|
#     next_landmark = landmarks[idx + 1] || landmarks[0] # The || landmarks[0] allows us to wrap!
#     pairs << [landmark, next_landmark]
#   end

#   pairs
# end

# def xbonacci(starting_sequence, n)
#   result = starting_sequence
#   num_to_sum = starting_sequence.length

#   if n <= starting_sequence.length
#     return starting_sequence[0...n]
#   end

#   until result.length == n
#     last_n_numbers = result[-num_to_sum..-1]
#     sum = last_n_numbers.reduce(:+)
#     result << sum
#   end

#   result
# end