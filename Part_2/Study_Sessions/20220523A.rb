# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

=begin

# Problem
- given an array,
- return the minimal length of contiguous subarray of which the sum is greater than or equal to s
- if no, return 0

# Algorithm
- Get all possible sub-arrays of the given array
  - Initialize `sub_arrays` to an empty array
  - Iterate from index 0 up to, but exlcuding, the size of the array, (`start_index`)
  - Set `end_index` to `start_index`
  - Iterate from `end_index` up to, but excluding, the size of the array,
    - Get the sub-array from `start_index` to `end_index`
    - Push the sub-array to `sub_arrays`
  - return `sub_arrays`

- Find the sum of the elements of each sub-array
- Select the sub-array whhere the sum is greater than `s`
- return 0 if the result array is empty
- Find the one with the minimal length
- Return its length

=end

def sub_arrays(arr)
  sub_arrays = []
  (0...arr.size).each do |start_index|
    end_index = start_index
    (end_index...arr.size).each do |end_index|
      sub_arrays << arr[start_index..end_index]
    end
  end
  sub_arrays
end

def minSubLength(arr, s)
  sub_arrays = sub_arrays(arr)
  sub_arrays = sub_arrays.select { |sub_array| sub_array.sum >= s }
  return 0 if sub_arrays.empty?
  sub_arrays.min_by { |sub_array| sub_array.length }.size
end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
