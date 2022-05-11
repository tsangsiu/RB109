=begin

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

# Problem
- Given a String, return a new String with all consecutive duplicate characters collapsed into one single character

# Examples
p collapse('bbbbbbbbb') == 'b'
p collapse('wwooonndeerrfull woorrlldd') == 'wonderful world'
p collapse('222xyzxyzyx') == '2xyzxyzyx'
p collapse('Q') == 'Q'
p collapse('AAbbCC') == 'AbC'
p collapse('') == ''

# Data Structure
- Input: String
- Intermediate: String
- Output: String

# Brainstorm
- Initialize `output` to an empty String
- Iterate through the given String,
  - If the current character is not the same as the last character of `output`,
    - Append the current character to `output`
- Return `output`

=end

# Code

def collapse(str)
  output = ''
  str.each_char do |char|
    output << char if char != output[-1]
  end
  output
end

p collapse('bbbbbbbbb') == 'b'
p collapse('wwooonndeerrfull woorrlldd') == 'wonderful world'
p collapse('222xyzxyzyx') == '2xyzxyzyx'
p collapse('Q') == 'Q'
p collapse('AAbbCC') == 'AbC'
p collapse('') == ''
