=begin

Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and 
returns the same string with all even indexed characters in each word upper
cased, and all odd indexed characters in each word lower cased. The indexing 
just explained is zero based, so the zero-ith index is even, therefore that 
character should be upper cased.

The passed in string will only consist of alphabetical characters and 
spaces(' '). Spaces will only be present if there are multiple words. Words will
be separated by a single space(' ').

# Problem
- Given a string, turn the character at even index position to upper case
- And turn the character at odd index position to lower case
- Return the same string

# Algorithm
- Iterate through the given string,
  - If the index of the current character is even, turn it to upper case,
  - Else turn it to lower case
- Return the same string

=end

def weirdcase(str)
  index = 0
  loop do
    index.even? ? str[index] = str[index].upcase : str[index] = str[index].downcase
    index += 1
    break if index >= str.length
  end
  str
end

str = 'String'
weirdcase(str) 
p str == "StRiNg"

str = 'Weird string case'
weirdcase(str)
p str == "WeIrD StRiNg cAsE"
