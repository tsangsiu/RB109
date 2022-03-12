=begin

Problem
Rules/Requirement:
  - Given two arrays of integers of equal length,
  - compute the mean square error.
- Input: Two integer arrays
- Output: Integer
Question:
- What is the mean square error?
  - The average of the absolute value difference of the two corresponding values
- Do we need to check if the inputs are really of equal length?
  - No

Examples
p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1

Data Structures
- Input: Two integer arrays
- Intermediate: An integer to store the intermediate sum of the absolute difference
- Output: Integer

Algorithm
- Given two arrays,
  - initialise a variable called 'ss' to store the intermediate sum of squares
  - iterate through each integer in the first array
    - get the corresponding integer in the second array
    - compute the absolute value of their difference
    - square the result
    - add the result to `ss`
  - divide `ss` by the length of either array
  - return the result
  
=end

# Code

def solution(arr1, arr2)
  ss = 0
  arr1.each_with_index do |num, index|
    ss += ((num - arr2[index]).abs) ** 2
  end
  ss.to_f / arr1.length
end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1
