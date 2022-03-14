=begin
  
Problem
- Rules
  - Given two words, return the number of letters that needs to be removed to make them anagrams
  - Do not worry about case. All inputs are in lowercase
- Question
  - What are anagrams?
    - A word is an anagram of another word if they have the same letters (usually in a different order)
- Input: Two strings
- Output: Integer

Examples
p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

Data Structures
- Input: Two strings
- Intemediate
- Output: Integer

Algorithm
- Given two strings
  - Iterate through each characters of the first string
    - If that character in the second string
    - remove that character in both strings
  - count the number of characters in both strings
  - return that number

=end

# Code
def anagram_difference(str1, str2)
  str1.chars.each do |char|
    if str2.include?(char)
      str1 = str1.sub(char, '')
      str2 = str2.sub(char, '')
    end
  end
  str1.length + str2.length
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
