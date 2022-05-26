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

p division_stringified(2, 3) == "1"
p division_stringified(5, 2) == "3"
p division_stringified(7, 3) == "2"
p division_stringified(6874, 67) == "103"
p division_stringified(503394930, 43) == "11,706,859"
p division_stringified(1, 10) == "0"  ### implicit rule: round the number
p division_stringified(100000, 1) == "100,000"
