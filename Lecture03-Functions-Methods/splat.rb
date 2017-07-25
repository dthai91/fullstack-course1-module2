def max(one_param, *numbers, another)
  # Variable length parameters passed in 
  # become an array
  numbers.max
end

puts max(52, 7, 32, -4, 42) # => 32



