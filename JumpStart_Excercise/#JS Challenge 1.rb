#JS Challenge 1
def is_slippery?(n)
	# if n.modulo(15) == 0
	#  return false
	# elsif n.modulo(3) == 0 || n.modulo(5) == 0
	#  return true
	# else
	# return false
	# end 
	(n.modulo(3) == 0 || n.modulo(5)==0) && (n.modulo(15)!=0)
end

def slippery_numbers(n)
	lst = []
	i = 1
	while lst.length < n
		lst << i if is_slippery?(i)
		i = i + 1
	end
	return lst
end

p slippery_numbers(7)