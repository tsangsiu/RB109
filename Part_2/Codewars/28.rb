=begin

Problem
- Write a method that finds all anagrams of a word from a list
- Given two inputs: a words and an array of words
- Return an array of all anagrams or an empty array if there are none
Input: A string and an array of strings
Output: An array
Question
- What is an anagram?
  - Two words are anagrams of each other if they both contain the same letters
  - For examples:
    - 'abba' and 'baab' are
    - 'abba' and 'bbaa' are
    - 'abba' and 'abbba' are not
    - 'abba' and 'abca' are not

Example
p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []

Data Structure
- Input: String, Array
- Intermediate: Array
- Output: Array

Algorithm
- Given a string and an array of string
- Sort the string in alphabetical order
- Select elements in the array which are
  - when the string is sorted in alphabetical order,
  - it is equal to the given string when sorted in alphaetical order
- Return the result array

=end

def anagrams(string, array_of_strings)
  sorted_string = string.chars.sort.join
  array_of_strings.select do |string|
    string.chars.sort.join == sorted_string
  end
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []
