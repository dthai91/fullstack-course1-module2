#test.py


# numlist = [1,2,3,4,5]

# #MAP REDUCE
# tol = 0
# for a in numlist:
# 	tol += a
# print 'for-loop: ', tol
# #reduce(lambda 'parameter=partial result so far', 'next result': )
# sum123 = reduce(lambda x, y: x+y, numlist )
# print 'reduce: ',sum123

# def sqr(list1):
# 	list2 = []
# 	for i in list1:
# 		list2.append(i**2)
# 	return list2

# def sqrf(i):
# 	return i**2

# print map(sqrf,numlist)

# print sqr(numlist)

### FILTER apply same funtion to filter out 

numlist = [10,20,30,40,50]
numlist2 = [x for x in numlist if x>25]
print numlist2
print [x for x in numlist if x>25]
print filter(lambda x:x>25,numlist)



### REDUCE: apply same function to items of an array,
### Then uses the result of f0 as param for f1
### Then return an item, not a list