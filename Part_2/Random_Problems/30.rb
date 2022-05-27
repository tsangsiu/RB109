=begin

A substring is a contiguous (non-empty) sequence of characters within a string.

A vowel substring is a substring that only consists of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it.

Given a string word, return the number of vowel substrings in word.

# Problem
- Given a string,
- Return the number of substrings that ONLY contain the 5 vowels

# Algorithm
- Get all possible substrings

  - Initialize `substrs` to an empty array
  - Iterate from index 0 to (length of string - 1) (`start_index`)
    - Iterate from the current index to (length of string - 1) (`end_index`)
      - Get the substring from `start_index` to `end_index`
      - Push that to `substrs`
  - Return `substrs`

012345678
abcdefghi
01234

- For the above array of substring,
  - select the substrings that contain all 5 vowels
- Return the length of the result array

=end

VOWELS = %w(a e i o u)

def get_substrs(str, substr_len)
  substrs = []
  (0...str.length).each do |start_index|
    (start_index...str.length).each do |end_index|
      substrs << str[start_index..end_index]
    end
  end
  substrs 
end

def count_vowel_substrings(str)
  substrs = get_substrs(str, 5)
  substrs.select do |substr|
    substr.chars.uniq.sort == VOWELS
  end.size
end

p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0
