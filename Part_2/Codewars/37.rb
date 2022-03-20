=begin

Problem
Rules/Requirements
- Given a number, find the sum of all multiples of 3 and 5 that are less than that number
- If a number is a multiple of both 3 and 5, count only once

Examples
p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

Data Structures
Input: Integer
Intermediate: Array
Output: Integer

Algorithm
- Initalise an array called `multiples` to store the multiples of 3 and 5 that are less than the given number
- Given a number, iterate from 1 to 1 less than that number
  - if the number is a multiple of 3 and 5,
    - push that number to `multiples`
- Return the sum of all numbers in `multiples`

=end

# Code
def solution(number)
  multiples = []
  1.upto(number - 1) do |num|
    multiples << num if num % 3 == 0 || num % 5 == 0
  end
  multiples.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
