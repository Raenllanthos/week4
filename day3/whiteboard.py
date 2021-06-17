# Find Smallest Number  - (Without min)
# Create a function that given a list of numbers (non-sorted) find the lowest 
# number in the list and return it.
# Example Input: [50,30,4,2,11,0]
# Example Output: 0
# Example Input 2: [40,3,4,2]
# Example Output 2: 2

def smallest(numlist):
    x = numlist[0]
    for num in numlist:
        if num <= x:
            x = num
    return x

list1 = [50,30,4,2,11,0,100,3]
list2 = [40,3,4,2,50,4]
print(smallest(list1))
print(smallest(list2))