=begin

Problem
Rules/Requirements
- Write a function that subtracts one list from another and returns the result.
- The function should remove all values from list a, which are present in list b.
- If a value is present in b, all of its occurrences must be removed from the other.
Input: Array
Output: Array
Question
- If the method destructive?
  - Not destructive, I guess

Examples
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []

Data Structures
Input: Array
Intermediate: Array
Output: Array

Algorithm
- Given two arrays, array A and array B
- Clone the array A
- Iterate through every element in array B
  - If that element is in array A, remove it
- return the result cloned array A

=end

# Code
def array_diff(array, remove_list)
  output = array.clone
  remove_list.each do |element|
    output.delete(element) if output.include?(element)
  end
  output
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
