# Define a method that, given an array of numbers, 
# returns another array with each of the argument's numbers multiplied by two. 
# Do not modify the original array.
def array_times_two(arr)
  arr.map{|x| x*2}
  # arr2 = []
  # arr.each do |x|
  #   arr2 << x*2
  # end
  # return arr2
end

# Define a method that, given an array of numbers, mulitplies each of its elemnets by two. 
# This SHOULD mutate the original array!
def array_times_two!(arr)
  arr.map!{|x| x*2}
end

# Define a method that substitutes all five-letter words in its argument with "#####" and returns the result. 
# Do not consider punctuation.
# redact_five_letter_words("long longer longest longy") => "long longer longest #####"
def redact_five_letter_words(str)
  str_new = []
  str.split.each do |word|
  if word.length == 5
    str_new << '#####'
  else
    str_new << word
  end
end
str_new.join(' ')
end

# Define a method that takes an array of pairs (two-element arrays) and returns the pair with the greatest sum.
# largest_pair([[-4,0],[-2,-1],[-3,2]]) => [-3,2]
# largest_pair([[1,0]]) => [1,0]
def largest_pair(pairs_array)
  sum = pairs_array.each.map{|pair| pair.reduce(:+)}
  return pairs_array[sum.find_index(sum.max)]
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

puts "\narray_times_two:\n" + "*" * 15 + "\n"
test_array_times_two([1,2,3].freeze, [2,4,6])
test_array_times_two([].freeze, [])
puts "\narray_times_two!:\n" + "*" * 15 + "\n"
test_array_times_two!([1,2,3], [2,4,6])
test_array_times_two!([], [])
puts "\nredact_five_letter_words:\n" + "*" * 15 + "\n"
test_redact_five_letter_words("long longer longest longy", "long longer longest #####")
test_redact_five_letter_words("Full fathom five thy father lies;/ Of his bones are coral made", "Full fathom five thy father lies;/ Of his ##### are ##### made")
puts "\nlargest_pair:\n" + "*" * 15 + "\n"
test_largest_pair([[1,0]], [1,0])
test_largest_pair([[-4,0],[-2,-1],[-3,2]], [-3,2])

puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0