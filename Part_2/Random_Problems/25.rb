=begin

# Given a array, swap every two adjacent elements and return the re sorted array.
You must solve the problem without modifying the values in the array's elements
(i.e., only elements themselves may be changed.)

# Given an array and returns an array where each element is swapped with the adjacent element.

# Problem
- Given an array,
- Swap each pair of valus in the array
- mutating? I will do both mutating and non-mutating version

# Algorithm
- Mutating Version
  - loop every other element in the array and start with the first element,
    - swap the current element with the next element if there is one
  - return the original array

- Non-Mutating Version
  - Initialize `output` to an empty array
  - loop every other element in the array and start with the first element,
    - Set the current index position in `output` to the element at (index + 1) position of the given array
    - Set the (index + 1) position in `output` to the element at the current index position
  - Return `output`

=end

def sort_pairs!(arr)
  index = 0
  loop do
    arr[index], arr[index + 1] = arr[index + 1], arr[index] if index + 1 < arr.size
    index += 2
    break if index >= arr.size
  end
  arr
end

def sort_pairs(arr)
  return [] if arr == []
  output = []
  index = 0
  loop do
    if index + 1 < arr.size
      output[index] = arr[index + 1]
      output[index + 1] = arr[index]
    else
      output[index] = arr[index]
    end
    index += 2
    break if index >= arr.size
  end
  output
end
  
arr = [1,2,3,4]
sort_pairs!(arr)
p arr == [2,1,4,3]

arr = []
sort_pairs!(arr)
p arr == []

arr = [1]
sort_pairs!(arr)
p arr == [1]

arr = [4,6,8,10,4,12]
sort_pairs!(arr)
p arr == [6,4,10,8,12,4]

p sort_pairs([1,2,3,4]) == [2,1,4,3]
p sort_pairs([]) == []
p sort_pairs([1]) == [1]
p sort_pairs([4,6,8,10,4,12]) == [6,4,10,8,12,4]
