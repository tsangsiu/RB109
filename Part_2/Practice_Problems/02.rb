# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# The tests above should print "true".

=begin

# Problem
- Given an array of integers
- Find the minimum sum of 5 consecutive numbers in the array
- If the array contains less than 5 elements, return `nil`
- Input: Array
- Output: Integer (the minimum sum), `nil` (array size < 5)

# Algorithm
- Return `nil` if the size of the array is less than 5
- Get all possible sub arrays of 5 consecutive integers
- For each sub array,
  - Sum all the integers
- Find the minimum sum
- Return the minimum sum

Sub-Task1: To get all possible sub arrays of 5 consecutive integers
[0, 1, 2, 3, 4, 5]
- Initalize `sub_arrs` to an empty array
- Iterate from index position `0` to (the size of the size - 5)
  - Get the sub array of size 5
  - Push the sub array to `sub_arrs`
- Return `sub_arrs`

=end

# Code
def get_subarrs(arr)
  sub_arrs = []
  (0..(arr.size - 5)).each do |index|
    sub_arrs << arr[index, 5]
  end
  sub_arrs
end

def minimum_sum(arr)
  return nil if arr.size < 5
  subarrs = get_subarrs(arr)
  sums = subarrs.map { |subarr| subarr.sum }
  sums.min
end

=begin

# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Problem
- Given an array of integers
- Out of all possible sub-arrays of size 5, return the minimum sum
- Input: Array
- Output: Integer

# Algorithm
[1, 2, 3, 4, 5, 6]
-> [[1,2,3,4,5], [2,3,4,5,6]]
-> [15, 20]
-> 15

- Given an array of integers,
  - Return nil if the size of array is less than 5
  - Find all possible sub-arrays of size 5
  - For each sub-array, find the sum of the numbers
  - Return the minimum integer

- Helper method: Find all possible sub-arrays of size 5
[1,2,3,4,5,6]
 * *
 index 0 -> size of array - 5
  - Initialize an empty array to `subarrs`
  - Iterate through the given array from index 0 to (size of array - 5),
    - Get the subarray of size 5 starting from the current index position
    - Push the subarray to `subarrs`
  - Return `subarrs`

=end

# Code
def get_subarrs_5(arr)
  subarrs = []
  (0..(arr.size - 5)).each do |start_index|
    subarrs << arr[start_index, 5]
  end
  subarrs
end

def minimum_sum(arr)
  return nil if arr.size < 5
  subarrs = get_subarrs_5(arr)
  sums = subarrs.map do |subarr|
    subarr.sum
  end
  sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
