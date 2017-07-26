# Given an array of words, remove all the occurrences of the letter 'a' in those words and return the resulting array.
def remove_letter_a(words)

end

# An abundant number is less than the sum of its divisors, not including itself. 12's divisors are 1, 2, 3, 4, 6, which sum to 16. xw16 > 12 so 12 is an abundant number.
# Write a method that, given a number, returns a boolean indicating whether that number is abundant.
def abundant?(num)

end

# Return the greatest number that's a factor of both inputs.
# greatest_common_factor(6, 10) => 2
# greatest_common_factor(10, 15) => 5
def greatest_common_factor(first_number, second_number)
  
end

# Write a method that, given a sentence without punctuation or capitalization, returns the word with the greatest number of repeated letters. Return the first word if there's a tie. It doesn't matter how often individual letters repeat, just that they repeat.
# word_with_most_repeats("I took the road less traveled and that has made all the difference") => "difference" because "difference" has two repeated letters, more than the other words.
def word_with_most_repeats(sentence)

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

words_1 = ["blueberry", "apple", "banana", "peach"]
without_a_1 = ["blueberry", "pple", "bnn", "pech"]

words_2 = ["syllabus", "smirk", "salamander", "saaaaaaa"]
without_a_2 = ["syllbus", "smirk", "slmnder", "s"]

puts "\wremove_letter_a:\n" + "*" * 15 + "\n"
test_remove_letter_a(words_1, without_a_1)
test_remove_letter_a(words_2, without_a_2)
puts "\wabundant?:\n" + "*" * 15 + "\n"
test_abundant?(10001, false)
test_abundant?(20000, true)
puts "\wgreatest_common_factor:\n" + "*" * 15 + "\n"
test_greatest_common_factor(4, 7, 1)
test_greatest_common_factor(10, 15, 5)
puts "\wword_with_most_repeats:\n" + "*" * 15 + "\n"
test_word_with_most_repeats("good luck", "good")
test_word_with_most_repeats("what if there is a tie betwixt words", "there")
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0


#SOLUTION
# def remove_letter_a(words)
#   words.map do |word|
#     word.delete("a")
#   end
# end


# def abundant?(num)
#   divisors = find_divisors(num)
#   sum_divisors = array_sum(divisors)
#   sum_divisors > num
# end

# def find_divisors(num)
#   (1...num).select { |divisor| num % divisor == 0 }
# end

# def array_sum(array)
#   array.reduce(0) { |sum, n| sum + n }
# end


# def greatest_common_factor(first_number, second_number)
#   smaller_num = [first_number, second_number].min

#   (1..smaller_num).to_a.reverse.each do |potential_factor|
#     if first_number % potential_factor == 0 &&
#       second_number % potential_factor == 0

#         return potential_factor # the first factor to be returned is the largest
#     end
#   end
# end


# def word_with_most_repeats(sentence)
#   words_and_repeats = {}
#   words = sentence.split

#   words.each do |word|
#     words_and_repeats[word] = count_repeats(word)
#   end

#   largest_count = words_and_repeats.sort_by {|k,v| v}.last.last #find largest count
#   # return the earlier word in the event of a tie
#   words_and_repeats.select {|k,v| v == largest_count}.first.first
# end

# def count_repeats(word)
#   uniq_letters = word.chars.uniq
#   uniq_letters.count do |char|
#     word.count(char) > 1
#   end
# end