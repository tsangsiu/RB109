=begin

Problem:
- Rules/Requirements
  - Given an array of strings, sort them in alphabetical order, ignoring cases
- Input: Array
- Output: Array
- Question
  - Destructive?
    - I suppose it's non-destructive.

Examples:
p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]

Data Structures:
Input: Array
Intermediate: Array
Output: Array

Algorithm:
- Given an array of strings,
  - sort it by the lowercase version of each element
- Return the result array

=end

# Code
def sortme(array)
  array.sort_by { |element| element.downcase }
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]
