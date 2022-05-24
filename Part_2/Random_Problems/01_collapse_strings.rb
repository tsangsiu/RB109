=begin
  
# Problem
- Given a String,
  - Retrun a new String that contains the original String with all consecutive duplicate characters collapsed into a single character

# Examples
p collapse('bbbbbbbbb') == 'b'
p collapse('wwooonndeerrfull woorrlldd') == 'wonderful world'
p collapse('222xyzxyzyx') == '2xyzxyzyx'
p collapse('Q') == 'Q'
p collapse('AAbbCC') == 'AbC'
p collapse('') == ''

# Data Structure
- Input: String
- Intermediate: String
- Output: String

# Algorithm
- Initialize an empty String called `output` for output
- Iterate through the given String character by character,
  - For the current character, if it is the not same as the last character in `output`,
    - Push the current character to `output`
- Return `output`

=end

# Code
def collapse(str)
  output = ''
  str.each_char do |char|
    output << char if char != output[-1]
  end
  output
end

p collapse('bbbbbbbbb') == 'b'
p collapse('wwooonndeerrfull woorrlldd') == 'wonderful world'
p collapse('222xyzxyzyx') == '2xyzxyzyx'
p collapse('Q') == 'Q'
p collapse('AAbbCC') == 'AbC'
p collapse('') == ''

# Follow-Up Questions

# 1. What about a String that's a mix of upper & lower case letter?
# Let's say if we treat upper and lower case letters are the same
def collapse(str)
  output = ''
  str.each_char do |char|
    output << char if output[-1].nil? || char.downcase != output[-1].downcase
  end
  output
end
p collapse('AaABBb') == 'AB'
p collapse('aAabbBBBCC') == 'abC'

# 2. What about an invalid input, like Integer values?
# We can check if the object passed into the `collapse` method is a String first.
def collapse(str)
  if str.class == String
    output = ''
    str.each_char do |char|
      output << char if output[-1].nil? || char.downcase != output[-1].downcase
    end
    output
  end
end
p collapse(123) == nil
p collapse([1, 2, 3]) == nil

# 3. What if we want a destructive `collapse!` method?
=begin

# Brainstorm
'AAABBCCC'
- Initialize `index` to 1
- Iterate through the String, starting from the second character
- If the current character is the same as the last character,
  - Delete the current character from the given String
- Else,
  - Increment `index` by 1

# Algorithm
- Initialize `index` to 1
- While `index` < length of the given String
  - If the current character is the same as the last character,
    - Delete the current character from the given String
  - Else,
    - Increment `index` by 1
- Return the original String

=end

def collapse!(str)
  index = 1
  while index < str.length
    if str[index] == str[index - 1]
      str[index] = ''
    else
      index += 1
    end
  end
  str
end

str = 'bbbbbbbbb'
collapse!(str) 
p str == 'b'

str = 'wwooonndeerrfull woorrlldd'
collapse!(str)
p str == 'wonderful world'

str = '222xyzxyzyx'
collapse!(str)
p str == '2xyzxyzyx'

str = 'Q'
collapse!(str)
p str == 'Q'

str = 'AAbbCC'
collapse!(str)
p str == 'AbC'

str = ''
collapse!(str)
p str == ''
