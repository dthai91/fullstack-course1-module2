#JS Challenge 2
# Define a method that returns the sum of all the non-negative integers up to and including its argument.
# sum_to(3) => 6
def sum_to(int)
	sum = 0
	i = 0
	while i <= int
		sum += i
		i += 1
	end
	return sum 
end

# A magic number is a number whose digits, when added together, sum to 7, e.g., 34. Define a method that returns an array of the first n magic numbers. You may wish to write a helper method that returns a boolean indicating whether a number is magic.
# magic_numbers(3) => [7, 16, 25]
def magic_number?(n)
	n.to_s.split('').each.map{|char| char.to_i}.reduce(:+) == 7
end

def magic_numbers(n)
	ls = []
	return ls if n == 0
	i = 0
	while ls.length < n
		ls << i if magic_number?(i)
		i = i + 1
	end
	return ls
end

# Define a method that given an array, 
# returns another array of only the unique elements from the first. 
# Do not use the built-in uniq method.

# uniq([5, 5, 5, 5]) => [5]
# uniq([1, 2, 1, 3, 3]) => [1, 2, 3]
def uniq(arr)
	ls = []
	arr.each do |x|
		ls << x if !(ls.include?(x))
	end
	return ls
end

# Define a method that receives two arrays as arguments and 
# returns a new array of arguments unique among both arrays 
# (but not necessarily within the array it occurs). 
# Maintain original (intra- and inter-array) order.

# all_uniqs([1, 1, 3, 6], [2, 3, 6]) => [1, 2]
# all_uniqs([1, 2, 3], [1, 2, 3]) => []
def all_uniqs(arr1, arr2)
	ls = []
	(arr1 | arr2).each do |x|
		ls << x if ((arr1.include?(x)&& !arr2.include?(x)) || (arr2.include?(x)&& !arr1.include?(x)))
	end
	return ls
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

puts "\nsum_to:\n" + "*" * 15 + "\n"
test_sum_to(3, 6)
test_sum_to(0, 0)
puts "\nmagic_numbers:\n" + "*" * 15 + "\n"
test_magic_numbers(3, [7, 16, 25])
test_magic_numbers(0, [])
puts "\nuniq:\n" + "*" * 15 + "\n"
test_uniq([1, 2, 1, 3, 3], [1,2,3])
test_uniq([], [])
puts "\nall_uniqs:\n" + "*" * 15 + "\n"
test_all_uniqs([1,3,6], [2,3,6], [1,2])
test_all_uniqs([1,2,3], [1,2,3], [])
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0