# Define a method that capitalizes each word of its argument and returns the resulting string.
def capitalize_each_word(str)
  str.split.each{|word| word.capitalize!}.join(' ')
end

# Define a method that takes an array of integers and returns an array of the square of each.
# compute_squares([1, 2, 3, 4]) => [1, 4, 9, 16]
# compute_squares([]) => []
def compute_squares(arr)
  arr.each.map{|x| x**2 }
end

# Define a method that returns a boolean indicating whether any two elements in the argument array sum to 0.
# two_sum_to_zero?([4, 2, 6]) => false
# two_sum_to_zero?([-2, 5, 12, -3, 2]) => true
def two_sum_to_zero?(arr)
  arr.combination(2).map{|pair| pair.reduce(:+)}.include?(0)
end

# Define a method that returns the longest word in its argument.
def longest_word(str)
  lst = str.gsub(/[[:punct:]]/, '').split
  num = []
  lst.each do |word|
    num << word.length
  end
  lst[num.find_index(num.max)]
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

puts "\ncapitalize_each_word:\n" + "*" * 15 + "\n"
test_capitalize_each_word("capitalistic capital is a capital offense!", "Capitalistic Capital Is A Capital Offense!")
test_capitalize_each_word("", "")
puts "\ncompute_squares:\n" + "*" * 15 + "\n"
test_compute_squares([1,2,3,4], [1,4,9,16])
test_compute_squares([], [])
puts "\ntwo_sum_to_zero?:\n" + "*" * 15 + "\n"
test_two_sum_to_zero?([4,2,6,0], false)
test_two_sum_to_zero?([-2,5,12,-3,2], true)
puts "\nlongest_word:\n" + "*" * 15 + "\n"
test_longest_word("Capital is reckless of the health or length of life of the laborer, unless under compulsion from society.", "compulsion")
test_longest_word("Enlightened statesmen will not always be at the helm.", "Enlightened")

puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0
