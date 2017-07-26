# Declaration
simple_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d"}

# Access
simple_hash[0] #=> "a"


simple_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d"}
simple_hash[:mr_monkey_pants] #=> nil



simple_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d"}

# Assignment
simple_hash[0] = "z"

simple_hash #=> {0=>"z", 1=>"b", 2=>"c", 3=>"d"}

increasingly_less_simple_hash = {0=>"z", 1=>"b", 2=>"c", 3=>"d"}
increasingly_less_simple_hash[5] = "w"
increasingly_less_simple_hash #=> {0=>"z", 1=>"b", 2=>"c", 3=>"d", 5=>"w"}


# The formatting is purely for legibility.
nerdy_hash = {
  "fibonacci_numbers" => [0, 1, 1, 2, 3, 5],
  :pre_socratics => ["Thales", "Xenophanes", "Diogenes", "Heraclitus", "Pythagoras"],
  true => "Ruby first appeared in 1995."
}




nerdy_take_two = {
  fibonacci_numbers: [0, 1, 1, 2, 3, 5],
  pre_socratics: ["Thales", "Xenophanes", "Diogenes", "Heraclitus", "Pythagoras"],
  true: "Ruby first appeared in 1995."
}

nerdy_take_two[:true] #=> "Ruby first appeared in 1995."





#METHOD

a_hash_is_like_a_dictionary = {
  "Wittgenstein"=> "The power of language to make everything look the same
    which appears in its crassest form in the dictionary",
  Nabokov: "The reader should have a dictionary."
}

a_hash_is_like_a_dictionary.include?("Wittgenstein") #=> true
a_hash_is_like_a_dictionary.has_value?("Arthur the Aardvark") #=> false
# The keys method returns an array of all the keys in its receiver. The values method returns an array of all the values. The length method returns the number of key-value pairs.
shorter_example_thankfully = {
  a: 0,
  b: 1,
  c: 2
}

shorter_example_thankfully.keys #=> [:a, :b, :c]
shorter_example_thankfully.values #=> [0, 1, 2]
shorter_example_thankfully.length #=> 3
# The to_a method type converts its receiver hash into a nested array of [key, value] arrays. Conversely, one can type convert a nested array of two-element arrays to a hash with the to_h method.
hbo_shows_ranking = {
  "The Wire" => 1,
  "True Detective Season 1" => 2,
  "Westworld" => 3
}

hbo_shows_ranking.to_a #=> [["The Wire", 1], ["True Detective Season 1", 2], ["Westworld", 3]]

animated_ranking = [["South Park", 1], ["Rick and Morty", 2], ["Archer", 3]]
animated_ranking.to_h #=> {"South Park"=>1, "Rick and Morty"=>2, "Archer"=>3}








###Iterators and Enumerables

# Hashes have a different set of iterators than arrays. They share each, but hashes also have the methods each_key and each_value. Hashes don't have an each_index method because they don't have indices! Because hashes store key-value pairs rather than individual elements, the syntax for iterating through them using each differs: the given block takes two arguments, a key and a value.
translations = {
  Latin: "suum cuique",
  English: "to each his own",
  Russian: "каждому свое",
  Spanish: "A cada cual lo suyo"
}

# each takes a block that takes two arguments: a key and value
translations.each {|k, v| puts "#{k}: #{v}"}  

# each_key and each_value take a block that takes one argument: a key or a value
translations.each_key {|k| puts k}
translations.each_value {|v| puts v}



# Hashes have access to all the enumerables you've hopefully grown to love except for each_with_index and with_index. Like each, the given block takes two arguments--a key and a value--when the receiver is a hash.
silly_yllis = {
  "stressed"=>"desserts",
  "redrum"=>"murder",
  "god"=>"dog",
  "erehwon"=>"nowhere"
}

silly_yllis.all? {|k, v| k == v.reverse} #=> true
silly_yllis.count {|k, v| k != v.reverse} #=> 0

# map still returns an array
silly_yllis.map {|k, v| k + v} #=> ["stresseddesserts", "redrummurder", "goddog", "erehwonnowhere"]

