=begin

You are given a string s consisting of digits and an integer k.

A round can be completed if the length of s is greater than k. In one round, do the following:

Divide s into consecutive groups of size k such that the first k characters are 
in the first group, the next k characters are in the second group, and so on.
Note that the size of the last group can be smaller than k.

Replace each group of s with a string representing the sum of all its digits. 
For example, "346" is replaced with "13" because 3 + 4 + 6 = 13.
Merge consecutive groups together to form a new string. If the length of the 
string is greater than k, repeat from step 1.

Return s after all rounds have been completed.

# Problem
- Given a string of digits, and an integer `n_digit`,
- group the str in groups of `n_digit`
- calculate the sum of digits of each group
- append the sum together as a string
- repeat the above process until the length is less than or equal to `n_digit`
- return the result

# Algorithm
- Given a string `str` and an integer `n_digit`
  - Until the length of `str` is less than or equal to `n_digit`
    - Split the string into groups of `n_digit`
    - Calcuate the sum of the digits in each group
    - Append the sums as one string
  - Return the result string

- A method to split the string into group of `n_digit`
  - Initialize `output` to an empty array
  - Given a string and an integer `n_digit`
    - Until the string is empty
      - slice the first `n_digit` character and push that to `output`
      - set the string to the remainder of the string
    - return `output`

=end

def split_str(str, len)
  output = []
  until str == nil || str == ''
    output << str[0...len]
    str = str[len..]
  end
  output
end

def digit_sum(str, n_digit)
  loop do
    groups = split_str(str, n_digit)
    groups = groups.map do |group|
      group.chars.map(&:to_i).sum.to_s
    end
    str = groups.join('')
    break if str.length <= n_digit
  end
  
  str
end

p digit_sum("123456", 2) == "12"
p digit_sum("11111222223", 3) == "135"
p digit_sum("00000000", 3) == "000"
