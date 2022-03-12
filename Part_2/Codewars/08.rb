=begin

Problem:
- Input: string
- Output: array: [minimum substring, repeated times]
- Rules:
  - given a non-empty substring s
  - find a minimum substring t
  - and the maximum number of repetition k
  - return an array [t, k]
- Question:
  - case sensitive?
    - all letters are in lower cae

Examples:
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

Data Structure:
- Input: string
- Intermediate: string to keep track of pattern, array for output
- Output: array

Algorithm:
- initialise the output array
- initialise an empty string `pattern` to keep track of the pattern
- given the string
- iterate through the letters one by one
    - append the current letter to `pattern`
    - get the length of `pattern`
    - starting from the next letter, get the substring of length of `pattern`
    - if it is equal to `pattern`
      - set the first element of the output array to `pattern`
      - find the repetition number and set it to the second element of the output array
      - stop the iteration
    - else if the current letter is the last in the string
      - the first element of the output array would be the input string
      - the repetition number is 1
      - stop the iteration
- return the output array
  
=end

# Code:

def f(string)
  output = []
  pattern = ""
  counter = 0
  loop do
    pattern << string[counter]
    length_pattern = pattern.length
    pattern_test = string.slice(counter + 1, length_pattern)
    if (pattern_test == pattern) || (counter == string.length - 1)
      output[0] = pattern
      output[1] = string.length / pattern.length
      break
    end
    counter += 1
  end
  output
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
