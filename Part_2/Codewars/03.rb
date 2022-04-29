=begin

# Problem
- Given a String and a substring, return the count of the substring in the String

# Examples
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('aa_bb_cc_dd_bb_e', 'bb') == 2
p solution('aaabbbcccc', 'bbb') == 1

# Brainstorm
- We can't use `String#count` here
- Instead, thinking to split the given String at the substring
  - The number of elements in the return Array minus 1 would be the count
- But there is an edge case, substring happened at both ends
- In that case,
  - 1st, check if the String starts with the substring (using `String#start_with?`)
    - If yes, add 1 to the count
  - 2nd, check if the String ends with the substring (using `String#end_with?`)
    - If yes, add 1 to the count
- Oh! Suddenly realize that it doesn't work when two substrings are concatenated with no other characters in between

# Data Structures
- Input: String
- Intermediate: String
- Output: Integer

# Algorithm
- Initialize `str_len` to the length of the given String
- Initialize `substr_len` to the length of the given substring
- Initialize `start_pos` to `0`
- Inititalize `count` to `0`
- While `start_pos` + `substr_len` <= `str_len` 
  - Get the current substring (call it `curr_substr`) from `start_pos` up to, but not including `start_pos` + `substr_len`
  - If `curr_substr` equals the given substring,
    - Increment `count` by 1
    - Increment `start_pos` by `substr_len`
  - Else,
    - Increment `start_pos` by 1
- Return `count`

=end

# Code
def solution(str, substr)
  str_len = str.length
  substr_len = substr.length
  start_pos = 0
  count = 0
  while start_pos + substr_len <= str_len
    curr_substr = str.slice(start_pos, substr_len)
    if curr_substr == substr
      count += 1
      start_pos += substr_len
    else
      start_pos += 1
    end
  end
  count
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('aa_bb_cc_dd_bb_e', 'bb') == 2
p solution('aaabbbcccc', 'bbb') == 1
