=begin

# Problem
- Reverse an array without using the `Array#reverse` method

# Examples
p rev([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]
p rev([1, 1, 1, 2, 2, 2]) == [2, 2, 2, 1, 1, 1]
p rev([0]) == [0]
p rev([]) == []

# Algorithm
- Initialize an empty Array called `rev_arr`
- Iterate through the given Array,
  - For every element, add it to the front of `rev_arr`
- Return rev_arr

=end

def rev(arr)
  rev_arr = []
  arr.each do |element|
    rev_arr.unshift(element)
  end
  rev_arr
end

p rev([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]
p rev([1, 1, 1, 2, 2, 2]) == [2, 2, 2, 1, 1, 1]
p rev([0]) == [0]
p rev([]) == []

# Follow-Up Questions

# 1. What if we want a destructive `rev!` method?
=begin

# Brainstorm
- We should modify the given Array in-place
- Do switching: multiple element re-assignment at the same time
- [1, 2, 3, 4, 5] -> [5, 2, 3, 4, 1] (odd-number element case)
- 1st and 5th switch (index 0 and 4), 2nd and 4th switch (index 1 and 3), 3rd unchanged (index 2)
- [1, 2, 3, 4, 5, 6] -> [6, 2, 3, 4, 5, 1] (even-number element case)
- 1st and 6th switch (index 0 and 5), 2nd and 5th switch (index 1 and 4), 3rd and 4th switch (index 2 and 3)
- Iterate to the mid-way of the array, do the switch

# Algorithm
- Given an array of size n (no matter n is odd or even)
- Iterate through the array from index position 0 to exlucing length of the Array
  - Switch the element at the current index with the element at index (Array.size - 1 - index)
- Return the original given Array

=end

def rev!(arr)
  arr.each_with_index do |_, index|
    arr[index], arr[arr.size - 1 - index] = arr[arr.size - 1 - index], arr[index]
    break if index + 1 >= arr.size / 2
  end
end

arr = [1, 2, 3, 4, 5]
rev!(arr)
p arr == [5, 4, 3, 2, 1]

arr = [1, 1, 1, 2, 2, 2]
rev!(arr)
p arr == [2, 2, 2, 1, 1, 1]

arr = [0]
rev!(arr)
p arr == [0]

arr = []
rev!(arr)
p arr == []
