# You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

# For example:

# Let's say you are given the array [1, 2, 3, 4, 3, 2, 1]:
# Your method will return the index 3, because at the 3rd position of the array, the sum of left side of the index [1, 2, 3] and the sum of the right side of the index [3, 2, 1] both equal 6.

# Another one:
# You are given the array [20, 10, -80, 10, 10, 15, 35]
# At index 0 the left side is []
# The right side is [10, -80, 10, 10, 15, 35]
# The both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
# Index 0 is the place where the left side and right side are equal

# Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N.

=begin

# Problem
- Given an Array, find the index of an element,
- where the sum of the elements to the left of that element equals the sum of the elements to the right of that element, excluding that element
- If that cannot happen, return -1
- If the given Array is empty, return 0

- Input: Array
- Output: Integer

# Algorithm
- Given an Array,
  - Return 0 if the given array is empty
    - Iterate through the array with index,
    - Get the sub-array from the begining to the element at that index position, excluding the end element
    - Get the sub-array to the right of the element at that position
    - Check if the sums of elements in both arrays are equal
    - If yes, return the index position
  - Return -1

=end

# Code
def find_even_index(arr)
  return 0 if arr.empty?
  arr.each_with_index do |element, index|
    arr_left = arr[0...index]
    arr_right = arr[(index + 1)..]
    return index if arr_left.sum == arr_right.sum
  end
  -1
end

p find_even_index([]) == 0
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
