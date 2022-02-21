=begin
  
Problem:
- Input: string of a single word/sentence
- Output: string
- Rules:
  - return a string where:
    - the first and last characters remain in original place for each word
    - characters between the first and last characters must be sorted alphabetically
    - punctuation should remain at the same place, shouldn't -< sdhlnu't
  - for this problem, the punctuation is limited to hypen, apostrophe, comma, and period
  - ignore capitalisation
- Questions:
  - What defines a word?
    - by space
  - What is the input?
    - by the examples given, the input can be a single word or a sentence

Examples:
p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

Data Structure:
- Input: string
- Intermediate: array to store intermediate 'string'
- Output: string

Algorithm:
- Consider only a single word case first:
  - given a single word
  - split the word into characters
  - initalise an empty array to store the 'string' in the process of transformation
  - iterate through the letter
    - put the first alphabet in the corresponding position of the array
    - put the last alphabet in the corresponding position of the array
    - put the punctuations in the corresponding place
    - remove all the above characters from the original word (set the char to nil)
  - sort the remaining characters in the word
  - place them in order in the null place of the initialised array
  - merge all the characters in the above array into a word
  - return that word

- for the main function, where the input could be a string or a sentence:
  - split the string into words
  - iterate through the words
    - for each word, apply the method defined above to transform it
  - merge all words back to a sentence
  - return that word

=end

# Code:

PUNCTUATIONS = %w(- ' , .)

def scramble_word(word)
  chars = word.split('')
  chars_transformed = []

  0.upto(word.length - 1) do |index|
    if ('a'..'z').to_a.include?(chars[index]) # or chars[index] =~ /[a-z]/
      chars_transformed[index] = chars[index]
      chars[index] = nil
      break
    end      
  end

  (word.length - 1).downto(0) do |index|
    if ('a'..'z').to_a.include?(chars[index])
      chars_transformed[index] = chars[index]
      chars[index] = nil
      break
    end
  end

  0.upto(word.length - 1) do |index|
    if PUNCTUATIONS.include?(chars[index])
      chars_transformed[index] = chars[index]
      chars[index] = nil
    end
  end

  chars.delete(nil)
  chars.sort!
  chars_transformed.each_with_index do |char, index|
    chars_transformed[index] = chars.shift if char == nil
  end

  chars_transformed.join('')
end

def scramble_words(string)
  words = string.split
  words = words.map do |word|
    scramble_word(word)
  end
  words.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
