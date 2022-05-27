=begin

You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.

We repeatedly make duplicate removals on s until we no longer can.

Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.

# Problem
- Given a string containing only lowercase letters
- Keep removing two adjacent and equal letters
- Return the string if no further removal can be performed

# Algorithm
'abbaca'
stack = ['c', 'a']

- Initialize an empty array called `stack`
- Iterate through the given string,
  - if the current letter is the same as the last element in `stack`,
    - Remove the last element in `stack`
  - Else,
    - Push the current element to `stack`
- Join the letters in `stack` to get a string
- Return the string

=end

def remove_duplicates(str)
  stack = []
  str.each_char do |char|
    char == stack.last ? stack.pop : stack << char 
  end
  stack.join('')
end

p remove_duplicates('abbaca') == 'ca'
p remove_duplicates('azxxzy') == 'ay'
