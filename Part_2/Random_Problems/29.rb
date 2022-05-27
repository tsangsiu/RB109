=begin

A string s can be partitioned into groups of size k using the following procedure:

   The first group consists of the first k characters of the string, the second group consists of the next k characters of the string, and so on. Each character can be a part of exactly one group.
   For the last group, if the string does not have k characters remaining, a character fill is used to complete the group.

Note that the partition is done so that after removing the fill character from the last group (if it exists) and concatenating all the groups in order, the resultant string should be s.

Given the string s, the size of each group k and the character fill, return a string array denoting the composition of every group s has been divided into, using the above procedure.

# Problem
- Given a string `str`, group size `grp_size` and string `fill`
- Split `str` into groups of `grp_size` characters
- If the last group does not have the length of `grp_size`, fill it up with the character `fill`

# Algorithm
- Given a string `str`, group size `grp_size`, and a string `fill`
  - Initialize an empty array called `output`

  - Set `index` to 0
  - While `index` is less than the length of `str`,
    - push the substring from `index` of length `grp_size` to output
    - increment `index` by `grp_size`
  
  - if `output` is empty, set it to an array of an empty string

  - If the last substring is not of length `grp_size`
    - Fill the substring `fill` to it until it's of length `grp_size`
  - Return `output`

=end

def divide_string(str, grp_size, fill)
  output = []

  index = 0
  while index < str.length
    output << str[index...(index + grp_size)]
    index += grp_size
  end
  output = [''] if output.empty?

  last_substr = output.last
  if last_substr.length < grp_size
    (grp_size - last_substr.length).times { |_| last_substr << fill }
  end

  output
end

p divide_string("aabbccd", 2, "x") == ["aa", "bb","cc","dx"]
p divide_string("abcdefghij", 3, "x") == ["abc","def","ghi","jxx"]
p divide_string("aa", 3, "x") == ["aax"]
p divide_string("abcdefghi", 3, "x") == ["abc","def","ghi"]
p divide_string("", 2, "x") == ["xx"]
p divide_string("aaa", 1, "x") == ["a","a","a"]
