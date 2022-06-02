=begin

A format for expressing an ordered list of integers is to use a comma separated 
list of either individual integers or a range of integers denoted by the 
starting integer separated from the end integer in the range by a dash, '-'. 

1, 2, 3, 4 or 1-4

The range includes all integers in the interval including both endpoints. It is 
not considered a range unless it spans at least 3 numbers. For example "12,13,15-17"

Complete the solution so that it takes a list of integers in increasing order 
and returns a correctly formatted string in the range format.

# Problem
- Given an array of integers,
  - format it in comma-separated list or range as a string

For example,
solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])
returns "-6,-3-1,3-5,7-11,14,15,17-20"

  - The range includes all integers, including the starting and ending integers
  - The number spanned should be at least 3 for ranges
  - The numbers given in an array are in ascending order
- Input: Array of integers
- Output: String

# Algorithm
- Given an array of integers in ascending order,
  - Slice the array at the points where the difference between two numbers is greater than 1
- Iterate through the array of sub-array of numbers,
  - If the size of the sub-array is less than 3,
    - Join the numbers with a comma
    - Replace the sub-array with that string
  - Else,
    - Take the first and last number, and join them with a hypen
    - Replace the sub-array with that string
- Join the array of strings with comma
- Return the string

=end

def solution(arr)
  groups = arr.slice_when { |num1, num2| (num1 - num2).abs > 1 }.to_a
  groups = groups.map do |group|
    if group.size < 3
      group.join(', ')
    else
      "#{group.first}-#{group.last}"
    end
  end
  groups.join(', ')
end

p solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-6, -3-1, 3-5, 7-11, 14, 15, 17-20"
