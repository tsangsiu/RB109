# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

=begin

# Problem
- Given a string, return the character which appears the lowest number of times
- If there are more than 1 character that appears the lowest number of times,
  - Return the one that appears first
- Ignore the case here (consider lowercase letters only)

# Algorithm
"Hello World"
-> "hello world"
-> ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
counts = { "h"=>1, "e"=>1, "l"=>2, ...}

- Given a string, turn the whole string to lowercase characters
- Split the string into an array of individual character
- Initialize a hash called `counts` with a default value 0
- Iterate through the array of characters,
  - Tally each character and record the result in `counts`
- Find the first key-value pair in `counts` that has the minimum count
- Return the corresponding key

=end

# Code
def least_common_char(str)
  chars = str.downcase.chars
  counts = Hash.new(0)
  chars.each do |char|
    counts[char] += 1
  end
  pair_min = counts.min_by do |key, value|
    value
  end
  pair_min.first
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'
