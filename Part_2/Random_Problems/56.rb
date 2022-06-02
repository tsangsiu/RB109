=begin

How can you tell an extrovert from an introvert at NSA?
Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can 
decipher it? According to Wikipedia, ROT13 (http://en.wikipedia.org/wiki/ROT13) 
is frequently used to obfuscate jokes on USENET.

Hint: For this task you're only supposed to substitue characters. Not spaces, 
punctuation, numbers etc. Test examples:

rot13("EBG13 rknzcyr.") == "ROT13 example.";
rot13("This is my first ROT13 excercise!" == "Guvf vf zl svefg EBG13 rkprepvfr!"

Rot 13 means each letter is replaced by the letter appearing 13 places in the 
alphabt. after the original letter. Last 13 letters alphabet you start over.

# Problem
- Given a string, decipher it by the following rules:
  - Advance each letter by 13 letters
  - Keep the case
  - Do not alter non-alphabets
- Input: String
- Output: String

# Algorithm
- Initialize a constant array `LETTERS` to an array of all lowercase letters in alphabetical order
- Given a string, turn it to an array of individual characters
- Iterate through the above array,
  - If the current character is a letter
    - Transform it (extract to another method)
- Join the characters back to a string
- Return the string

# Subtask 1: transform letters
- Given a letter,
  - Get its (lowercase) index position in the array `LETTERS`
  - Add 13 to that index
  - Take modulo size of `LETTERS`
  - With the new index, find the corresponding letter in `LETTERS`
  - If the given letter is in uppercase
    - Return the transformed letter in uppercase
  - Else,
    - Return the transformed letter
    
# Subtask 2: check if a letter is in uppercase
- If the given letter uppercased is the same as the given letter,
  - Return true
- Else,
  - Return false

=end

LETTERS = ('a'..'z').to_a

def rot13_letter(letter)
  index = (LETTERS.index(letter.downcase) + 13) % LETTERS.size
  transformed_letter = LETTERS[index]
  upcase?(letter) ? transformed_letter.upcase : transformed_letter
end

def upcase?(letter)
  letter.upcase == letter
end

# - Given a string, turn it to an array of individual characters
# - Iterate through the above array,
#   - If the current character is a letter
#     - Transform it (extract to another method)
# - Join the characters back to a string
# - Return the string

def rot13(str)
  chars = str.chars
  chars_transformed = chars.map do |char|
    if LETTERS.include?(char.downcase)
      rot13_letter(char)
    else
      char
    end
  end
  chars_transformed.join('')
end

p rot13("Abc") == "Nop"
p rot13("xYz") == "kLm"
p rot13("EBG13 rknzcyr.") == "ROT13 example."
p rot13("This is my first ROT13 excercise!") == "Guvf vf zl svefg EBG13 rkprepvfr!"
