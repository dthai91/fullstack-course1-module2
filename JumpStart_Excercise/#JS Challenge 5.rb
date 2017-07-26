# Define a method that returns a boolean indicating whether its argument is a palindrome.
def palindrome?(str)
#  return str.reverse == str
  new_str = ''
  i = -1
  until i < -str.length
    new_str << str[i]
    i -= 1
  end
  return new_str == str

end

# Define a method, boolean_to_binary(arr), that accepts an array of booleans as an argument. Your method should convert the array into a string of 1's (for true values) and 0's (for false values) and return the result.
# boolean_to_binary([true]) => "1"
# boolean_to_binary([true, false, true]) => "101"
def boolean_to_binary(arr)
  result = ''
  i = 0
  while i < arr.length
    result << '1' if arr[i]
    result << '0' if !arr[i]
    i += 1
  end
  return result
end

# Define a method that returns the third-largest element in an array. 
# Assume the argument has at least three elements.
# third_greatest([5, 9, 3, 7, 7, 2, 10]) == 7
def third_largest(arr)
  arr.sort[-3]
end

# Define a method that takes a number of minutes as its argument and returns a string formatted HH:MM. Assume the number of hours is always less than 99.
# time_conversion(90) => "01:30"
# time_conversion(0) => "00:00"
def time_conversion(mins)
  hour = mins/60
  min = mins.modulo(60)
  return '%02d:%02d' %[hour,min]
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

puts "\npalindrome?:\n" + "*" * 15 + "\n"
test_palindrome?("evitative", true)
test_palindrome?("revolver", false)
puts "\nboolean_to_binary:\n" + "*" * 15 + "\n"
test_boolean_to_binary([false], "0")
test_boolean_to_binary([false, true, false], "010")
puts "\nthird_largest:\n" + "*" * 15 + "\n"
test_third_largest([5, 9, 3, 7, 7, 2, 10], 7)
test_third_largest([0,0,0], 0)
puts "\ntime_conversion:\n" + "*" * 15 + "\n"
test_time_conversion(90, "01:30")
test_time_conversion(0, "00:00")

puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0