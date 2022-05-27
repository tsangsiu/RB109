=begin

For example, reversing 2021 gives 1202. Reversing 12300 gives 321 as the leading zeros are not retained.
Given an integer num, reverse num to get reversed1, then reverse reversed1 to get reversed2. Return true if reversed2 equals num. Otherwise return false.

# Problem
- Given a number,
- If it is reversed twice and arrive at the same number, return true
- Return false if otherwise

# Algorithm
- Given a number, turn it into a string
- Reverse it
- Turn it back to a number
- Turn it to a string
- Reverse it
- Turn it to a number
- If the result is the same as the original number, return true

=end

def is_same_after_reversals(num)
  num.to_s.reverse.to_i.to_s.reverse.to_i == num
end

p is_same_after_reversals(0) == true
p is_same_after_reversals(11) == true
p is_same_after_reversals(158) == true
p is_same_after_reversals(25879) == true
p is_same_after_reversals(2500) == false
p is_same_after_reversals(11150) == false
