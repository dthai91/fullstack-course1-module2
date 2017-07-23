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

potpourri = [false, "Snuffles", nil]
#test_str = ['wath','the','fick',true]; p potpourri + test_str
p potpourri.concat(["rick", 3]) #=> [false, "Snuffles", nil, "rick", 3]
p potpourri + ['newstring'] #method 2

#https://app-academy.gitbooks.io/js-step-1/content/part6-data_structures/ppsu.html
### 3. PUSH, POP, UNSHIFT, SHIFT
# PUSH/ = add a element to the right
# POP









