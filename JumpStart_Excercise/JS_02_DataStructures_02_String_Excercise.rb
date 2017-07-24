# EASY

# Write a method that returns a boolean indicating whether an array is
# in sorted order. Use the equality operator (==), which returns a boolean 
# indicating whether its operands are equal, 
# e.g., 2 == 2 => true, ["cat", "dog"] == ["dog", "cat"] => false
def in_order?(arr)
  # your code goes here
  return arr == arr.sort
end


# MEDIUM

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  # your code goes here
  return arr.max - arr.min
end


# HARD 

# Write a method that returns an array of the digits of a non-negative integer in descending order and as strings, e.g., descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  # your code goes here
  return int.to_s.split('').sort.reverse
end

# Write a method that converts an array of ten integers into a phone number in the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  arr = arr.join
  p "(" + arr[0..2].to_s + ") " + arr[3..5].to_s + "-" + arr[6..9].to_s
end

# Write a method that returns the range of a string of comma-separated integers, e.g., str_range("4,1,8") #=> 7
def str_range(str)
  # your code goes here
  str = str.split(',').map{|num| num.to_i}
  return str.max-str.min
end


# DO NOT MODIFY CODE BELOW

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

puts "\nin_order?:\n" + "*" * 15 + "\n"
test_in_order?(["a", "z", "c"], false)
test_in_order?([0, 1, 2], true)
puts "\nrange:\n" + "*" * 15 + "\n"
test_range([-1, 5, 0], 6)
test_range([0, 0], 0)
puts "\ndescending_digits:\n" + "*" * 15 + "\n"
test_descending_digits(4291, ["9", "4", "2", "1"])
test_descending_digits(0, ["0"])
puts "\nto_phone_number:\n" + "*" * 15 + "\n"
test_to_phone_number([1,2,3,4,5,6,7,8,9,0], "(123) 456-7890")
puts "\nstr_range:\n" + "*" * 15 + "\n"
test_str_range("4,1,8", 7)
test_str_range("0,0", 0)
puts "\n"
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0