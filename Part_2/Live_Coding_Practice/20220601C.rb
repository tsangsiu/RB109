# Background
# There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

# Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

# In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

# Requirement
# return a string where:

# the first and last characters remain in original place for each word
# characters between the first and last characters must be sorted alphabetically
# punctuation should remain at the same place as it started, for example: shan't -> sahn't
# Assumptions

# words are seperated by single spaces
# only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
# special characters do not take the position of the non special characters, for example: -dcba -> -dbca
# for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
# ignore capitalisation

=begin

# Problem
- Given a str
- A string may consist of a word or multiple words seperated by spaces
- For each word,
  - keep the first and last letter in place
  - keep the puncutation (- ' , .) in place
  - sort the remaining letters
  - fill the sorted letters in order to the available places
- If the first or last character is not a letter, those do not count as first/last character

# Algorithm
- Consider one word only,
  - Return the given string if the length of the word is less than 4

  - Initialize `chars` to an array containing individual character of the given word
  - Initialize an empty array of the same length of the given word, called `output`

  # to get the first letter
  - Iterate through the string 
    - If the string is a letter
    - Put the letter to the `output`
    - break

  # to get the last letters
  - Iterate through the reversed String
    - If the string is a letter
    - Put that letter to the same place in `output`
    - break

  # for the punctuations
  - Iterate through the String
    - If the sting is not a letter
    - Put the character to the same place in `output`
  
  - Sort the remaining letters
  - Iterate through `output`
  - If the current element is `nil`,
    - Shift `chars` and put it in that place

  - Join `output` to get back the string

" shan't "
["s", "h", "a", "n", "'", "t"]
first letter -> 's'
last letter -> 't'
non- alphabet -> "'"

[nil, nil, nil, nil, nil, nil]
-> ['s', nil, nil, nil, "'", "t"]
['h', 'a', 'n'] -> ['a', 'h', 'n']
-> ['s', 'a', 'h', 'n', "'", "t"]
-> sahn't

=end

# Code 
def scramble_word(word)
  return word if word.length < 4

  chars = word.chars
  output = [nil] * chars.length

  word.chars.each_with_index do |char, index|
    if ('a'..'z').to_a.include?(char)
      output[index] = char
      chars.delete_at(chars.index(char))
      break
    end
  end

  word.chars.reverse.each_with_index do |char, index|
    if ('a'..'z').to_a.include?(char)
      output[-(index + 1)] = char
      chars.delete_at(chars.index(char))
      break
    end
  end

  word.chars.each_with_index do |char, index|
    if !('a'..'z').to_a.include?(char)
      output[index] = char
      chars.delete_at(chars.index(char))
    end
  end

  chars = chars.sort
  output.map do |element|
    if element == nil
      chars.shift
    else
      element
    end
  end.join('')
end

def scramble_words(str)
  words = str.split(' ')
  words.map do |word|
    scramble_word(word)
  end.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss' # 'The first and last letters of a word should reamin in place with the inner letters sorted')
p scramble_words('i') == 'i' # 'Must handle single charater words')
p scramble_words('') == '' # 'Must handle empty strings')
p scramble_words('me') == 'me' # 'Must handle 2 charater words')
p scramble_words('you') == 'you' # 'Must handle 3 charater words')
p scramble_words('card-carrying') == 'caac-dinrrryg' # 'Only spaces separate words and punctuation should remain at the same place as it started')
p scramble_words("shan't") == "sahn't" # 'Punctuation should remain at the same place as it started')
p scramble_words('-dcba') == '-dbca' # 'Must handle special character at the start')
p scramble_words('dcba.') == 'dbca.' # 'Must handle special character at the end')
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth." # 'Must handle a full sentence'

# 41:16, with Peter
