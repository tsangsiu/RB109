=begin
  
You are given an array of strings words (0-indexed).

In one operation, pick two distinct indices i and j, where words[i] is a 
non-empty string, and move any character from words[i] to any position in 
words[j].

Return true if you can make every string in words equal using any number of 
operations, and false otherwise.

# Problem
- Given an array of words,
  - return true if:
    - after any number of operations of moving characters
    - all words in the array are the same
  - return false if otherwise
- Input: Array
- Output: Boolean

# Brainstorm
- All words in the array can be made equal after re-distribution if
  - providing the size of the array is `S`
  - the count of all distinct characters in all words in the array is a multiple of `S`

# Algorithm
- Given an array, find its size
- Combine all words in the array to form one single word
- Create an array of unique characters
- Iterate through the array
  - return false if the conunt of the current character in the combined word is not a multiple of the array's size
- Return true

=end

def make_equal(words)
  size = words.size
  word = words.join('')
  word_uniq = word.chars.uniq
  word_uniq.each do |char|
    return false if word.count(char) % size != 0
  end
  true
end

p make_equal(["abc","aabc","bc"])
p make_equal(["ab","a"])
