=begin

Problem:
- Input: a string of integers
- Output: integer, count
- Rules:
  - Given a string of integer, e.g. '1341'
  - return the number of odd-number substring that can be formed
- Questions:
  - Do replicate numbers counted as one or two?
  - why "1341" only 7? should be more than that
    - oh! a SUBSTRING is formed by neighbour digits

Examples:
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

Data Structures:
- Input: a string of integers
- Intermediate: the same string
- Output: integer, count

Algorithm:
- initialise an array `odd_numbers` to store all odd numbers
- given a string of integers
- iterate through each character (integers)
  - for each character (integers), iterate from the current char to the end
    - get the current substring
    - convert the substring to integer
    - if the integer is an odd number
    - append it to `odd_numbers`
- count the number of elements in `odd_numbers`
- return the number

=end

# Code:

def solve(string)
  odd_numbers = []
  anchor = 0
  loop do
    index = anchor
    loop do
      substring = string[anchor..index]
      integer = substring.to_i
      odd_numbers << integer if integer.odd?
      index += 1
      break if index == string.length
    end
    anchor += 1
    break if anchor == string.length
  end
  odd_numbers.size
end

# Refactor

def solve(string)
  odd_numbers = []
  0.upto(string.length - 1) do |anchor|
    anchor.upto(string.length - 1) do |index|
      substring = string[anchor..index]
      integer = substring.to_i
      odd_numbers << integer if integer.odd?
    end
  end
  odd_numbers.size
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
