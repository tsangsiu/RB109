=begin

Have the method division_stringified(num1, num2) take both parameters being 
passed, divide num1 by num2, and return the result as a string with properly formatted commas.

If an answer is only 3 digits long, return the number with no commas.

Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".

Note: 2 divided by 3 should return '1'

# Problem
- Given two numbers, num1 and num2,
- Find the rounded result when num1 is divided by num2
- Return the result in string, group the number in 3's with a comma
- If the result is less than 3-digit long, reuturn the number in string with no comma
- Round the division result

# Algorithm
- Given two numbers, num1 and num2,
  - Divide num1 (turned to float) by num2 and then round it
  - Convert the result to a string
  - Reverse the string
  - Divide the string into groups of 3
    - ***
  - If there is only 1 group (i.e., less than 3 digits),
    - keep it as it is
  - Else,
    - Join the string with a comma
  - Reverse the string
- Return the string

=end

def division_stringified(num1, num2)
    result_str = (num1.to_f / num2).round.to_s
    result_str_reverse = result_str.reverse

    groups = []
    index = 0
    until index >= result_str_reverse.length
      groups << result_str_reverse[index..(index + 2)]
      index += 3
    end

    output = groups.size == 1 ? groups.first : groups.join(',')
    output.reverse
end

=begin

# Re-do

Have the method division_stringified(num1, num2) take both parameters being 
passed, divide num1 by num2, and return the result as a string with properly formatted commas.

If an answer is only 3 digits long, return the number with no commas.

Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".

Note: 2 divided by 3 should return '1'

# Problem
- Given two numbers `num1` and `num2`
- Dividde `num1` by `num2` and round the result to the nearest integer
- Group the digits into 3's and separated by a comma

# Algorithm
- Given two numbers `num1` and `num2`,
  - Get the float number when `num1` is divided by `num2`
  - Round the number
  - Turn the number to a string
  - If the length of the number is less than or equal to 3,
    - Return it
  - Else,
    - Group the numbers in 3's and separate them by a comma
    - Return the result string

# Subtask 1: Group the numbers in 3's and separte them by a comma
'1234567' -> '7654321' -> ['765','432','1'] -> '765,432,1' -> '1,234,567'
- Given a string of number
- Reverse it
- Initialize `output` to an empty array
- Initialize `index` to `0`
- Loop,
  - Get the substring from `index` to and including `index + 2`
  - Push the substring to `output`
  - Increment `index` by 3
  - Break the loop if `index` is greater than or equal to the length of the number string
- Join the array with a comma
- Reverse the result string
- Return the string

=end

def group_threes(num_str)
  output = []
  num_str_reversed = num_str.reverse

  index = 0
  loop do
    output << num_str_reversed[index..(index + 2)]
    index += 3
    break if index >= num_str_reversed.length
  end
  output.join(',').reverse
end

def division_stringified(num1, num2)
  result = (num1.to_f / num2).round.to_s
  result.length < 3 ? result : group_threes(result)
end

p division_stringified(2, 3) == "1"
p division_stringified(5, 2) == "3"
p division_stringified(7, 3) == "2"
p division_stringified(6874, 67) == "103"
p division_stringified(503394930, 43) == "11,706,859"
p division_stringified(1, 10) == "0"  ### implicit rule: round the number
p division_stringified(100000, 1) == "100,000"
