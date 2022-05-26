=begin

Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

# Problem
- Given a string, find the first character that is unique in the string
- Return its index position
- If that does not exist, return -1

# Algorithm
- Iterate through the given string
  - Count the number of the current character in the given string
  - If the count equals 1,
    - return its index position
- Return -1

=end

# Code
def first_uniq_char(str)
  str.each_char.with_index do |char, index|
    return index if str.count(char) == 1
  end
  -1
end

p first_uniq_char("") == -1
p first_uniq_char("aabccde") == 2
p first_uniq_char("rainbow") == 0
p first_uniq_char("eeaatt") == -1
p first_uniq_char("lovelettuce") == 1
p first_uniq_char("aabb") == -1
