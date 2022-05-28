=begin

A string s is nice if, for every letter of the alphabet that s contains, it 
appears both in uppercase and lowercase. For example, "abABB" is nice because 
'A' and 'a' appear, and 'B' and 'b' appear. However, "abA" is not because 'b' 
appears, but 'B' does not.

Given a string s, return the longest substring of s that is nice. If there are 
multiple, return the substring of the earliest occurrence. If there are none, 
return an empty string.

# Problem
- Given a string, find the longest substring that is nice
- A string is nice if:
  - For every lowercase letter, the string contain its uppercase letter
- If there are more than one nice substrings that are the longest, return the one that appears earlier
- If there is no nice substring, return an empty string

# Algorithm
- The main method
  - Given a string, get all possible substrings
  - From all the substrings, select those substrings that are nice
  - Return the longest one

- The method to get all possible substrings
  - Initialize an empty array called `substrs`
  - Iterate from index 0 upto, but not including, the length of the string
    - Iterate from the current index upto, but not including, the length of the string
      - Get the substring
      - Push the substring to `substrs`
  - Return `substrs`

- The method to determine if a string is nice
  - Initialize `str_lowercase` to the given string lowercased
  - Turn the above string into an array of unique individual characters
  - Iterate through the above array,
    - return false if the given string does not contain the uppercase and the lowercase of the current letter
  - Return true

=end

def get_substrs(str)
  substrs = []
  (0...str.length).each do |start_index|
    (start_index..str.length).each do |end_index|
      substrs << str[start_index..end_index]
    end
  end
  substrs
end

def is_nice?(str)
  str_lowercase = str.downcase
  chars_uniq = str_lowercase.chars.uniq
  chars_uniq.each do |char|
    return false if !(str.include?(char) && str.include?(char.upcase))
  end
  true
end

def longest_nice_substring(str)
  substrs = get_substrs(str)
  substrs_nice = substrs.select { |substr| is_nice?(substr) }
  return '' if substrs_nice.empty?
  substrs_nice.max_by { |substr| substr.length }
end

p longest_nice_substring('YazaAay') == 'aAa'
p longest_nice_substring('Bb') == 'Bb'
p longest_nice_substring('c') == ''
