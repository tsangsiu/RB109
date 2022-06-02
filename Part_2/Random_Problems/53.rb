=begin

Implement the function unique_in_order which takes as argument a sequence and 
returns a list of items without any elements with the same value next to each 
other and preserving the original order of elements.

For example:
'AAAABBBCCDAABBB' -> ['A', 'B', 'C', 'D', 'A', 'B']

# Problem
- Given a string or an array,
- Return an array containing elements in the array without any elements with the
  same value next to each other
- Presever the original order of elements
- Case is relevant here
- Input: String or Array
- Output: Array

# Algorithm
- If the given arguemnt is a string, turn it into an array of individual characters
- Initialize `stack` to an empty array
- Iterate through the array
  - If the current element is not the same as the last element in `stack`,
    - Push the current element to `stack`
- Return `stack`

=end

def unique_in_order(collection)
  arr = collection.class == String ?  collection.chars : collection
  stack = []
  arr.each { |element| stack << element if element != stack.last }
  stack
end

p unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
p unique_in_order('ABBCcAD') == ['A', 'B', 'C', 'c', 'A', 'D']
p unique_in_order([1,2,2,3,3]) == [1, 2, 3]
