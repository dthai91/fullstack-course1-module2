# EASY

# Return the argument with all its uppercase characters removed.
def destructive_uppercase(str)
  # your code goes here
  str.split('').delete_if{|char| char == char.upcase}.join
end

# Return the middle character of a string. 
#Return the middle two characters if 
#the word is of even length, 
#e.g. middle_substring("middle") => "dd", middle_substring("mid") => "i"
def middle_substring(str)
  # your code goes here
  return str[str.length/2] if str.length % 2 == 1
  return str[str.length/2-1..str.length/2]
end

# Return the number of vowels in a string.
def num_vowels(str)
  # your code goes here
  vowels = ['a','e','i','o','u']
  count = 0
# 1 line with map str.downcase.each_char.map{|ch| count = count + 1 if vowels.include?(ch)}
  str.downcase.each_char do |x|
    count += 1 if vowels.include?(x)
  end
  return count
end

# Return the factoral of the argument (num!). A number's factorial is the product of all whole numbers between 1 and the number itself. Assume the argument will be > 0.
def factorial(num)
  # your code goes here
  prod = 1
  i = 1
  #return 1 if num == 1
  while i <= num
    prod *= i
    i += 1
  end
  return prod
end


# MEDIUM

# Write your own version of the join method. separator="" ensures that the default argument is "".
def my_join(arr, separator="")
  # your code goes here
  i = 0 
  result = ""
  while i < arr.length
    if i == arr.length - 1
      result = result + arr[i]
    else
      result = result + arr[i] + separator
    end
    i = i + 1
  end
  return result
end

# Write a method that converts its argument to weirdcase, 
# where every odd character is lowercase and every even is uppercase, 
# e.g. weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  # your code goes here
  word = ''
  for i in (0...str.length)
    if i % 2 == 0
      word << str[i].downcase
    else
      word << str[i].upcase
    end
  end
  return word
end

# Reverse all words of five more more letters in a string. 
#Return the resulting string, e.g., reverse_five("Looks like my luck has reversed") 
#=> "skooL like my luck has desrever").
def reverse_five(str)
  # your code goes here
  str.split.each{|word| word.reverse! if word.length>=5}.join(' ')
end

# Return an array of integers from 1 to 30 (inclusive), except for each multiple of 3 replace the integer with "fizz", for each multiple of 5 replace the integer with "buzz", and for each multiple of both 3 and 5, replace the integer with "fizzbuzz".
def fizzbuzz
  # your code goes here
  i = 1
  ls = []
  while i <31
    if i % 15 == 0
      ls << "fizzbuzz"
    elsif i % 5 == 0
      ls << "buzz"
    elsif i % 3 == 0
      ls << "fizz"
    else
      ls << i
    end
    i = i + 1
  end
  return ls      
end


# HARD

# Write a method that returns a new array containing all the elements of the original array in reverse order.
def my_reverse(arr)
  # your code goes here
  ls = []
  i = -1
  return arr if arr.length == 1
  while i >= -arr.length
    ls << arr[i]
    i = i - 1
  end
  return ls
end

# Write a method that returns a boolean indicating whether the argument is prime.
def prime?(num)
  return false if num == 1
  (2..num/2).none?{|i| num % i == 0}
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  # your code goes here
  ls = []
  i = 1
  while i < num+1
    if num % i == 0
      ls << i
    end
    i = i + 1
  end
  return ls
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  # your code goes here
  ls = factors(num)
  ls_new = []
  ls.each do |x|
    ls_new << x if prime?(x)
  end
  return ls_new
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  # your code goes here
  ls = factors(num)
  count = 0
  ls.each{|factor| count += 1 if prime?(factor)}
  return count
end


# EXPERT

# Return the one integer in an array that is even or odd 
# while the rest are of opposite parity, 
# e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)

def oddball(arr)
  # your code goes here
  even_no = []
  odd_no = []
  arr.each do |x|
    if x.even? 
      even_no << x
    else
      odd_no << x
    end
  end
  if even_no.length == 1
    return even_no[0]
  else
    return odd_no[0]
  end
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

fizzbuzzed = [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz",
13, 14, "fizzbuzz", 16, 17, "fizz", 19, "buzz", "fizz", 22, 23, "fizz", "buzz",
26, "fizz", 28, 29, "fizzbuzz"]

puts "\ndestructive_uppercase:\n" + "*" * 15 + "\n"
test_destructive_uppercase("doGgIE", "dog")
test_destructive_uppercase("HI", "")
puts "\nmiddle_substring:\n" + "*" * 15 + "\n"
test_middle_substring("middle", "dd")
test_middle_substring("mid", "i")
puts "\nnum_vowels:\n" + "*" * 15 + "\n"
test_num_vowels("Aruba", 3)
test_num_vowels("bcd", 0)
puts "\nfactorial:\n" + "*" * 15 + "\n"
test_factorial(4, 24)
test_factorial(1, 1)
puts "\nmy_join:\n" + "*" * 15 + "\n"
test_my_join(["k", "i", "t", "t", "y"], "kitty")
test_my_join(["dolla", "dolla"], "$", "dolla$dolla")
puts "\nweirdcase:\n" + "*" * 15 + "\n"
test_weirdcase("chamillionaire", "cHaMiLlIoNaIrE")
puts "\nreverse_five:\n" + "*" * 15 + "\n"
test_reverse_five("Looks like my luck has reversed", "skooL like my luck has desrever")
puts "\nfizzbuzz:\n" + "*" * 15 + "\n"
test_fizzbuzz(fizzbuzzed)
puts "\nmy_reverse:\n" + "*" * 15 + "\n"
test_my_reverse(["a", "b", "c"], ["c", "b", "a"])
test_my_reverse(["a"], ["a"])
puts "\nprime?:\n" + "*" * 15 + "\n"
test_prime?(1, false)
test_prime?(2, true)
test_prime?(53, true)
puts "\nfactors:\n" + "*" * 15 + "\n"
test_factors(1, [1])
test_factors(18, [1, 2, 3, 6, 9, 18])
puts "\nprime_factors:\n" + "*" * 15 + "\n"
test_prime_factors(2, [2])
test_prime_factors(54, [2, 3])
puts "\nnum_prime_factors:\n" + "*" * 15 + "\n"
test_num_prime_factors(2, 1)
test_num_prime_factors(54, 2)
test_num_prime_factors(1, 0)
puts "\noddball:\n" + "*" * 15 + "\n"
test_oddball([1,2,3], 2)
test_oddball([2, 4, 5, 6], 5)
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0
