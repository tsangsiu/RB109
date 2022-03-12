=begin

Given a list (e.g., [1,2,3,1,2,1,2,3]) and a number (N) (e.g., 2),
create a new list that contains each number of the list at most N times.

Problem
- Input: Array (list of numbers), Integer (N)
- Output: New Array
- Rules/Requirements
  - Create a new list
  - The new list should contain each number at most N times
- Questions
  - What are the boundaries of N? Greater than 1
  - Is the list only dealing with integer? Yes
  - What is the order of the return array? Preserves original order

Examples
p delete_nth([1,2,3,1,2,1,2,3], 2) == [1,2,3,1,2,3]
p delete_nth([20,37,20,21], 1) == [20,37,21]
p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1,1,3,3,7,2,2,2]
p delete_nth([1,2,3,1,1,2,1,2,3,3,2,4,5,3,1], 3) == [1,2,3,1,1,2,2,3,3,4,5]
p delete_nth([1,1,1,1,1], 5) == [1,1,1,1,1]
p delete_nth([5,4,3,2,1,1,1,1,1,1,2,3,4,5], 5) == [5,4,3,2,1,1,1,1,1,2,3,4,5]

Data Structures
- Input: Array, Integer
- Intemediate: Array
- Output: Array

Scratchpad
- Iteration? Counter?
- Create an empty array for output. Push to output array only if that number appears less than N times in the output array.

Guiding Questions
- Do I need iteration? What do I need to iterate over? Do I need multiple iterations?
- What kind of information do I need perform the necessary task at each iteration?
- Think about the logic of the problem as computer-like as possible.

Algorithm
# Luke
Initialize a hash that keeps track of the count for each number
Initialize an empty return list
Iterate over the input list of numbers
  Increment the count hash accordingly
  Append to return list if count of num is less than or equal to N
End iteration
Return empty return list

# Mine
- Given an array and an integer N,
- initialise an empty array called `output`
- Iterate through each integer in the array
  - If that integer occurs less than N times in `output`,
    - push it to `output`
- return `output`

Note
- For future interviews, you may need to come up with your own test cases.
- N could be 0.

=end

# Code
def delete_nth(input_list, times)
  output = []
  input_list.each do |integer|
    output << integer if output.count(integer) < times
  end
  output
end

def delete_nth(input_list, times)
  input_list.each_with_object([]) do |integer, output|
    output << integer if output.count(integer) < times
  end
end

def delete_nth(input_list, times)
  count = Hash.new(0)
  output = []
  input_list.each do |int|
    count[int] += 1
    output << int if count[int] <= times
  end
  output
end

def delete_nth(input_list, times)
  input_list.select.with_index { |num, index| input_list[0..index].count(num) <= times }
end

p delete_nth([1,2,3,1,2,1,2,3], 2) == [1,2,3,1,2,3]
p delete_nth([20,37,20,21], 1) == [20,37,21]
p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1,1,3,3,7,2,2,2]
p delete_nth([1,2,3,1,1,2,1,2,3,3,2,4,5,3,1], 3) == [1,2,3,1,1,2,2,3,3,4,5]
p delete_nth([1,1,1,1,1], 5) == [1,1,1,1,1]
p delete_nth([5,4,3,2,1,1,1,1,1,1,2,3,4,5], 5) == [5,4,3,2,1,1,1,1,1,2,3,4,5]
