=begin

Problem:
- Input: string with lowercase only
- Output: integer, count
- Rules:
  - vowels are a, e, i, o, u
  - find the length of the longest consecutive vowel substring
- Questions:
  - nil

Examples:
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

Data Structures:
- Input: string
- Intermediate: string
- Output: integer

Algorithm:
- initialise an array `VOWELS` to store all the vowels
- initialise an array `counts` to store the length of each consecutive vowel substring
- initialise a variable `count` to store the length of the current consecutive vowel substring
- initialise a variable `last_char_vowel` to false to indicate if the last character is a vowel
- iterate through each character
  - if it is a vowel
    - set last_char_vowel to true
    - increment `count` by 1
    - push `count` to `counts` if the character is the last one
  - if it is not a vowel
    - set last_char_vowel to false
    - push `count` to `counts`
    - reset `count` to 0
- find the max number in `counts`
- return it

=end

# Code:

VOWELS = %w(a e i o u)

def solve(word)
  counts = []
  count = 0
  last_char_vowel = false
  word.each_char do |char|
    if VOWELS.include?(char)
      last_char_vowel = true
      count += 1
    else
      last_char_vowel = false
      counts << count
      count = 0
    end
  end
  counts << count
  counts.max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
