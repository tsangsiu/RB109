=begin

# Problem
- Given a string, determine if it's a panagram
- A panagram is a sentence that uses each alphabet at least once (case-insensitive)
- Ignore numbers and punctuation

# Examples
p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false

# Algorithm
- Given a string, delete all non-alphabets
- split the string into an array of alphabets
- turn all alphabets to lowercases
- remove all the duplicate alphabets
- sort the result array
- if the result array is the same as ('a'..'z').to_a, return true
- else return false

=end

# Code
def panagram?(str)
  str = str.gsub(/[^a-z]/i, "").downcase
  alphabets = str.split('').uniq.sort
  alphabets == ('a'..'z').to_a
end

p panagram?("The quick brown fox jumps over the lazy dog.") #== true
p panagram?("This is not a pangram.") #== false
