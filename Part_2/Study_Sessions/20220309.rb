=begin

# Problem
- Given a list (e.g., [1,2,3,1,2,1,2,3]) and a number N (e.g., 2),
- Create a new list that contain each number of the list at most N times

# Examples
p delete_nth([1,2,3,1,2,1,2,3], 2) == [1,2,3,1,2,3]
p delete_nth([20,37,20,21], 1) == [20,37,21]
p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1,1,3,3,7,2,2,2]
p delete_nth([1,2,3,1,1,2,1,2,3,3,2,4,5,3,1], 3) == [1,2,3,1,1,2,2,3,3,4,5]
p delete_nth([1,1,1,1,1], 5) == [1,1,1,1,1]
p delete_nth([5,4,3,2,1,1,1,1,1,1,2,3,4,5], 5) == [5,4,3,2,1,1,1,1,1,2,3,4,5]

# Data Structure
- Input: Array, Integer
- Output: a new Array

# Brainstorm
- Initialize an empty Array (called `output`) for output
- Iterate through the given Array
- For each element in the Array,
  - Count the number of occurrence of it in `output`
  - If the count is less than N,
    - Append the element to `output`
- Return `output`

# Algorithm
- Initialize an empty Array called `output`
- Iterate through the given Array
  - If the number of occurrence of the current element is less than N,
    - Append the current element to `output`
- Return `output`

=end

# Code

def delete_nth(arr, n)
  output = []
  arr.each do |element|
    output << element if output.count(element) < n
  end
  output
end

=begin

# Re-do before assessment

- Given a list (e.g., [1,2,3,1,2,1,2,3]) and a number N (e.g., 2),
- Create a new list that contain each number of the list at most N times

# Problem
- Given an array `arr` and a number `N`,
  - Return an array that contains each element at most `N` times

# Algorithm
output = []
[1,2,3,1,2,1,2,3]

- Initialize `output` to an empty array
- Iterate through the given array,
  - For the current number, check there are how many of that number in `output`
  - If the count is less than `N`,
    - Push the current number to `output`
- Return `output`

=end

# Code
def delete_nth(arr, n)
  output = []
  arr.each do |num|
    count = output.count(num)
    output << num if count < n
  end
  output
end

p delete_nth([1,2,3,1,2,1,2,3], 2) == [1,2,3,1,2,3]
p delete_nth([20,37,20,21], 1) == [20,37,21]
p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1,1,3,3,7,2,2,2]
p delete_nth([1,2,3,1,1,2,1,2,3,3,2,4,5,3,1], 3) == [1,2,3,1,1,2,2,3,3,4,5]
p delete_nth([1,1,1,1,1], 5) == [1,1,1,1,1]
p delete_nth([5,4,3,2,1,1,1,1,1,1,2,3,4,5], 5) == [5,4,3,2,1,1,1,1,1,2,3,4,5]
