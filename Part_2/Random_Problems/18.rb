=begin

Given a binary array nums, return the maximum number of consecutive 1's in the array.

# Problem
- Given an array of numbers,
- return the length of the longest consecutive 1's in the array
- Input: string
- Output: integer

# Algorithm
- Initialize an empty array called `length_1`
- Given an array, slice the array into groups of the same numbers
- Iterate through the groups,
  - If the groups are all 1's
  - find the length
  - push the length to `length_1`
- Return the maximum number in `length_1`

=end

def find_max_consecutive_ones(arr)
  length_1 = [0]
  groups = arr.slice_when { |num1, num2| num1 != num2 }.to_a
  groups_length = groups.each do |group|
    length_1 << group.size if group.all? { |element| element == 1 }
  end
  length_1.max
end

=begin

# Algorithm (not using `slice_when`)
- Initialize `lens_1` to [0]
- Initialize `len_1` to 0
- Iterate through the array
  - If the current number is 1
    - Increment `len_1` by 1
  - Else,
    - push `len_1` to `lens_1` if `len_1` is not equal to 0
    - Set `len_1` to 0
- Push `len_1` to `lens_1`
- Return the maximum value in `lens_1`

=end

def find_max_consecutive_ones(arr)
  lens_1 = [0]
  len_1 = 0

  arr.each do |num|
    if num == 1
      len_1 += 1
    else
      lens_1 << len_1 if len_1 != 0
      len_1 = 0
    end
    lens_1 << len_1
  end

  lens_1.max
end

p find_max_consecutive_ones([1,1,0,0,1,0]) == 2
p find_max_consecutive_ones([0,1,0,1,1,0,1,1,1]) == 3
p find_max_consecutive_ones([0,0,0]) == 0
p find_max_consecutive_ones([0,1,0]) == 1
p find_max_consecutive_ones([1,0,1,1,0,1]) == 2
p find_max_consecutive_ones([1,1,0,1,1,1]) == 3