# select returns a hash
silly_yllis.select {|k, v| k.length < 4} #=> {"god" => "dog"}

#With a hash as the receiver, sort_by returns a nested array of [key, value] arrays in the order specified by its block:
  to_be_sorted_by_key = {b: 5, a: 10, c: 20}
  to_be_sorted_by_key.sort_by {|k, v| k} #=> [[:a, 10], [:b, 5], [:c, 20]]




###Counter Hashes

## An alternative syntax for a declaring a hash is Hash.new. The new method takes an optional argument: the default value of each key. When one tries to access a nonexistent key in a hash with a default value, the return value is that default value. Accessing a nonexistent key, however, does not create a new key-value pair. If one doesn't set a default value, accessing a nonexistent key returns nil.
## without a default value
dog_breeds = {"corgi"=>"short and sweet", "labrador"=>"labradorable"}
dog_breeds["Australian cattle dog"] #=> nil

# with a default value
default_cuties = Hash.new("cutie")
default_cuties["vizsla"] #=> "cutie"

# accessing a nonexistent key doesn't alter the hash
default_cuties #=> {}

## Setting a default value of 0 is helpful for creating a counter hash, one that counts the number of occurrences of particular elements or types of elements within a collection. Typically each key is an element in the collection and each value is the number of occurrences of that key. Counter hashes allow one to elegantly solve many complex problems. Here's a counter hash in action:
word_counts = Hash.new(0)

# I removed the punctuation to simplify extracting words
walrus_speculations = "If seven maids with seven mops
Swept it for half a year
Do you suppose the Walrus said
That they could get it clear
I doubt it said the Carpenter
And shed a bitter tear"

walrus_speculations.split.each do |word|
  # increment value at that key (which is by default 0)
  # this alters the hash because we use the assignment operator (=)
  word_counts[word.downcase] += 1
end

word_counts #=> {"if"=>1, "seven"=>2, "maids"=>1, "with"=>1, "mops"=>1, "swept"=>1,
            #    "it"=>3, "for"=>1, "half"=>1, "a"=>2, "year"=>1, "do"=>1, "you"=>1,
            #    "suppose"=>1, "the"=>2, "walrus"=>1, "said"=>2, "that"=>1, "they"=>1,
            #    "could"=>1, "get"=>1, "clear"=>1, "i"=>1, "doubt"=>1, "carpenter"=>1,
            #    "and"=>1, "shed"=>1, "bitter"=>1, "tear"=>1}

## Counter hashes are especially powerful in combination with sort_by: one can easily sort by the frequency of elements (i.e., the counter hash's values). The method below returns the third-most common element in an array. Imagine how much more difficult this method would be to implement without a counter hash.
def third_most_common(arr)
  counts = Hash.new(0)

  arr.each do |el|
    counts[el] += 1
  end

  frequency_array = counts.sort_by {|k,v| v}

  # remember sort_by returns an array of [k, v] arrays
  # return the first element (the key) from the third array from the end
  frequency_array[-3].first
end

third_most_common([1, 2, 2, 3, 3, 3, 4, 4, 4, 4]) #=> 2  


	# Glossary

	# Hash - A collection of key-value pairs with unique keys.
	# Hash Rocket - An operator for mapping keys to values in a hash: =>.
	# Hash Methods

	# has_key?(key) - Returns a boolean indicating whether its argument is a key in the hash.
	# has_value?(val) - Returns a boolean indicating whether its argument is a value in the hash.
	# include?(key) - Returns a boolean indicating whether its argument is a key in the hash.
	# keys - Returns an array of all the keys in its receiver.
	# key?(key) - Returns a boolean indicating whether its argument is a key in the hash.
	# length - Returns the number of key-value pairs in its receiver.
	# to_a - Type converts its receiver hash into a nested array of [key, value] arrays.
	# to_h - Type converts a nested array of two-element arrays to a hash.
	# values - Returns an array of all the values in its receiver.
	# value?(val) - Returns a boolean indicating whether its argument is a value in the hash.