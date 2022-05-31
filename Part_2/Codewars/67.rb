=begin

In this Kata, you will be given two integers n and k and your task is to remove
k-digits from n and return the lowest number possible, without changing the 
order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056
and return the lowest possible number. The best digits to remove are (1,2,3,6) 
so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', 
because we have removed 8 and 9.

# Problem
- Given two integers `n` and `k`,
  - remove `k` digits from `n`
  - and return the minimum integer possible while maintaining the relative order of the digits

# Algorithm
- Given two integers `n` and `k`
- Turn `n` into a string, and then an array of individual digits
- Get all possible combination of `k` digits from the above array
- Select the element from the above array that its value is the smallest

=end

def solve(n, k)
  digits = n.to_s.chars
  nums = digits.combination(digits.size - k).to_a
  nums = nums.map { |digits| digits.join('') }
  nums.min_by { |num| num.to_i }
end


p solve(123056, 1) == '12056'
p solve(123056, 2) == '1056'
p solve(123056, 3) =='056'
p solve(123056, 4) == '05'
p solve(1284569, 1) == '124569'
p solve(1284569, 2) == '12456'
p solve(1284569, 3) == '1245'
p solve(1284569, 4) == '124'
