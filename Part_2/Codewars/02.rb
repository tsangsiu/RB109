=begin

# Problem
- Given an array of integers,
  - Return the number of pairs in that array
- If an array is empty or contain only one integer, return 0
- If there are more pairs of a certain number, count each pair only once
  - For example, [0, 0, 0, 0] -> 2

# Examples
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

# Data Structires
- Input: Array
- Intermediate: Hash
- Output: Integer

# Algorithm
- Initialize `pair_count` to 0
- Initialize an empty Hash called `number_count`, with a default value 0
- Iterate through the Array,
  - Use each number in the Array as a key
  - Increment its value by 1
- Iterate through the values of the Hash `number_count`
  - Each value here is the count of each number
  - Increment `pair_count` by the value / 2
- Return `pair_count`

=end

def pairs(arr)
  pair_count = 0
  number_count = Hash.new(0)
  arr.each do |num|
    number_count[num] += 1
  end
  number_count.each_value do |value|
    pair_count += value / 2
  end
  pair_count
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
