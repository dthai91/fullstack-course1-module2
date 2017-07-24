# Define a method that returns a boolean indicating whether 
# any two elements in the argument (an array) sum to 0.
def sum0(arr)
	#1 combination of 2
	#map sum to each, include 0?
	p arr.combination(2).map{|total| total.reduce(:+)}.include?(0)
end

sum0([0,2,4,5,7,8])


def twosumzero?(arr)
	i = 0 
	while i < arr.length
		j = i + 1
		while j < arr.length
			if arr[i] + arr[j] == 0
				p arr[i],arr[j]
				return true
			end
			j = j + 1
		end
		i = i + 1
	end
end
p twosumzero?([0,2,4,5,7,8])