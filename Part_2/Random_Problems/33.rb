=begin
  
You are given an array of integers `nums`. You are also given an integer original which is the first number that needs to be searched for in nums.

You then do the following steps:

If original is found in nums, multiply it by two (i.e., set original = 2 * original).
Otherwise, stop the process.
Repeat this process with the new number as long as you keep finding the number.
Return the final value of original.

# Problem
- Given an array of integers `nums` and an integer `original`
- If `original` appears in `nums`, double `original`
- Repeat the above process until `original` is not found in `nums`
- Return `original` then
- If `original` is 0, return 0
- Input: array, integer
- Output: integer

# Algorithm
- Given an array of integers `nums` and an integer `original`
  - Return 0 if `original` is 0
  - Until `original` is not found in `nums`,
    - Set `original` to `original` * 2
  - Return `original`

=end

def find_final_value(nums, original)
  return 0 if original == 0
  while nums.include?(original)
    original *= 2
  end
  original
end

p find_final_value([5,4,7], 1) == 1
p find_final_value([5], 5) == 10
p find_final_value([5,3,6,1,12], 3) == 24
p find_final_value([0,0,0], 0) == 0
p find_final_value([5,7,8,0], 0) == 0
