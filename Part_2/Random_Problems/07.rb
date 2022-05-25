=begin

Given an array of integers nums and an integer target, return indices of the two
numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not
use the same element twice.

You can return the answer in any order.

# Problem
- Given an array of numbers and an integer target,
- return the indices of the numbers in the array such that the numbers sum to the target
- There is only one solution
- Input: Array, Integer
- Output: Array

# Algorithm
- Iterate through the given array
  - Consider one element to the right of the current number,
  - If the two numbers sum to the target,
    - return an array of the indices of both numbers

=end

def two_sum(arr, target)
  arr.each_with_index do |num1, num1_index|
    ((num1_index + 1)...arr.size).each do |num2_index|
      num2 = arr[num2_index]
      return [num1_index, num2_index] if num1 + num2 == target
    end
  end
end

p two_sum([2,7,11,15], 9) == [0,1]
p two_sum([3,2,4], 6) == [1,2]
p two_sum([3,3], 6) == [0,1]
