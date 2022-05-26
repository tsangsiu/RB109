=begin

Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note that you must do this in-place without making a copy of the array.

# Problem
- Given an array of numbers,
- move all zeros to the end of the array,
- while maintaining the relative order of the non-zero numbers
- The method must be mutating
- Input: array
- Output: the same array

# Algorithm
- Given an array of numbers,
  - Initialize `zero_count` to 0
  - Iterate through the array
    - If the current number is 0
      - remove the 0 from the arr
      - increment `zero_count` by 1
      - stay at the current index position
    - Else
      - go to the next element
  - Push 0 the the array by `zero_count` times
  - return the array

=end

def move_zeroes(arr)
  zero_count = 0
  index = 0
  loop do
    if arr[index] == 0
      arr.delete_at(index)
      zero_count += 1
    else
      index += 1
    end
    break if index >= arr.size
  end

  zero_count.times { |_| arr << 0 }
  arr
end

p move_zeroes([0,12,3,0,4]) == [12,3,4,0,0]
p move_zeroes([0]) == [0]
p move_zeroes([0,1,0,3,12]) == [1,3,12,0,0]
p move_zeroes([3,0,9,0,1,20,0,1]) == [3,9,1,20,1,0,0,0]
p move_zeroes([4,2,4,1,3]) == [4,2,4,1,3]

arr = [0,12,3,0,4]
move_zeroes(arr)
p arr == [12,3,4,0,0]
