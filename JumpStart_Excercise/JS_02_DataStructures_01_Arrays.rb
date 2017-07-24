### 1. ACCESS & ASSIGNMENT
# blasphemous_characters = ["Robb", "Sansa", "Arya", "Bran", "Rickon"]
# blasphemous_characters[0] = "Rick"
# blasphemous_characters #=> ["Rick", "Sansa", "Arya", "Bran", "Rickon"]
# blasphemous_characters[3..-1]# = "Morty", "Snuffles" # this is called multiple assignment
# blasphemous_characters #=> ["Rick", "Sansa", "Arya", "Morty", "Snuffles"]

# #p blasphemous_characters = ["Robb", "Sansa", "Arya", "Bran", "Rickon"]
# # because arrays are zero-indexed, the index blasphemous_characters.length (5) doesn't have a value
# p blasphemous_characters.length# = "Morty"
# p blasphemous_characters #=> ["Robb", "Sansa", "Arya", "Bran", "Rickon", "Morty"]
# p blasphemous_characters[8] = "Rick"

# # The Ruby interpreter fills in the empty indices with nil
# p blasphemous_characters #=> ["Robb", "Sansa", "Arya", "Bran", "Rickon", "Morty", nil, nil, "Rick"]

### 2. CONCATENATION 2 methods
#string1.concat(string2) = string1 + string2

# potpourri = [false, "Snuffles", nil]
# #test_str = ['wath','the','fick',true]; p potpourri + test_str
# p potpourri.concat(["rick", 3]) #=> [false, "Snuffles", nil, "rick", 3]
# p potpourri + ['newstring'] #method 2


### 3. PUSH, POP, UNSHIFT, SHIFT
# PUSH/UNSHIFT = add a element to the RIGHT/LEFT
# POP/SHIFT = remove a element from the RIGHT/LEFT

# potpourri = [false, "Snuffles", nil, "rick", 3]
# potpourri.push([]) #=> [false, "Snuffles", nil, "rick", 3, []]
# potpourri #=> [false, "Snuffles", nil, "rick", 3, []] (push modified potpourri)
# tail = potpourri.pop #=> []
# potpourri #=> [false, "Snuffles", nil, "rick", 3] (pop modified potpourri)
# tail #=> []

# The shovel operator (<<) is functionally equivalent to push, but it allows for
# the simpler syntax typical of operators. 
#  Note that << does not concatenate. Shoveling one array into another creates a nested array:

# p potpourri = [false, "Snuffles", nil, "rick", 3]
# p potpourri << ["Jerry", "krombopulos_michael"] #=> [false, "Snuffles", nil, "rick", 3, ["Jerry", "krombopulos_michael"]]

# potpourri = [false, "Snuffles", nil, "rick", 3]
# potpourri.unshift([]) #=> [[], false, "Snuffles", nil, "rick", 3]
# potpourri #=> [[], false, "Snuffles", nil, "rick", 3] (unshift modifies potpourri)
# p top = potpourri.shift #=> []
# p potpourri #=> [false, "Snuffles", nil, "rick", 3] (shift modified potpourri)

### 4. JOIN

# [1, 2, nil, 3].join #=> "123"
# [1, 2, nil, 3].join(" ") #=> "1 2  3" <-note the extra space to accommodate nil

# ex = [2, 1, 3]
# ex.join(" joint ") #=> "1 joint 2 joint 3"


# p ex.length
# # ! a Exclamation point indicate a methods that modify their receiver = dangerous method, modified inplace.
# p ex.sort!
# p ex
# #.include? returns a boolean value indicating whether its argument is included in the array.
# ["a", "b", "c"].include?("a") #=> true
# ["a", "b", "c"].include?(1) #=> false


cowboy_bebop_characters = ["Spike Spiegel", "Jet Black", "Faye Valentine", "Ed", "Ein"]
p cowboy_bebop_characters[4..-1]




