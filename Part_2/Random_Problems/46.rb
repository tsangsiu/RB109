=begin

Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

# Problem
- Given an array of numbers, return all triplets that sums to 0
- Return an empty array if
  - There are no 3 numbers that sum to 0
  - The given array contains less than 3 elements

# Algorithm
- Return `[]` if the given array contains less than 3 elements
- Initialize `output` to an empty array
- Get all possible triplets
- Select the triplets that sum to 0
- Sort all triplets
- Return the array containing unique triplets

=end

def three_sum(nums)
  triplets = []
  return triplets if nums.size < 3
  (0...nums.size).each do |i|
    (0...nums.size).each do |j|
      (0...nums.size).each do |k|
        triplets << [nums[i], nums[j], nums[k]] if i != j && i != k && j != k
      end
    end
  end

  triplets = triplets.select do |triplet|
    triplet.sum == 0
  end

  triplets = triplets.map do |triplet|
    triplet.sort
  end.sort

  triplets.uniq
end

p three_sum([-1,0,1,2,-1,-4]) == [[-1,-1,2],[-1,0,1]]
p three_sum([]) == []
p three_sum([0]) == []
