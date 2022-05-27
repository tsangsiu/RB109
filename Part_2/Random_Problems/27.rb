=begin

You are given a 0-indexed integer array nums. Rearrange the values of nums
according to the following rules:

Sort the values at odd indices of nums in non-increasing order.
For example, if nums = [4,1,2,3] before this step, it becomes [4,3,2,1] after. 
The values at odd indices 1 and 3 are sorted in non-increasing order.

Sort the values at even indices of nums in non-decreasing order.
For example, if nums = [4,1,2,3] before this step, it becomes [2,1,4,3] after. 
The values at even indices 0 and 2 are sorted in non-decreasing order.
Return the array formed after rearranging the values of nums.

# Problem
- Given a 0-indexed array of numbers,
  - For odd index, sort in non-increasing order
  - For even index, sort in non-decreasing order

# Algorithm
- Initialize two empty arrays called `even_index` and `odd_index`
- Select odd-indexed elements from the given array and put them to `odd_index`
- Do the same for even-indexed elements
- Sort `odd_index` in decreasing order
- Sort `even_index` in ascending order
- Initialize `output` to an empty_array
- Until both `odd_index` and `even_index` are empty,
  - shift the first element in `even_index` and `odd_index` in order
  - and push the element to `output`
- Return `output`

=end

def sort_even_odd(arr)
  even_index = arr.select.with_index { |_, index| index.even? }.sort
  odd_index = arr.select.with_index { |_, index| index.odd? }.sort.reverse

  output = []
  until even_index.empty? && odd_index.empty?
    output << even_index.shift << odd_index.shift
  end
  output
end

p sort_even_odd([1,3,5,4]) == [1,4,5,3]
p sort_even_odd([4,1,2,3]) == [2,3,4,1]
p sort_even_odd([2,4,1,78]) == [1,78,2,4]
p sort_even_odd([2,1]) == [2,1]
