=begin
  
Problem
- Rules/Requirements
  - Given a string of words, find the highest scoring word
  - Each letter of a word scores points according to its position in the alphabet:
    - a=1, b=2, c=3
  - return the highest scoring word as a string
  - If two words score the same, return the word that appears first
  - all letters will be in lower case
- Input: String (a string of words)
- Output: String (the highest scoring word)
- Questions
  - What if in a string, there is a character that is not a letter?
    - Ignore it

Examples
p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
​​p high('what time are we climbing up the valcono volcano') == 'valcono'

Data Structure
- Input: String
- Intermediate: Array
- Output: String

Algorithm
- Create an array constant of letters
  - each letter's position in the array + 1 would be its position in the alphabet
- Initalise an array to store the scores of the words
- Given a string of words, split it into words
- Iterate through each word
  - for each word, split it into letters
  - iterate through each letter
    - if it's not a letter, ignore it
    - find its position in the alphabet
    - accumulate the sum to find the score
    - push the score to the array
- return the first highest score in the array

=end

# Code

ALPHABETS = ('a'..'z').to_a

# this code follows the above algorithm
def high(string)
  scores = []

  words = string.downcase.split # downcase just in case
  words.each do |word|
    letters = word.split('')
    score = 0
    letters.each do |letter|
    score += ALPHABETS.index(letter) + 1 if ALPHABETS.include?(letter)
    end
    scores << score
  end
  
  words.select.with_index do |word, index|
    index == scores.index(scores.max)
  end.first
end

# refactored
def high(string)
  string.split.max_by do |word|
    score = 0
    word.split('').each do |letter|
      score += ALPHABETS.index(letter) + 1 if ALPHABETS.include?(letter)
    end
    score
  end
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b c') == 'aaa'
p high('what time are we climbing up the valcono volcano') == 'valcono'
