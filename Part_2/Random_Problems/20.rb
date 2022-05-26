=begin

You are given a string array words and a string s, where words[i] and s comprise only of lowercase English letters.

Return the number of strings in words that are a prefix of s.

A prefix of a string is a substring that occurs at the beginning of the string. A substring is a contiguous sequence of characters within a string.

Note that the same string can occur multiple times in words, and it should be counted each time.

# Problem
- Given an array of strings and a string
- return the number of strings in the array that is a prefix of the given string
- Input: array, string
- Output: integer

# Algorithm
- Given an array `prefixes` and a string `str`
- Select the strings in `prefixes` that are prefixes of `str`
- Return the array size of the above result array

=end

def count_prefixes(prefixes, str)
  prefixes.select { |prefix| str.start_with?(prefix) }.size
end

p count_prefixes(["f", "fl", "flow", "f", "a"], "flower") == 4
p count_prefixes(["a","b","c","ab","bc","abc"], "abc") == 3
p count_prefixes(["a","a"], "aa") == 2
p count_prefixes(["a","b","ab","abs","abs"],"absolutely") == 4
p count_prefixes(["c","d","e"],"abc") == 0
