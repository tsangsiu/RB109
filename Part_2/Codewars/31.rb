=begin

Problem
- Rules
  - Given two words, check if they are anagrams of each other
  - return true if they are, and false if they are not
- Question
  - What are anagrams?
    - An anagram is the result of rearranging the letters of a word to produce a new word
  - Case-sensitive?
    - Anagrams are case-insensitive
- Input: Two strings
- Output: Boolean

Examples
p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false

Data Structures
- Input: Two strings
- Intermediate: String
- Output: Boolean

Algorithm
- Given two strings
  - convert both strings to lower cases
  - rearrange both strings into alphabetical order
  - check if both transformed strings are the same
  - if yes, return true, else return false

=end

# Code
def is_anagram(str1, str2)
  str1.downcase.chars.sort == str2.downcase.chars.sort
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
