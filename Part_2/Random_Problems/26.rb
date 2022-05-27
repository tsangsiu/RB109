=begin

Given a string s consisting of only the characters 'a' and 'b', return true 
if every 'a' appears before every 'b' in the string. Otherwise, return false.

# Problem
- Given a string containing only 'a's and 'b's
- Return true if all 'a's appears before all 'b's

# Brainstorm
- All 'a's appears before all 'b's if
  - When sparated the strings into groups of 'a's and 'b's,
    - there are two sub-array in the array and the first array are all 'a's
    - there is only one sub-array in the array (assuming the given string contains no other characters)

# Algorithm
- slice the string into an array of groups of 'a's and 'b's
- Return true if:
  - there are two sub-array in the array and the first array are all 'a's
  - there is only one sub-array in the array

=end

def check_string(string)
  groups = string.chars.slice_when { |str1, str2| str1 != str2 }.to_a
  (groups.size == 2 && groups.first.all? { |char| char == 'a' }) || groups.size == 1
end

p check_string("aba") == false
p check_string("aaa") == true  
p check_string("aabb") == true
p check_string("abab") == false
p check_string("aaabbb") == true
p check_string("bbb") == true
