=begin

Problem
- Rules/Requirements
  - Given a string, turn it into a Mexican Wave
  - The input string will always be lowercase but maybe empty
  - If the character in the strings is whitespace, pass over it
- Input: String
- Output: Array
- Question
  - What is a Mexican Wave?
    - An array of strings that each letter in a string takes turn to be in upper case

Example
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

Data Structure
- Input: String
- Intermediate: Array
- Output: Array

Algorithm
- Initialise a variable called `index` to 0 to keep track of the position of letter in a string
- Initialise an array called `output` for output
- While `index` is less than the length of the given string
  - if the letter at position `index` is not a whitespace
    - turn that letter to uppercase
    - push the transformed string to `output`
  - increment `index` by 1
- return `output`

=end

# Code
def wave(string)
  index = 0
  output = []
  while index < string.length
    string = string.downcase
    string[index] = string[index].upcase
    output << string if string[index] != ' '
    index += 1
  end
  output
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
