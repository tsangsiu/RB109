=begin

You are given an array of words, where each words consists of lowercase English letters.

In one operation, select any two adjacent words (words[i - 1] and words[i]) that are anagrams of each other, and delete words[i] from words. Keep performing this operation as long as you can select an index that satisfies the conditions.

NOTE: a valid index is such that 0 < i < words.length

Return words after performing all operations. It can be shown that selecting the indices for each operation in any arbitrary order will lead to the same result.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase using all the original letters exactly once. For example, "dacb" is an anagram of "abdc".

# Problem
- Given an array of words,
- If two adjacent words are anagrams of each other, delete the latter one.
- Repeat the above process until there is no more deletion
- Return the result array
- each word only consists of lowercase letters
- Input: array
- Output: array

# Algorithm
- A method to check if two words are anagram to each other:
  - turn both words into an array of characters and sort it
  - return true if both arrays are the same

- The main method: remove_anagrams
  - Iterate through the given array from the second element
    - Compare the current word with the previous one
    - If both words are anagram to each other,
      - delete the current word
    - Start iterating the array from the second element
    - If we get to the last element and there is no deletion,
      - return the result array

=end

def is_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def remove_anagrams(arr)
  index = 1
  loop do
    if is_anagram?(arr[index],arr[index - 1])
      arr.delete_at(index)
      index = 1
    else
      index += 1
    end
    break if index >= arr.size
  end
  arr
end

p remove_anagrams(["bat","tab","all","tea","eat"]) == ["bat","all","tea"]
p remove_anagrams(['a','b','c','d','e']) == ['a','b','c','d','e']
p remove_anagrams(["dog", "god"]) == ["dog"]
p remove_anagrams(["abba","baba","bbaa","cd","cd"]) == ["abba","cd"]
p remove_anagrams(["day","tina", "anit","house","note", "tone"]) == ["day","tina","house","note"]
