=begin

Problem
- Rules/Requirements
  - Given a string, replace every letter with its position in the alphabet
  - If anything in the text isn't a letter, ignore it and don't return it
- Input: String
- Output: String

Examples
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

Data Structure
- Input: String
- Intermediate: Array
- Output: String

Algorithm
- Create an array of alphabets
  - Then the position index of an alphabets in the array + 1 will be the position of that alphabet
- Initialise an empty array, say `positions` to store the position of the alphabets
- Turn the whole string into lowercase
- Split the string into an array of letters
- Iterate through each letter in the array
  - If it is an alphabet, push its position to `positions`
- Combine all elements in `positions` to a string and return it

=end

# Code

ALPHABETS = ('a'..'z').to_a
def alphabet_position(string)
  positions = []
  string.downcase.chars.each do |char|
    positions << ALPHABETS.index(char) + 1 if ALPHABETS.include?(char)
  end
  positions.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
