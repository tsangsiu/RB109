=begin

Create a method that takes two lists of numbers sorted in ascending order and 
returns an array of numbers which are common to both the input arrays.

# Problem
- Given two arrays,
- Return an array containing all common elements, sorted in descending order

# Algorithm
- Initialize `output` to an empty array
- Find the shorter array
- Create an array of unique element in the shorter array
- Iterate through the above array,
  - If the current appears in both arrays,
    - Find the count in both arrays
    - Push the current element by the smaller counter to `output`
- Sort `output` in descending order
- return `output`

=end

def common_elements(arr1, arr2)
  output = []
  arr_short = [arr1, arr2].min_by { |arr| arr.length }
  arr_short_uniq = arr_short.uniq
  arr_short_uniq.each do |element|
    if [arr1, arr2].all? { |arr| arr.include?(element) }
      count_min = [arr1.count(element), arr2.count(element)].min
      count_min.times { |_| output << element }
    end
  end
  output.sort.reverse
end

p common_elements([-1, 3, 4, 6, 7, 9], [1, 3]) == [3]
p common_elements([1, 3, 4, 6, 7, 9], [1, 2, 3, 4, 7, 10]) == [7, 4, 3, 1]
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 4, 5]) == [5, 4, 2, 1]
p common_elements([1, 2, 3, 4, 5], [10, 12, 13, 15]) == []
p common_elements([1, 2, 2, 2, 3, 4, 5], [1, 2, 2, 4, 5]) == [5, 4, 2, 2, 1]
