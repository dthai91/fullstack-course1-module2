# EASY
def word_lengths(str)
  lengths = {}
  words = str.split
  words.each {|word| lengths[word] = word.length}
  lengths
end

def greatest_key_by_val(hash)
  hash.sort_by {|k, v| v}[-1][0]
end

def update_inventory(older, newer)
  newer.each do |key, value|
    older[key] = value
  end

  older
end

def letter_counts(word)
  count = Hash.new(0)

  word.each_char do |char|
    count[char] += 1
  end

  count
end


# MEDIUM

def uniq(arr)
  mine_for_keys = {}
  arr.each {|el| mine_for_keys[el] = true}
  mine_for_keys.keys
end

def evens_and_odds(numbers)
  count = {"even" => 0, "odd" => 0}

  numbers.each do |number|
    count["even"] += 1 if number.even?
    count["odd"] += 1 if number.odd?
  end

  count
end

def most_common_vowel(string)
  vowel_counts = Hash.new(0) #give a default value to your hash

  string.each_char do |char|
    vowel_counts[char] += 1 if 'aeiou'.include?(char)
  end

  max_val = vowel_counts.values.max

  ties = vowel_counts.select{|_, v| v == max_val}
  ties.keys.min #compares ascii values of the letters (assuming lowercase)
end


# HARD

def fall_and_winter_birthdays(students_with_birthdays)
  students = students_with_birthdays.select do |student, month|
    month >= 7
  end

  names = students.keys
  result = []

  names.each_index do |idx1|
    ((idx1 + 1)...names.length).each do |idx2|
      result << [ names[idx1], names[idx2] ]
    end
  end

  result
end

def biodiversity_index(specimens)
  uniq_specimens = specimens.uniq
  species_count = {}

  uniq_specimens.each do |species|
    species_count[species] = specimens.count(species)
  end

  number_of_species = uniq_specimens.length
  smallest_species = species_count.values.min
  largest_species = species_count.values.max

  number_of_species ** 2 * smallest_species / largest_species
end

def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_count = character_count(normal_sign)
  vandalized_count = character_count(vandalized_sign)

  vandalized_count.all? do |character, count|
    normal_count[character.downcase] >= count
  end
end

def character_count(str)
  count = Hash.new(0)

  str.each_char do |char|
    next if char == " "
    count[char.downcase] += 1
  end

  count
end