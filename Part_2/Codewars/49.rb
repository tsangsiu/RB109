=begin

Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.
In other words:

Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# Problem
- Given a positive integer n and p,
  - Return a positive integer k such that:
  - n = abcd.. (in digits) = a^p + b^(p+1) + c^(p+2) + d^(p+3) +... = n * k
- If k does not exist, return -1

# Algoithm
- Turn the given number n into an array of digits
- From the leftmost digit, take each digit to the power of p, p+1, p+2, ... and so on
- Find the sum
- If the sum is divisible by n, return sum/n,
- Else, return -1

=end

def dig_pow(n, p)
  digits = n.digits.reverse
  sum = digits.map.with_index do |digit, index|
    power = p + index
    digit ** power
  end.sum
  sum % n == 0 ? sum / n : -1
end

p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2
