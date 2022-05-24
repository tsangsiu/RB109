# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

=begin

# Problem
- Given an array of numbers,
- For each number in the array,
- find out how many numbers are smaller than that numbers
- Note that duplicate numbers are counted once
- Input: Array
- Output: Array

# Algorithm
- Given an array, create an array of unique numbers `arr_uniq`
[8,1,2,2,3] -> [8,1,2,3]
- Iterate through the given Array
  - Count how many number in `arr_uniq` is smaller than the current number
  - Replace the current element with the count I get
- Return the result Array

=end

def smaller_numbers_than_current(arr)
  arr_uniq = arr.uniq
  arr.map do |num|
    arr_uniq.count { |num_uniq| num_uniq < num }
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# 9:45, with Harold
