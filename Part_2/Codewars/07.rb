=begin

Problem:
- Input: an array of words
- Output: string
- Rules:
  - Concatenate the 1st letter from the 1st word, 2nd letter from the 2nd word, ...
  - An empty array should return an empty string
- Question:
  - What if the nth word doesn't have n letters
    - This would not happen   

Examples:
p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

Data Structures:
- Input: an array of words
- Intermediate: an empty string to build the output
- Output: string

Algorithm:
- initialise an empty string, say `output`, that is going to output
- iterate throgh the array of strings
  - note the index of the word in the array
  - extract the corresponding position of letter in the current word
  - append that letter to `output`
- return `output`

=end

# Code:

def nth_char(array)
  output = ""
  array.each_with_index do |word, index|
    output << word[index]
  end
  output
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'
