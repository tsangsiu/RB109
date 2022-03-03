=begin

Problem:
- Rules
  - Convert a string into title case
  - There is another optional argument of minor words
    - They are given as a string with each word separated by a space
    - They could be given in whatever cases
  - The first word is always capitalised
- Questions:
  - What is title case?
    - Each word in the string is either:
      - capitalised (only the first letter is in upper case)
      - considered to be an exceptin and put entirely in lower cases unless it is the first word
  - Is the method destructive?
    - I suppose it's non-destructive.
- Input: String
- Output: String

Examples:
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'

Data Structures:
- Input: String
- Intermediate: Array
- Output: String

# Algorithm:
- Given a string, split it into words and convert them in lower cases
- Given a list of minor words (optional), split it into words and convert them in lower cases
- Iterate through the list of words
  - If it is the first word, capitalise it
  - Else if the word is in the list of minor words, do nothing
  - Else capitalise it
- Combine the words back to a single string
- Return the string

=end

# Code:
def title_case(string, minor_words = '')
  words = string.split.map { |word| word.downcase }
  minor_words = minor_words.split.map { |minor_word| minor_word.downcase }
  word_count = 0
  words = words.map do |word|
    word_count += 1
    if word_count == 1
      word.capitalize
    elsif minor_words.include?(word)
      word
    else
      word.capitalize
    end
  end
  words.join(' ')
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
