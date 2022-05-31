=begin

You are given an array (which will have a length of at least 3, but could be 
very large) containing integers. The array is either entirely comprised of odd 
integers or entirely comprised of even integers except for a single integer N. 
Write a method that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

# Problem
- Given an array of integers of size of at least 3,
- The integers could be all odd or even, except for one
- Return the 'odd' number

# Algorithm
- Given an array,
  - Count the number of odd number
  - Count the number of even number
  - If the number of odd number is 1,
    - Return the odd number
  - Else if the number of even number is 1,
    - Return the even number

=end

def find_outlier(ints)
  n_odd = ints.count { |int| int.odd? }
  n_even = ints.count { |int| int.even? }
  if n_odd == 1
    ints.select { |int| int.odd? }.first
  elsif n_even == 1
    ints.select { |int| int.even? }.first
  end
end

p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160
