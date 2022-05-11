# You are given an array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.
# You can asume there is never an empty array and there will always be an integer.

# p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]

=begin

# Problem
- Given an Array of integers, sum all consecutive Integers and return an Array

# Examples
p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]

# Data Structures
- Input: Array
- Intermediate: Array
- Output: Array

# Brainstorm
- Initialize a variable called `last_int` to `nil` to store the last Integer
- Initialize a variable called `sum` to `0` to accumulate the sum of consecutive Integers
- Initialize an empty Array called `sums` for output
- Iterate through the given Array,
  - If the current Integer is not the same as the last one,
    - Push `sum` to `sums`
    - Set `sum` to the current Integer
    - Set `last_int` to the current Integer
  - Else,
    - Increment `sum` by the current Integer
  - If the current Integer is the last one,
    - Push `sum` to `sums`

# Algorithm
- Initialize `last_int` to `nil`
- Initialize `sum` to `0`
- Initialize `sums` to an empty Array
- Iterate through the given Array,
  - If the current Integer is not the same as the last one,
    - Push `sum` to `sums` if the last Integer is not `nil`
    - Set `sum` to the current Integer
    - Set `last_int` to the current Integer
  - Else,
    - Increment `sum` by the current Integer
  - If the current Integer is the last one,
    - Push `sum` to `sums`

=end

# Code

def sum_consecutives(arr)
  sums = []
  sum = 0
  last_int = nil
  arr.each_with_index do |int, index|
    if int != last_int
      sums << sum if !last_int.nil?
      sum = int
      last_int = int
    else
      sum += int
    end
    sums << sum if index == arr.size - 1
  end
  sums
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) == [-10,14,12,0]
