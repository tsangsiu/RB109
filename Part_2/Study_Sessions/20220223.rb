=begin

Question:
Given a list (e.g., [1,3,4,2,3,2,3,3]) and number (N) (e.g., 2), create a new list that contains each number of the list at most N times.

Problem:
- Input: array and integer
- Output: a new array
- Rules:
  - given an array and an integer, returns a new array where each element in the array occurred at most N times
  - return a new array (non-destructive)
- Question:
  - What is the element order of the new array?
    - like the original array

Examples:
p delete_nth([1,2,3,1,2,1,2,3],2) == [1,2,3,1,2,3]
p delete_nth([20,37,20,21], 1) == [20,37,21]
p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1,1,3,3,7,2,2,2]
p delete_nth([1,2,3,1,1,2,1,2,3,3,2,4,5,3,1],3) == [1,2,3,1,1,2,2,3,3,4,5]
p delete_nth([1,1,1,1,1], 5) == [1,1,1,1,1]
p delete_nth([5,4,3,2,1,1,1,1,1,1,2,3,4,5], 5) == [5,4,3,2,1,1,1,1,1,2,3,4,5]

Data Structures:
- Input: an array and an integer
- Intermediate: a new array
- Output: a new array

Algorithm:
- initialise a new array `output` to return
- iterate through each element in the given array
  - if that element occurred less than the specified times in `output`
    - append that element to `output`
- return `output`

=end

# Code:

def delete_nth(list, number)
  output = []
  list.each do |element|
    output << element if output.count(element) < number
  end
  output
end

p delete_nth([1, 2, 3, 1, 2, 1, 2, 3], 2) == [1, 2, 3, 1, 2, 3]
p delete_nth([20, 37, 20, 21], 1) == [20, 37, 21]
p delete_nth([1, 1, 3, 3, 7, 2, 2, 2, 2], 3) == [1, 1, 3, 3, 7, 2, 2, 2]
p delete_nth([1, 2, 3, 1, 1, 2, 1, 2, 3, 3, 2, 4, 5, 3, 1], 3) == [1, 2, 3, 1, 1, 2, 2, 3, 3, 4, 5]
p delete_nth([1, 1, 1, 1, 1], 5) == [1, 1, 1, 1, 1]
p delete_nth([5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5], 5) == [5, 4, 3, 2, 1, 1, 1, 1, 1, 2, 3, 4, 5]
