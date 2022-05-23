=begin

# Problem
- Given a string,
- return the longest substring which is in alphabetical order
- A substring will be at least one letter long
- If there are more than one, return the first one that appears

# Examples
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

# Algorithm
- Get all possible substrings
  - Initialize `substrings` to an empty array
  - From index 0 to (length of the string - 1) `start_index`,
    - Set `end_index` to `start_index`
    - Iterate from `end_index` to (length of the string - 1),
      - Get the substring from `start_index` to `end_index`
      - Push the substring to `substrings`

- Select all substrings that are in alphabetical order
  - Iterate from index 1 to (length of the string - 1),
    - Get the current letter
    - return false if the current letter is smaller than the one to the left
  - return true

- Return the longest one

=end

# Code
def substrings(str)
  substrings = []
  (0...str.length).each do |start_index|
    end_index = start_index
    (end_index...str.length).each do |end_index|
      substrings << str[start_index..end_index]
    end
  end
  substrings
end

def alphabetical_order?(str)
  (1...str.length).each do |index|
    return false if str[index] < str[index - 1]
  end
  true
end

def longest(str)
  substrings = substrings(str)
  substrings_order = substrings.select { |substring| alphabetical_order?(substring) }
  substrings_order.max_by { |substring| substring.length } 
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

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
  output
end

p longest('asasd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
