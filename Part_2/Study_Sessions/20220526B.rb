=begin

# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

# Problem
- Given a string, return a new string that is sorted in alphabetical order
- ignore cases
- remove non-alphabets
- Input: string
- Output: string

# Algorithm
- Given a string,
  - remove all non-alphabets
  - create an array of characters of the string
  - sort the above array, ignoring alphabet's case
  - join the result array with an empty string
  - return the result string

=end

def alphabetized(str)
  str.delete("^a-zA-Z").chars.sort_by { |char| char.downcase }.join('')
end

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
