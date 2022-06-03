# Given a string of integers, return the number of odd-numbered substrings that can be formed.
# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

=begin

# Problem
- Given a string of integers, return the number of odd-numbered substrings that can be formed
- Input: String
- Output: Integer

'1341' -> ['1', '13', '134', '1341', '3', '34', ... , '41', '1']
-> ['1','13','1341',..]
-> 7

# Algorithm
- Given a string of integers,
  - Get all the possible substrings
  - From all the possible substrings, select the substrings that are odd-numbered
  - Count the number of strings
  - Return the count

- Subtask: Find out all the possible substrings
output = []
'1341'
'1','13','134','1341'
'3', '34', '341'
'4', '41'
'1'
- Iterate from the first digit to the last digit (`start_index`)
  - Iterate from the current start index to the index position of the last digit (`end_index`
    - Get the current substring (from `start_index` to `end_index`)
    - Push that substring to `output`
- Return `output`

=end

def get_all_substrs(str)
  output = []
  (0...str.length).each do |start_index|
    (start_index...str.length).each do |end_index|
      output << str[start_index..end_index]
    end
  end
  output
end

def solve(str)
  substrs = get_all_substrs(str)
  numbers = substrs.map { |substr| substr.to_i }
  numbers = numbers.select { |num| num.odd? }
  numbers.size
end


p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

# 14:28, with Adam
