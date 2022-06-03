# Given two words, how many letters do you have to remove from them to make them anagrams?
# Example
# First word : c od e w ar s (4 letters removed)
# Second word : ha c k er r a nk (6 letters removed)
# Result : 10

# A word is an anagram of another word if they have the same letters (usually in a different order).
# Do not worry about case. All inputs will be lowercase.

=begin

# Problem
- Given two strings `str1` and `str2`,
  - Return the number of letters that need to be removed so as to make both strings anagrams to each other
- Note that all strings given are in lowercase
- Input: Two strings
- Output: Integer


'aab', 'a'
['a', 'b']
[]


# Algorithm
- For each string, create an array of individual character
- Iterate through the shorter Array
  - If the current letter does appear in the other array
    - Remove that character from both array
- Return the total number of elements in both array

=end


# ['ab', 'ba']
# chars1 = ['a', 'b']
# chars2 = ['b', 'a']

# Code
def anagram_difference(str1, str2)
  chars1 = str1.chars
  chars2 = str2.chars
  arr_short = [chars1, chars2].min_by { |char| char.size }.dup
  arr_short.each do |char|
    if chars1.include?(char) && chars2.include?(char)
      chars1.delete_at(chars1.index(char))
      chars2.delete_at(chars2.index(char))
    end
  end
  chars1.size + chars2.size
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

# 25:46, with Adam
