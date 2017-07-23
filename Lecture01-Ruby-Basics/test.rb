p blasphemous_characters = ["Robb", "Sansa", "Arya", "Bran", "Rickon"]
p blasphemous_characters[0] = "Rick"
p blasphemous_characters #=> ["Rick", "Sansa", "Arya", "Bran", "Rickon"]

p blasphemous_characters[3..-1]# = "Morty", "Snuffles" # this is called multiple assignment
#p blasphemous_characters #=> ["Rick", "Sansa", "Arya", "Morty", "Snuffles"]

p (-5..-1).to_a.min