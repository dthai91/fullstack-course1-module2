###ENUMERABLE
# arr = [1, 3,4,6,8,10,213,25]
# p arr.all? {|int| int.odd?}
# p arr.none? {|int| int.even?}
# p arr.any? {|int| int.even?}
# p arr.count {|int| int > 20},'>20'
# p arr.map{|int| int**2}

# str = "A capital is reckless of the health or length of life of the laborer unless under compulsion from society"
# p str.split.select {|word| word.length >= 7}
# p str.split.reject {|word| word.length >= 7}
# p str.split.all? {|word| word.length < 11}
# p str.split.none? {|word| word.length < 12}
# p str.split.sort_by {|word_len| word_len.length}


 long_str = ["The", "mind", "has", "shown", "itself", "at", "times",
    "Divided", "by", "accepted", "multitudes."]

# three_lines.each_with_index do |word, idx| #the parameters are comma separated and in order
#   puts "The word #{word} at index #{idx} must be the start of a new line!"
# end

#p long_str.each_index {|idx| p idx,long_str[idx]}

###REDUCE
#redifine reduce :+
def my_sum(arr)
	fst = arr.first
	arr.each_index do |idx|
		next if idx == 0
		fst += arr[idx]
	end
	return fst
end
#p my_sum([1,2,3,4,5])

def sum_odd(arr)
	arr.reduce do |first_e, nxt_e|
		if nxt_e.odd?
			first_e + nxt_e
		else
			first_e
		end
	end
end

p sum_odd([10,2,3,4,5])

def sum_odd2(arr)
	result = 0
	arr.each.map{|x| result += x if x.odd?}
	return result
end
p sum_odd2([11,2,3,4,5])