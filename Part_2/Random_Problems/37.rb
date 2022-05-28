=begin

Two strings word1 and word2 are considered almost equivalent if the differences 
between the frequencies of each letter from 'a' to 'z' between word1 and word2 
is at most 3.

Given two strings word1 and word2, each of length n, return true if word1 and 
word2 are almost equivalent, or false otherwise.

The frequency of a letter x is the number of times it occurs in the string.

# Problem
- Given two words, determine if the two words are almost equivalent
- Two words are almost equivalent if for every character,
  - The difference of the occurrence in both words is less than or equal to 3

# Algorithm
- Combine the two words as one
- Create an array of unique character of the combined word
- Iterate through the above array,
  - If the difference of occurrence of the current letter is bigger than 3, return false
- Return true

=end

# Code
def check_almost_equivalent(word1, word2)
  word_combined = "#{word1}#{word2}"
  chars_uniq = word_combined.chars.uniq
  chars_uniq.each do |char|
    return false if (word1.count(char) - word2.count(char)).abs > 3 
  end
  true
end

def check_almost_equivalent(word1, word2)
  word_combined = "#{word1}#{word2}"
  chars_uniq = word_combined.chars.uniq
  chars_uniq.all? { |char| (word1.count(char) - word2.count(char)).abs <= 3 }
end

p check_almost_equivalent('aaaa', 'bccb') #== false
p check_almost_equivalent('abcdeef', 'abaaacc') #== true
p check_almost_equivalent('cccddabba', 'babababab') #== true
