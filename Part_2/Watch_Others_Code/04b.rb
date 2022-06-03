# Write function scramble(str1,str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwisw returns false
#
# For example:
# str1 us 'rkqodlw' and str2 is 'world' the output should return true
# str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true
# str1 is 'katas' and str2 is 'steak' should return false
#
# Only lower case letters will be used (a-z). No punctuation or digits will be included.

=begin

# Problem
- Given two strings, `str1` and `str2`
- If the characters in `str1` can be rearranged to get `str2`, return `true`
- Return `false` is otherwise
- Only consider lower case letters
- Each character in `str1` can be used at most once

- Input: two strings
- Output: Boolean

# Algorithm
- Turn both strings into an array of individual character
- Iterate through `str2`,
  - If the current character exists in `str1`,
    - delete that character in `str1`
  - Else
    - return false
- return true

=end

# Code
def scramble(str1, str2)
  chars1 = str1.chars
  chars2 = str2.chars
  chars2.each do |char|
    if chars1.include?(char)
      chars1.delete_at(chars1.index(char))
    else
      return false
    end
  end
  true
end

=begin

# A New Algorithm
- Iterate through each character in `str2`,
  - If the count of the current character in `str2` is greater than that in `str1`,
    - Return false
- Return true

=end

def scramble(str1, str2)
  # str2.each_char do |char|
  #   return false if str2.count(char) > str1.count(char)
  # end
  # true

  str2.chars.all? { |char| str2.count(char) <= str1.count(char) }
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
