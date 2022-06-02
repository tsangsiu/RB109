=begin

Given a string word, return the sum of the number of vowels ('a', 'e', 'i', 'o', and 'u') 
in every substring of word.

A substring is a contiguous (non-empty) sequence of characters within a string.

Example 1:

Input: word = "aba"
Output: 6
Explanation:
All possible substrings are: "a", "ab", "aba", "b", "ba", and "a".
- "b" has 0 vowels in it
- "a", "ab", "ba", and "a" have 1 vowel each
- "aba" has 2 vowels in it
Hence, the total sum of vowels = 0 + 1 + 1 + 1 + 1 + 2 = 6.

Example 2:

Input: word = "abc"
Output: 3
Explanation:
All possible substrings are: "a", "ab", "abc", "b", "bc", and "c".
- "a", "ab", and "abc" have 1 vowel each
- "b", "bc", and "c" have 0 vowels each
Hence, the total sum of vowels = 1 + 1 + 1 + 0 + 0 + 0 = 3.

Example 3:

Input: word = "ltcd"
Output: 0
Explanation: There are no vowels in any substring of "ltcd".

# Problem
- Given a string, return the sum of the number of vowels in all possible substrings

For example,
'abc' -> ['a', 'ab', 'abc', 'b', 'bc', 'c']
-> [1, 1, 1]
-> total = 3

# Algorithm
- Given a string, find all possible substrings
- Join all the possible substrings to one string
- Count the number of vowels in that string
- Return the count

Subtask: To get all possible substrings
- Initialize `substrs` to an empty array
- Iterate from index position 0 to (the length of string - 1),
  - Iterate from the current index position to (the length of string - 1),
    - Get the substring
    - Push the substring to an array
- Return that array

=end

def get_all_substrs(str)
  substrs = []
  (0...str.length).each do |start_index|
    (start_index...str.length).each do |end_index|
      substrs << str[start_index..end_index]
    end
  end
  substrs
end

def count_vowels(str)
  substrs = get_all_substrs(str)
  substrs_combined = substrs.join('')
  substrs_combined.count('aeiou')
end

p count_vowels("aba") == 6
p count_vowels("abc") == 3
p count_vowels("ltcd") == 0
