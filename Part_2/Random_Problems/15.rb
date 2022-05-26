=begin

Given a pattern and a string s, find if s follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

# Problem
- Given two strings `pattern` and `str`
- Determine if `str` follows the pattern described by `pattern`

# Algorithm
Create a Hash: {'a'=>'dog', 'b'=>'cat'}

- Initialize an empty Hash
- Given `pattern` and `str`,
  - split `pattern` into individual characters
  - split `str` into words at space
- Return false if `pattern` and `str` do not have the same length
- Iterate through the individial character in `pattern`
  - If the character does not exist as a key in hash,
    - Set the current character as a key in the hash
    - Set the corresponding word as a value in the hash
  - If the character does exist as a key in hash
    - Check if the value in that hash is the same as the word
    - Return false if not
- Return true

=end

def word_pattern(pattern, str)
  hash = {}

  patterns = pattern.chars
  words = str.split(' ')

  return false if patterns.size != words.size

  patterns.each_with_index do |pattern, index|
    if !hash.keys.include?(pattern)
      hash[pattern] = words[index]
    else
      return false if hash[pattern] != words[index]
    end
  end

  true
end

p word_pattern("aa", "aaa") == false
p word_pattern("abba", "dog cat cat dog") == true
p word_pattern("abba", "dog, cat cat fish") == false
p word_pattern("","") == true
p word_pattern("aaaa", "dog cat cat dog") == false
