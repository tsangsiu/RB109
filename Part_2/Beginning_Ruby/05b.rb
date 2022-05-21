# Write a method that takes a string, and returns a boolean indicating whether this string has a balanced set of parentheses.

# ```
# balancer("hi") # => true
# balancer("(hi") # => false
# balancer("(hi)") # => true
# ```

# Bonus:

# ```
# balancer(")hi(") # => false

=begin

# Problem
- Given a string
- check to see if the string has a balanced parentheses
- If yes, return true, else true false
- Input: string
- Output: boolean

# Examples
p balancer("hi") == true
p balancer("(hi") == false
p balancer("(hi)") == true

# Brainstorm
- Create a stack to keep track of the parentheses
- Iterate through the given string
- If the current character is an open parenthesis, push that to the stack
- If the current character is a closed parenthesis,
  - If the stack is empty, return false
  - Else, we pop the stack
- After iteration, if the stack is empty, return true
- Else, return false

# Algorithm
- Given a string
- Initialize `stack` to an empty array
- Iterate through the given string,
  - If the current character is an open parenthesis,
    - Push that to `stack`
  - If the current character is a closed parenthesis,
    - If `stack` is empty,
      - return false
    - Else,
      - pop the `stack`
- If `stack` is empty,
  - return true
- Else,
  - return false

=end

# Code
def balancer(str)
  stack = []
  str.each_char do |char|
    if char == '('
      stack << char
    elsif char == ')'
      return false if stack.empty?
      stack.pop
    end
  end
  stack.empty?
end

p balancer("hi") == true
p balancer("(hi") == false
p balancer("(hi)") == true
p balancer(")hi(") == false
