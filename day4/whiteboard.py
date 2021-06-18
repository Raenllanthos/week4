# You are given a list of unique integers (arr), and two integers (a and b). 
# Your task is to find out whether or not a and b appear consecutively in arr, 
# and return a boolean value (True if a and b are consecutive, False otherwise).
# It is guaranteed that a and b are both present in arr.
# Example:
# Input: ([1, 6, 9, -3, 4, -78, 0], -3, 4)
# Output: True
# Input: ([3,1,0,19], 19, 0)
# Output: True

def numbers(arr, a,b):
    for num in range(len(arr)-1):
        if (arr[num] == a) or (arr[num] == b):
            if (arr[num+1] == b) or (arr[num+1] == a):
                print(a,b)
                return True
    return False

print(numbers([1, 6, 9, -3, 4, -78, 0], -3, 4))
print(numbers([3,1,0,19], 19, 0))