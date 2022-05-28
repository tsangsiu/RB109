=begin
  
Given two strings a and b, return the length of the longest uncommon subsequence 
between a and b. If the longest uncommon subsequence does not exist, return -1.

An uncommon subsequence between two strings is a string that is a subsequence 
of one but not the other.

A subsequence of a string s is a string that can be obtained after deleting any 
number of characters from s.

For example, "abc" is a subsequence of "aebdc" because you can delete the 
underlined characters in "aebdc" to get "abc". Other subsequences of "aebdc" 
include "aebdc", "aeb", and "" (empty string).

# Problem
- Given two strings, return the length of the longest uncommon subsequence between the two strings
- If that does not exist, return -1

# Brainstorm
- The two strings do not have uncommon subsequence if they are the same
- The longest uncommon subsequence is actually the longer string

# Algorithm
- If both strings are equal, return -1
- Return the length of the longer string

=end

def find_lu_slength(str1, str2)
  str1 == str2 ? -1 : [str1.length, str2.length].max
end

p find_lu_slength('aba', 'cdc') == 3
p find_lu_slength('aaa', 'bbb') == 3
p find_lu_slength('aaa', 'aaa') == -1
