=begin

You are given a positive integer num consisting of exactly four digits. Split 
num into two new integers new1 and new2 by using the digits found in num. 
Leading zeros are allowed in new1 and new2, and all the digits found in num 
must be used.

For example, given num = 2932, you have the following digits: two 2's, one 9 and 
one 3. Some of the possible pairs [new1, new2] are [22, 93], [23, 92], [223, 9] and [2, 329].
Return the minimum possible sum of new1 and new2.

# Problem
- Given a num, split the digits into two numbers
- Among all the possible sets of 2 numbers, return the minmum of the sum

# Brainstorm
- Consider the four digits d0<=d1<=d2<=d3
- The sum is the minimum when (d0*10+d2) + (d1*10+d3)

# Algorithm
- Given a num, turn it into an array of individual digits
- Sort the above array
- The minimum sum is (the sum of 2 smallest number)*10 + (the sum of 2 biggest number)

=end

def minimum_sum(num)
  digits = num.to_s.chars.map(&:to_i).sort
  (digits[0] + digits[1]) * 10 + digits[2] + digits[3]
end

p minimum_sum(2932) == 52
p minimum_sum(4009) == 13
