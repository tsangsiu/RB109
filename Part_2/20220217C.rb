=begin

Problem:
- Input: array of words
- Output: array of numbers
- Rules:
  - In the alphabet, a and b are in positions 1 and 2
  - Conside the word 'adode', a and b are also in positions 1 and 2
  - given an array of words, return an array of the number of letters that
    occupy their positions in the alphabet for each word
- Questions:
  - case-sensitive?
    - from the examples, 'a' and 'A' are treated as 'A'
  - will there be spaces in the given words?
    - No

- Examples:
p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL", "thedefgh", "xyzDEFghijabc"]) == [6, 5, 7]
p solve(["encode", "abc", "xyzD", "ABmD"]) == [1, 3, 1, 3]

- Data structures:
  - input: an array of words
  - intermediate: the same array
  - output: an array of integer of counts

- Algorithm:
  - conside only one word:
    - create a constant `LETTERS`, which is an array of alphabets
    - initialise a variable `count` to count
    - given a single word
    - split the word into characters
    - iterate through the characters
      - if the position of that characters is the same as the position of the corresponding alphabet
        - increment one to count
    - return count

  - for the given array:
    - initialise an array `counts` to store the counts
    - iterate through each word
      - apply the above method to get the count
      - append it to `counts`
    - return `counts`

=end

# Code:

LETTERS = ('a'..'z').to_a

def count_alphabet_symmetry(word)
  count = 0
  characters = word.split('')
  characters.each_with_index do |character, index|
    count += 1 if character.downcase == LETTERS[index]
  end
  count
end

def solve(array_of_words)
  counts = []
  array_of_words.each do |word|
    counts << count_alphabet_symmetry(word)
  end
  counts
end

p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL", "thedefgh", "xyzDEFghijabc"])== [6, 5, 7]
p solve(["encode", "abc", "xyzD", "ABmD"]) == [1, 3, 1, 3]
