=begin
  
Problem:
- Rules:
  - Given a number, return it as a string in expanded form
  - all numbers are integer greater than 0
- Input: integer
- Output: string

Examples:
p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'

Data Structures:
Input: integer
Intermediate: array
Output: string

Algorithm:
- given an integer
- convert it to a string and split it into an array of digits
- initalise a variable called `place_value` to 1
- iterating through the digits starting from the rightmost digit
  - transform the digit to digit * `place_value`
  - set `place_value` = `place_value` * 10
- delete all zeros in the array
- join the array to form the expanded form
- return the expanded form

=end

# Code:

def expanded_form(integer)
  digits = integer.to_s.split('')
  
  place_value = 1
  values = digits.reverse.map do |digit|
    value = digit.to_i * place_value
    place_value *= 10
    
    value
  end
  values.delete(0)
  values.reverse.join(' + ')
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
