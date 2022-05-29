=begin

Problem
Rules/Requirements
- Given a string, return a new string that:
- change case of every character,
- i.e., lower case to upper case, upper case to lower case
- and reverse the order of words from the input

Examples
p string_transformer("Example Input") == "iNPUT eXAMPLE"

Data Structures
- Input: String
- Intermediate: Array
- Output: String

Algorithm
- Given a string, split it into an array of characters
- Iterate through each character in the array,
  - if the character is a lower case, change it to upper case
  - else if the character is an upper case, change it to lower case
  - else do not change it
- Merge the array of characters back to a string
- Split the string into words at the word boundaries
- Reverse the word order
- Merge the array of words back to a string
- Return that string

=end

# Code
def string_transformer(str)
  str.chars.map do |char|
    if char.downcase == char
      char.upcase
    elsif char.upcase == char
      char.downcase
    else
      char
    end
  end.join.split(/\b/).reverse.join
end

def string_transformer(str)
  str.chars.map(&:swapcase).join.split(/\b/).reverse.join
end

def string_transformer(str)
  str.swapcase.split(' ').reverse.join(' ')
end

p string_transformer("Example Input") == 'iNPUT eXAMPLE'
