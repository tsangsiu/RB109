# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

=begin

# Problen
- Given an array of integers, return the pairs that are the closest
- If there are more than two pairs that are the closest, return the pair that appears first
- Input: Array of integers
- Output: Array of the closest pair

# Algorithm
[12, 7, 17]
-> [[12, 7], [12, 17], [7 17]]
-> [5, 5, 10]
-> [12, 7]

- Given an array of integers, get all possible pairs of integers
- For each pair, calculate the difference
- Return the pair which has the minimum difference

=end

# Code
def closest_numbers(arr)
  pairs = arr.combination(2).to_a
  diff = pairs.map { |pair| (pair.first - pair.last).abs }
  index_min_diff = diff.index(diff.min)
  pairs[index_min_diff]
end

def closest_numbers(arr)
  pairs = arr.combination(2).to_a
  pairs.min_by { |pair| (pair.first - pair.last).abs }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
