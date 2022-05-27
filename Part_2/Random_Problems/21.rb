=begin

Given a 2D integer array nums where nums[i] is a non-empty array of distinct
positive integers, return the list of integers that are present in each array
of nums sorted in descending order.

# Problem
- Given an array of arrays
- Return an array of elements that present in all arrays
- and sort them in descending order

# Algorithm
- Inititalize `output` to an empty array
- Iterate through the shortest sub-array
  - if the current element exist in all arrays
  - push that to `output`
- sort the `output` array in descending order
- return `output`

=end

# Code
def intersection(arr)
  output = []
  arr_shortest = arr.min_by { |sub_arr| sub_arr.size }
  arr_shortest.each do |element|
    output << element if arr.all? { |sub_arr| sub_arr.include?(element) }
  end
  output.sort.reverse
end  

p intersection([[3,1,2,4,5],[1,2,3,4],[3,4,5,6]]) == [4,3]
p intersection([[1,2,3],[4,5,6]]) == []
p intersection([[2,4,3,5],[1,2,6,5], [3,2,1,5]]) == [5,2]
p intersection([[6,2,4,4],[5,1,1,6],[0,4,7,6]]) == [6]
p intersection([[4,5,3],[2,2,2],[3,4,5]]) == []
