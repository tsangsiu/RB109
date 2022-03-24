=begin

Problem
Rules/Requirements
- Assume '#' is like a backspace in string
- Then 'a#bc#d' is actually 'bd'
Input: String
Output: String

Examples
p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
p clean_string('#######') == ""
p clean_string('') == ""

Data Structures
Input: String
Intermediate: String
Output: String

Algorithm
- Initialise a string called `output` for output
- Given a string, iterate through each character,
  - If that character is not a '#'
    - push that character to `output`
  - Else if that character is a '#'
    - remove the last character from `output`
- Return `output`

=end

# Code
def clean_string(str)
  output = ''
  str.each_char do |char|
    char == '#' ? output = output[0...-1] : output << char
  end
  output
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
p clean_string('#######') == ""
p clean_string('') == ""
