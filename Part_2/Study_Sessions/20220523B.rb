# You are given an array which contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

# You can asume there is never an empty array and there will always be an integer.

=begin

# Problem
- given an array,
  - sum the same consecutive integers

# Algorithm
- Initialize `sums` to an empty array
- Initialize `sum` to 0
- Initialize `last_num` to nil
- Iterate through the given arr,
  - if the current number is not the same as the last number,
    - push `sum` to `sums` if `last_num` is not nil
    - Set `sum` to the current number
    - Set `last_num` to the current number
  - else
    - Increment `sum` by the current number
    - set `last_num` to the current number
- push `sum` to `sums`
- Return `sums`

# Algorithm (High Level, Improved)
- Iterate through the given array,
  - If the current number is the same as the last one,
    - Push the accumulated sum to result array
    - Set sum to the current number
    - Set the last number as the current number
  - Else,
    - Increment sum by the current number
    - Set the last number as the current number
- Push the accumulated sum to result array
- Return the result array

=end

def sum_consecutives(arr)
  sums = []
  sum = 0
  last_num = nil

  arr.each do |num|
    if num != last_num
      sums << sum if last_num != nil
      sum = num
      last_num = num
    else
      sum += num
      last_num = num
    end
  end

  sums << sum
  sums
end

p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
