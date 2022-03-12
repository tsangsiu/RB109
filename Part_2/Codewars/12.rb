=begin

Problem:
- Input: string
- Output: boolean
- Rules
  - given a string, detect if it is a pangram
  - return true if yes
- Questions
  - What is a pangram?
    - It is a sentence that contains every single letter of the alphabet at least once.
  - case sensitive?
    - no

Examples:
p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false

Data Structure:
- Input: string
- Intermediate: array
- Output: boolean

Algorithm:
- assign a constant `ALPHABETS` that points to an array of all downcase alphabets
- given a string
  - break it into an array of characters
  - remove all the non-alphabets
  - turn all alphabets to downcase
  - remove all duplicate alphabets
  - sort the array
  - check to see if the array is the same as `ALPHABETS`
  - if yes
    - return true
  - else
    - return false

=end

# Code:

ALPHABETS = ('a'..'z').to_a

def pangram?(string)
  chars = string.split('')
  chars.select! { |char| char.match?(/[a-z]/i) }
  chars.map! { |char| char.downcase }
  chars.uniq!
  chars.sort!
  chars == ALPHABETS
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false
