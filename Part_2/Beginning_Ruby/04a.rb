# take a string as an argument, return the string in reverse order

=begin

# Problem
- Given a string, return the *SAME* string in reverse order

# Example
str = 'abcde'
rev!(str)
p str == 'edcba'

str = ''
rev!(str)
p str == ''

str = '1234'
rev!(str)
p str == '4321'

# Brainstorm
- str = 'abcde', iterate through index position 0, but excluding 2 (str.length / 2)
- str = '1234', iterate through index position 0 to 1.. from 0, to 2, but excluding 2
- To generalise, iterate through from index position 0 to str.length / 2 (exclude the end index)

# Algorithm
- Given a string,
  - Iterate the string from index position 0 to the length of the string divided by 2 (exclude the end index),
    - At the current index position 'idx', swap the current character with that at index position -(idx + 1)
- Return the given string

=end

# Code
def rev!(str)
  (0...(str.length / 2)).each do |idx|
    str[idx], str[-(idx + 1)] = str[-(idx + 1)], str[idx]
  end
  str
end

str = 'abcde'
rev!(str)
p str == 'edcba'

str = ''
rev!(str)
p str == ''

str = '1234'
rev!(str)
p str == '4321'

=begin

What if we would like a non-mutating method?

# Algorithm
- Initailize an empty string called `str_rev` for output
- Given a string,
  - Iterate through the string from the back,
    - for each character, append it to `str_rev`
- Return `str_rev`

=end

# Code
def rev(str)
  str_rev = ''
  (str.length - 1).downto(0) do |idx|
    str_rev << str[idx]
  end
  str_rev
end

p rev('abcde') == 'edcba'
p rev('') == ''
p rev('1234') == '4321'
