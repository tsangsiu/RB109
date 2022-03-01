=begin

Problem:
- Rules:
  - Given a positive number, return its multiplicative persistence.
- Problem:
  - What is multiplicative persistence?
    - It is the number of times you must multiply the digits until you reach a single digit
    - For example:
      - 39 -> 3*9 = 27 -> 2*7 = 14 -> 1*4 = 4 -> return 3
- Input: Integer
- Output: Integer

Examples:
p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4

Data Structures:
- Input: Integer
- Intermediate: 
- Output: Integer

Algorithm:
- Given a positive integer called, say `num`
- Initalise a variable called `count` to 0
- Until `num` is a single digit,
  - Split `num` into an array of digits
  - Multiply all the digits in the array
  - Set num to the product
  - Increment `count` by 1
- Return `count`

=end

# Code:

def persistence(num)
  count = 0
  until (0..9).include?(num)
    digits = num.to_s.split("").map(&:to_i)
    product = digits.reduce(:*)
    num = product
    count += 1
  end
  count
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
