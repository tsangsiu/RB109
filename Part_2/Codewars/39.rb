=begin

Problem
- Rules/Requirements
  - Given a string of digits,
  - find the greatest product of 5 consecutive digits
- Input: String
- Output: Integer

Examples
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

Data Structure
- Input: String
- Intermediate: Array
- Output: Integer

Algorithm
- Initialise an array called `products` to store all possible products
- Given a string of digits,
  - convert it to an array of digits
- Starting from the 5th digits to the last digits,
  - for every digit, take together the 4 digits to the left of it
  - calculate the product
  - push the product to `products`
- Return the maximum integer in `products`

=end

# Code
def greatest_product(str_digits)
  products = []
  digits = str_digits.chars.map(&:to_i)
  4.upto(digits.length - 1) do |index|
    product = digits[(index - 4)..index].inject(:*)
    products << product
  end
  products.max
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
