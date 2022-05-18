# The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers:

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made up of only negative numbers, return 0 instead.

# Empty array is considered to have zero greatest sum. Note that the empty array is also a valud subarray.

=begin

# Problem
- Given an Array, find the maximum sum of a subsequence of integers inside of it
- If the given Array is empty, or contains only negative integers, return 0

# Brainstorm
- Loop through the array to look at all possible subsequnce of integers

# Algorithm
- Initialize `max_sum` to 0
- Return `max_sum` if the given Array is empty or contains only negative integers
- Iterate through the given Array, with index
  - From the current integer to the end of the array,
    - Get the sub-Array
    - Calculate the sum
    - If the sum is larger than `max_sum`,
      - Set `max_sum` to the sum
- Return `max_sum`

=end

# Code
def max_sequence(arr)
  max_sum = 0
  return max_sum if arr.empty? || arr.all? { |element| element < 0 }
  arr.each_with_index do |element, index|
    start_index = index
    start_index.upto(arr.size - 1) do |end_index|
      sub_arr = arr[start_index..end_index]
      sum = sub_arr.sum
      max_sum = sum if sum > max_sum
    end
  end
  max_sum
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
