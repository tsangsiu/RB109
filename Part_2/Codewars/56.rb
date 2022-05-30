=begin

Your goal is to write the group_and_count method, which should receive an array 
as a unique parameter and return a hash. Empty or nil input must return nil 
instead of a hash. This hash returned must contain as keys the unique values of 
the array, and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}

The following methods were disabled:
Array#count
Array#length

# Problem
- Given an array, return a hash of the count of all unique elements in the array
- The key of the hash is the unique elemnet in the array
- The value of the hash is the count of the corresponding element

# Algorithm
- return nil if the given array is empty or nil
- Initialize `count` to an empty hash, with a default value 0
- Iterate through the given array
  - Increment the value of the corresponding element (key) by 1
- Return `count`

=end

def group_and_count(arr)
  return nil if arr == [] || arr == nil
  count = Hash.new(0)
  arr.each do |element|
    count[element] += 1
  end
  count
end

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}
