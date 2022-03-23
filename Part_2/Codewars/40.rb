=begin

Problem
Rules/Requirements
- Given a string, convert it to a new string
- Each character is considered
- If that character appears only once in the given string, convert it to '('
- Else convert it to ')'
- ignore case
Input: String
Output: String

Examples
p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("

Data Structure
- Input: String
- Intermediate:
- Output: String

Algorithm
- Given a string, make a duplicate of that string and call it `output`
- Iterate each character (in downcase to ignore case) in the given string
  - If that character occurs only once, convert the corresponding character in `output` to '('
  - Else convert the corresponding character in `output` to ')'
- Return `output`

=end

# Code
def duplicate_encode(str)
  output = str.clone
  str_case_ignored = str.downcase
  str_case_ignored.each_char.with_index do |char, index|
    str_case_ignored.count(char) == 1 ? output[index] = '(' : output[index] = ')'
  end
  output
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
