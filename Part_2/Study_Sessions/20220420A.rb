# Given integer array nums, return the third largest number in this array. If the third largest number does not exist, return the largest number.
# You are not allowed to sort the array

# p third_max([3, 2, 1]) == 1
# p third_max([1, 2]) == 2
# p third_max([2, 2, 3, 1]) == 1
# p third_max([1, 3, 4, 2, 2, 5, 6]) == 4

=begin

# Problem
- Given an Array of integers, return the third largest number in the Array
- If it does not exist, return the largest number

# Examples
p third_max([3, 2, 1]) == 1
p third_max([1, 2]) == 2
p third_max([2, 2, 3, 1]) == 1
p third_max([1, 3, 4, 2, 2, 5, 6]) == 4

# Data Structures
- Input: Array
- Intermediate: Array
- Output: Integer

# Brainstorm
- Remove the largest element in the Array twice
- The third largest element does not exist if the number of unique element in the Array is less than 3

# Algorithm
- Re-assign `arr` to an Array of unique elements
- Find the number of unique elements in the Array
- If that number is less than 3,
  - Return the largest element
- Else,
  - Iterate the following twice:
    - Find the largest element in the Array and remove it (all)
  - Return the largest element in the remaining elements

=end

# Code

def third_max(arr)
  arr = arr.uniq
  if arr.size < 3
    return arr.max
  else
    2.times { |_| arr.delete(arr.max) }
    return arr.max
  end
end

=begin

# Re-do

# Given integer array nums, return the third largest number in this array. If the third largest number does not exist, return the largest number.
# You are not allowed to sort the array

# p third_max([3, 2, 1]) == 1
# p third_max([1, 2]) == 2
# p third_max([2, 2, 3, 1]) == 1
# p third_max([1, 3, 4, 2, 2, 5, 6]) == 4

# Problem
- Given an array of numbers,
  - Return the third largest number in the array
  - If the third largest number does not exist, return the largest number
- Not allowed to sort the array
- Note that in an array the third largest number does not exist when the number of unique numbers in the array is less than 3

# Algorithm
- Given an array of numbers,
  - Remove the duplicates numbers in the array
  - If the number of numbers in the result array is less than 3,
    - Return the largest number
  - Else,
    - Delete the two largest numbers in the array
    - Return the maximum number in the result array

=end

def third_max(arr)
  arr_uniq = arr.uniq
  if arr_uniq.size < 3
    return arr_uniq.max
  else
    2.times { |_| arr_uniq.delete(arr_uniq.max) }
    return arr_uniq.max
  end
end

p third_max([3, 2, 1]) == 1
p third_max([1, 2]) == 2
p third_max([2, 2, 3, 1]) == 1
p third_max([1, 3, 4, 2, 2, 5, 6]) == 4
p third_max([1, 1, 1, 2, 2, 2, 2, 2]) == 2
