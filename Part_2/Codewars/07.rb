=begin

# Problem
- Given an Array of Strings,
  - Get the i-th character from the i-th word to form a new word

# Examples
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

# Brainstorm
- Iterate through each word in the Array with index
- Get the i-th word from the i-th word

# Algorithm
- Initialize `output` to an empty String
- Given an Array of words,
  - Iterate through each word with index,
    - For the current word, say the i-th word in the Array, append the i-th character to `output`
- Return `output`

=end

# Code
def nth_char(arr)
  output = ''
  arr.each_with_index do |word, index|
    output << word[index]
  end
  output
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'
