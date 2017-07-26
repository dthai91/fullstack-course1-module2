# EASY

# Define a method that returns the sum of all the elements in its argument (an array of numbers).
def array_sum(arr)
	arr.reduce(:+)
end

# Define a method that returns a boolean indicating 
# whether substring is a substring of all the long_strings (an array).
def in_all_strings?(long_strings, substring)
	long_strings.all? {|str| str.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) 
# and returns an array of letters that occur more than once.
def non_unique_letters(string)
  string.split("").select{|char| string.count(char) > 1 }.uniq
end

# Define a method that returns an array of the longest two words (in order) in the method's argument. Ignore punctuation!
def longest_two_words(string)
	string.delete(',.').split.sort_by{|word| word.length}[-2..-1]
end


# MEDIUM

# Define a method that returns an array of letters that do not occur in the method's argument.
def missing_letters(string)
  tbl = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.downcase.split("")
  string = string.delete('!? ').downcase.split("").uniq.sort
  tbl.select {|char| !string.include?(char)}
end

# Define a method that accepts two years 
# and returns an array of the years within that range (inclusive) that have no repeated digits. 
# Hint: helper method?
def no_repeat_years(first_yr, last_yr)
  ls = []
  i = first_yr
  while i < last_yr
  	ls << i if not_repeat_year?(i)
  	i += 1
  end
  return ls
end

def not_repeat_year?(year)
  year.to_s.split("").uniq.length == year.to_s.split("").length
end


# HARD

# Define a method that, given an array of songs at the top of the charts, 
# returns the songs that only stayed on the chart for a week at a time. 
# Each element corresponds to a song at the top of the charts for one particular week.
# Songs CAN reappear on the chart, but if they don't appear in consecutive weeks, they're "one-week wonders."
# Suggested strategy: find the songs that appear multiple times in a row and remove them.
# You may wish to write a helper method no_repeats?
def one_week_wonders(songs)
	i = 1
	ls = []
	while i < songs.length
		ls << songs[i] if songs[i-1] == songs[i]
		i +=1
	end
	ls = ls.uniq
	songs.select{|song| !ls.include?(song)}.uniq
end

def no_repeats?(song_name, songs)
  
end


# Define a method that, given a string of words, 
# returns the word that has the letter "c" closest to the end of it. 
# If there's a tie, return the earlier word. Ignore punctuation. 
# If there's no "c", return an empty string. 
# You may wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
 	string = string.delete("'.").split.select{|char| char.include?('c')}
 	ls = string.each.map{|word| c_distance(word)} #word.split("").reverse.find_index('c')}
	string[ls.find_index(ls.min)]
end

def c_distance(word)
	word.split("").reverse.find_index('c')
end


# Define a method that, given an array of numbers, 
# returns a nested array of two-element arrays 
# that each contain the start and end indices of whenever a number appears multiple times in a row.
# repeated_number_ranges([1, 1, 2]) => [[0, 1]]
# repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]
def repeated_number_ranges(arr)
  
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


el_tigre = "Tyger! Tyger! burning bright In the forest of the night What immortal hand or eye Could frame thy fearful symmetry?"
el_ciervo = "Stately, plump Buck Mulligan came from the stairhead, bearing a bowl of lather on which a mirror and a razor lay crossed."

top_hits_1 = ["Call Me Maybe", "Protect Ya Neck", "Call Me Maybe", "Protect Ya Neck", "Protect Ya Neck"]
one_week_wonders_1 = ["Call Me Maybe"]

top_hits_2 = ["Beat It", "Beat It", "Careless Whisper", "Beat It", "Baby", "Baby", "Never Gonna Give You Up", "Uptown Funk", "Uptown Funk", "Uptown Funk"]
one_week_wonders_2 = ["Careless Whisper", "Never Gonna Give You Up"]

puts "\narray_sum:\n" + "*" * 15 + "\n"
test_array_sum([1,2,3], 6)
test_array_sum([0,0,0], 0)
puts "\nin_all_strings?:\n" + "*" * 15 + "\n"
test_in_all_strings?(["leopold", "leopard", "leonine"], "leo", true)
test_in_all_strings?(["leopold", "leopard", "leonine"], "leop", false)
puts "\nnon_unique_letters:\n" + "*" * 15 + "\n"
test_non_unique_letters("abcdbcd", ["b", "c", "d"])
test_non_unique_letters("abcde", [])
puts "\nlongest_two_words:\n" + "*" * 15 + "\n"
test_longest_two_words(el_ciervo, ["Mulligan", "stairhead"])
test_longest_two_words("yarg barg yaarga barga", ["barga", "yaarga"])
puts "\nmissing_letters:\n" + "*" * 15 + "\n"
test_missing_letters(el_tigre, ["j", "k", "p", "q", "v", "x", "z"])
test_missing_letters(("A".."Z").to_a.join, [])
puts "\nno_repeat_years:\n" + "*" * 15 + "\n"
test_no_repeat_years(1990, 2000, [])
test_no_repeat_years(2016, 2020,[2016, 2017, 2018, 2019])
puts "\none_week_wonders:\n" + "*" * 15 + "\n"
test_one_week_wonders(top_hits_1, one_week_wonders_1)
test_one_week_wonders(top_hits_2, one_week_wonders_2)
puts "\nfor_cs_sake:\n" + "*" * 15 + "\n"
test_for_cs_sake("r is among the most menacing of sounds. That's why they call it murder and not muckduck.",  "muckduck")
test_for_cs_sake("muckduck cluck duck.", "muckduck")
puts "\nrepeated_number_ranges:\n" + "*" * 15 + "\n"
test_repeated_number_ranges([1, 1, 2], [[0, 1]])
test_repeated_number_ranges([8, 7, 7, 14, 12, 12, 12, 12, 21], [[1, 2], [4, 7]])
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0