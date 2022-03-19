=begin

Problem
- Rules/Requirements
  - Given an integer n, find the maximum number you can obtain by deleting exactly one digit of the give ineger
- Input: Integer
- Output: Integer

Examples
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

Data Structures
- Input: Integer
- Intermediate: Array
- Output: Integer

Algorithm
- Initialise an variable called `index` to 0 to keep track of the current digit
- Initialise an empty array called `numbers` to store the integers by deleting a digit at different position
- Given an integer, while `index` is less than the number of digits of the given integer,
  - turn it into a string
  - remove the digit at position `index`
  - turn it back to an integer
  - push that integer to `numbers`
  - increment `index` by 1
- return the maximum number inside `numbers`

=end

# Code
def delete_digit(int)
  index = 0
  numbers = []
  while index < int.to_s.length
    num = int.clone.to_s
    num[index] = ''
    numbers << num.to_i
    index += 1
  end
  numbers.max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
