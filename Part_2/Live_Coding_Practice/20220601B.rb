# A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

=begin

# Problem
- Given a string, return true if it is a panagram, else if not 
- A pangram is a string that uses all alphabets at least one (a-z)
- Case is irrelevant here
- Ignore the punctuation and the numbers
- Input: String
- Output: Boolean 

# Algorithm
"The quick brown fox jumps over the lazy dog."
-> "the quick brown fox jumps over the lazy dog."
-> "thequickbrownfoxjumpsoverthelazydog"
-> ['t', 'h', 'e', ...., 'd', 'o', 'g']
['a', 'b', 'c', ..., 'x', 'y', 'z']

- Given a string, turn all letters to lowercase
- Delete all non-alphabets in the String
- Turn the string into an array of individual character
- Sort the above array
- Keep unique letters in the Array
- If the result array is ['a', 'b', 'c', .., 'x', 'y', 'z'], return true
- Return false

=end

# Code
def pangram?(str)
  str = str.downcase.delete("^a-z")
  chars = str.chars
  chars.sort.uniq == ('a'..'z').to_a
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
# "This is not a pangram."
p pangram?("This is not a pangram.") == false

# 10:19, with Peter
