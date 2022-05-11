=begin

# Problem
- Implement a method that calculates the sum of the Integers inside a String. Only positive Integers are considered
- Consecutive Integers are considered as one Integer
- No Integers means that the sum is 0

# Examples
p sum_of_integers("L12aun3ch Sch3oo45l") == 63
p sum_of_integers("HE2LL3O W1OR5LD") == 11
p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
p sum_of_integers("HELLO WORLD!") == 0
p sum_of_integers("HELLO WORLD77!") == 77

# Data Structure
- Input: String
- Intermediate: String
- Output: Integer

# Brainstorm
- Initialize an Array (called `nums`) to store all the numbers in the String
- Initialize an empty String (called `num`) to construct the current number
- Iterate through the String
- If the current char is an Integer, append it to `num`
- Else if `num` is not empty, change it to Intger and push it to `nums`
- Push `num` (converted to an Integer) to `nums` when we get to the last char
- Calculate the sum in `nums` and return it

# Algorithm
- Initialize `nums` to an empty Array
- Initialize `num` to an empty String
- Iterate through the String,
  - If the current character is an Integer, push it to `num`
  - Else if `num` is not emmpty,
    - Convert it to Integer and append it to `nums`
    - Set `num` to empty
- If we get to the last character and `num` is not empty,
  - Convert it to Integer and append it to `nums`
- Return the sum of all elements in `nums`

=end

# Code

def sum_of_integers(str)
  nums = []
  num = ''
  str.each_char.with_index do |char, index|
    if ('0'..'9').include?(char)
      num << char
    elsif !num.empty?
      nums << num.to_i
      num = ''
    end
    nums << num.to_i if index == str.length - 1 && !num.empty?
  end
  nums.sum
end

p sum_of_integers("L12aun3ch Sch3oo45l") == 63
p sum_of_integers("HE2LL3O W1OR5LD") == 11
p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
p sum_of_integers("HELLO WORLD!") == 0
p sum_of_integers("HELLO WORLD77!") == 77
