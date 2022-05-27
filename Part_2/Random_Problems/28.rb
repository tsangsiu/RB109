=begin

Given an integer array nums, return the number with the value closest to 0 in 
nums. If there are multiple answers, return the number with the largest value.

# Problem
- Given an array of numbers,
- return the value of the number that is closet to 0
- If there is more than 1 answer, return the largest one

# Algorithm
- Select the minimum number when absolute from the given array
- From the above array, return the largest value

=end

def find_closest_number(arr)
  arr.select { |num| num.abs == arr.map(&:abs).min }.max
end

p find_closest_number([3,7,14,1,-1]) #== 1
p find_closest_number([2,5,7,-1]) #== -1
p find_closest_number([4,26,10,3]) #== 3
p find_closest_number([10]) #== 10
p find_closest_number([-4,-2,1,4,8]) #== 1
