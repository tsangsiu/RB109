=begin

Problem
Rules/Requirements
- Given a number, find its digital root.
- A digital root is the recursive sum of all digits in a number.
- Given n, take the sum of the digits of n.
- If that value has more than one digit, continue reducing in this way until a single-digit number is porduced.
- The input will only be natural numbers
Input: Integer
Output: Integer

Examples
p digital_root(16) == 7
p digital_root(942) == 6
p digital_root(132189) == 6
p digital_root(493193) == 2

Data Structure
- Input: Integer
- Intermediate: String/Array
- Output: Integer

Algorithm
- Given a number n, convert it to string
- Split it into an array of digits
- Calculate the sum of all digits
- If the sum has only one digit, return it,
- Else do the above again.

=end

def digital_root(n)
  sum = n.to_s.split('').map(&:to_i).sum
  sum.to_s.length == 1 ? (return sum) : digital_root(sum)
end

p digital_root(16) == 7
p digital_root(942) == 6
p digital_root(132189) == 6
p digital_root(493193) == 2
