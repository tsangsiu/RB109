=begin

Problem
- Rules: 
  - Find the longest substring in alphabetical order
  - Stings are up to 10,000 characters long (need to be efficient) (ignored for now)
  - Input strings only consist of lowercase characters and at least one letter long
  - If there are multiple solutions, return the one that appears first
- Input: String
- Output: String

Examples
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

Data Structures
- Input: String
- Intermediate: Array
- Output: String

Algorithm
- Given a string
  - initialise an array called `outputs`
  - initialise a string called `output` for the current substring
  - split the string into an array of letters
  - iterate through each letter
    - if the current letter (except for the first one) is behind ('greater') or the same as the last letter of `output`
      - append that letter to `output`
    - else if `output` is not empty
      - append `output` to `outputs`
      - set `output` to an empty string
      - append that letter to `output`
    - else
      - append that letter to `output`
    - append `output` to `outputs` if the current letter is the last one
  - select the longest string in `outputs`
  - if there is more than one, select the first one

=end

# Code
def longest(str)
  outputs = []
  output = ''

  chars = str.chars
  chars.each_with_index do |char, index|
    if output != '' && char >= output[-1]
      output << char
    elsif output != ''
      outputs << output
      output = char
    else
      output = char
    end
    outputs << output if index == str.length - 1
  end

  output = outputs.max_by { |substr| substr.length }
  outputs
end

p longest('asasd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
