u = " unity "
i = "in the "
k = "kangaroo community"
# "1 unity in the kangaroo community"
p 1.to_s + u + i + k
p 1.to_s + " unity " << i << k
p 1.to_s + " " + k[-5..-1] + " " + i + k