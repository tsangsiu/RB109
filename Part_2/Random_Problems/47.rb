=begin

You need to play around with the provided string(s).

Move consonants forward 9 places through the alphabet. If they pass 'z', start 
again at 'a'. Move vowels back 5 places through the alphabet. If they pass 'a', 
start again at 'z'. Provided string will always be lower case, won't be empty 
and will have no special characters.

["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"] 

# Problem
- Given a string containing only lowercase letters
- Change each letters based on the following rules:
  - If the letter is not a vowel, move forward 9 letters
    - If passes 'z', start from 'a' again
  - Else if the letter is a vowel, move backward 5 letters

# Algorithm
- Given a string, split it into an array of individual letters
- Iterate through the array,
  - If the current letter is a vowel ('a', 'e', 'i', 'o', 'u'),
    - move the letter backward 5 letters
  - Else
    - move the letter forward 9 letters

Subtask 1: Move a letter backward 5 letters
- Initialize a constant called `LETTERS` to an array of all lowercase alphabets in order
- Given a lowercase letter
- Get the index position of that letter in `LETTERS`
- Minus 5 from that index position
- With that new index position, find the corresponding letter in `LETTERS` and return it

Subtask 2: Move a letter forward 9 letters
- Initialize a constant called `LETTERS` to an array of all lowercase alphabets in order
- Given a lowercase letter
- Get the index position of that letter in `LETTERS`
- Add 9 to that index position
- Get the remainder when that number is divided by the size of `LETTERS`
- With that new index position, find the corresponding letter in `LETTERS` and return it

=end

VOWELS = %w(a e i o u)

def vowel_back(str)
  letters = str.split('')
  letters.map do |letter|
    VOWELS.include?(letter) ? move_back_5(letter) : move_for_9(letter)
  end.join('')
end

LETTERS = ('a'..'z').to_a

def move_back_5(letter)
  code = LETTERS.index(letter)
  code_new = code - 5
  LETTERS[code_new]
end

# def move_back_5(letter)
#   code = letter.ord
#   code_new = code - 5
#   code_new += 26 if code_new < 'a'.ord
#   code_new.chr
# end

def move_for_9(letter)
  code = LETTERS.index(letter)
  code_new = code + 9
  code_new %= LETTERS.size
  LETTERS[code_new]
end

# def move_for_9(letter)
#   code = letter.ord
#   code_new = code + 9
#   code_new -= 26 if code_new > 'z'.ord
#   code_new.chr
# end

p vowel_back("testcase") == "czbclvbz"
p vowel_back("codewars") == "ljmzfvab" 
p vowel_back("exampletesthere") == "zgvvyuzczbcqzaz"
p vowel_back("returnofthespacecamel") == "azcpawjocqzbyvlzlvvzu"
p vowel_back("bringonthebootcamp") == "kadwpjwcqzkjjclvvy"
p vowel_back("weneedanofficedog") == "fzwzzmvwjoodlzmjp"
