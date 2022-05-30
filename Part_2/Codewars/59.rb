=begin

Write a function triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of
a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

# Problem
- Given two numbers `num1` and `num2`,
- If there is a triple consecutive digits in `num1` and a double consecutive of the same digit in `num1`, return 1
- Else return 0

# Algorithm
- Get the triple digits
  - Initialize `count` to 0
  - Initialize `triple_digit` to nil
  - Turn the number to a string
  - Iterate through the string,
    - If the current character is not the same as the last one
      - Set `count` to 1
    - Else,
      - Increment `count` by 1
    - If `count` == 3,
      - Set `triple_digit` to the current character
- Return 0 if `triple_digit` == nil
- Check if the double digits exist in `num2`
- If yes, return 1
- Else return 0

=end

def triple_double(num1, num2)
  count = 0
  triple_digit = nil
  num1_str = num1.to_s
  num1_str.chars.each_with_index do |char, index|
    char != num1_str[index - 1] && index != 0 ? count = 1 : count += 1
    triple_digit = char if count == 3
  end
  
  return 0 if triple_digit == nil
  num2.to_s.include?("#{triple_digit}#{triple_digit}") ? 1 : 0
end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
