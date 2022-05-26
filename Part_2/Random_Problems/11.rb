=begin

Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

# Problem
- Given two strings, str1 and str2
- Determine if str1 is a subsequence of str2
- str1 is a subsequence of str2 if str1 can be got by deleting some (can be none) characters in str2, without changing the relative position of the characters
- Input: two strings
- Output: Boolean

# Algorithm
- Initialize `indices` to an empty array
- Initialize `start_index` to 0
- Iterate through `str1`,
  - If the current char exists in `str2` (starting from `start_index`),
    - Find the index position of the current character in `str2`
    - Push the index to `indices`
    - Set `start_index` to the index plus 1
  - Else,
    - return false
- Iterate through `indices`
  - If the current index is greater than or equal to the next one,
    - return false
- Return true

=end

def is_subsequence(subseq, str)
  indices = []
  start_index = 0

  subseq.chars.each_with_index do |char, index|
    if str[start_index..].include?(char)
      index_in_str = start_index + str[start_index..].index(char)
      indices << index_in_str
      start_index = index_in_str + 1
    else
      return false
    end
  end

  (0...(indices.size - 1)).each do |index|
    return false if indices[index] >= indices[index + 1]
  end

  true
end

=begin

# Another Algorithm
abc     ahbgdc
--------------
i       j
if the chars at positions i and j is the same,
  shift i, j one step to the right

abc     ahbgdc
--------------
 i       j
if not, shift j one step to the right

abc     ahbgdc
--------------
 i        j
...
abc     ahbgdc
--------------
  i          j

abc     ahbgdc
--------------
   i          j

when i is out of bound, return true
if j is out of bound but i is not, return false

=end

def is_subsequence(subseq, str)
  i, j = 0, 0
  until i >= subseq.length || j >= str.length
    if subseq[i] == str[j]
      i += 1
      j += 1
    else
      j += 1
    end
  end

  if i >= subseq.length
    return true
  elsif i < subseq.length && j >= str.length
    return false
  end
end

p is_subsequence("aabb", "aabb") == true
p is_subsequence("aaa", "abacba") == true
p is_subsequence("bbb", "abcde") == false
p is_subsequence("axcd", "abxcd") == true
p is_subsequence("axc","ahbgdc" ) == false
p is_subsequence("abc","ahbgdc" ) == true
p is_subsequence("fasnglhhaseghvshkesgtvciazdhgatvs", "fasndglhchanseghvuakdshgcnbxaukesgtvciasdncjzsdhgatvs") == true
