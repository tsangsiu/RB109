=begin

Problem
- Rules
  - Given a string,
    - split it into pairs of two characters
    - if the string contains an odd number of characters,
      - replace the missing second character of the final pair with an underscore
- Input: String
- Output: Array of strings

Examples
p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []

Data Structures
- Input: String
- Intermediate: Array
- Output: Array

Algorithm
- Given a string,
  - initialise an empty array called `output`
  - initialise an empty string called `current_pair`
  - split it into an array of characters and iterate through it
    - append the current character into `current_pair`
    - if `current_pair` has two characters
      - append it to `output`
      - set `current_pair` to empty string
    - if the current character is the last character
      - append `_` to `current_pair`
      - append `current_pair` to `output`
- return `output`

=end

# Code
def solution(string)
  output = []
  current_pair = ""
  string.chars.each_with_index do |char, index|
    current_pair << char
    if current_pair.length == 2
      output << current_pair
      current_pair = ""
    elsif index == string.length - 1
      current_pair << "_"
      output << current_pair
    end
  end
  output
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
