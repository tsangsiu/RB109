=begin

Problem:
- Rules:
  - given a string of one or more than one word
  - return the same (doesn't mean destrcutive here) string, but with all words with 5 or more letters reversed
- Input: string
- Output: the string

Examples:
p spinWords("This is a test") == "This is a test" 
p spinWords("This is another test") == "This is rehtona test"
p spinWords("test") == "test"

Data Structure:
- Input: string
- Intermediate: array
- Output: string

Algorithm:
- given a string of one or more than one word
- split the string into words
- iterate through each words
- if the word is five or more than 5 letters long
  - transform the word reversed
- join the words to form a string
- return the string

=end

# Code:

def spin_words(string)
  words = string.split
  words = words.map do |word|
    word.length >= 5 ? word.reverse : word
  end
  words.join(' ')
end

p spin_words("This is a test") == "This is a test" 
p spin_words("This is another test") == "This is rehtona test"
p spin_words("test") == "test"
