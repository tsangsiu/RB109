=begin

Write a function with the signature shown below:

def is_int_array(arr)
  true
end

returns true if every element in an array is an integer or a float with no decimals.
returns true if array is empty.
returns false for every other input.

# Problem
- Given an array, return true if
  - the given array is empty
  - the elements are all integers or floats without decimals

# Algorithm
- Given an array,
  - return false if the given argument is not an array
  - return true if the given array is empty
  - If all elements are integers or float without decimals,
    - return true
  - Else,
    - return false

=end

def is_int_array(arr)
  return false if arr.class != Array
  return true if arr.empty?
  arr.all? { |element| element.class == Integer || element == element.to_i }
end

p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false
