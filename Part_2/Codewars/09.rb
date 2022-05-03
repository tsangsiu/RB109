=begin

# Problem
- Given a String, transform every word in the following way:
  - Keep the first and last alphabet in place
  - Sort the alphabets in between
  - Symbols should be kept in the same place (they are limited to ",", "-", ".", "'" for this exercise)
  - Ignore case

# Examples
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

# Brainstorm
- Consider a single word only:
  - Get the length of the given word
  - Create an empty Array
  - Put the first and last alphabets, and punctuation in the corresponding place of the Array
  - Sort the remaining alphabets
  - Fill the remaining space one by one
- How to find the first and the last alphabet?
  - `String#index` with regex can help to locate the position of the first alphabet
  - If I do not know `String#index`, I can do iteration

# Algorithm
- Consider a single word only:
  - If the length of the word is <= 3,
    - Return the given word
  - Else,
    - Initialize `word_split` to an empty Array
    - Split the given word into an Array of characters, and save it to `chars`
    - Iterate through the word from position `0` till the end,
      - If the character at position `i` is a punctuation,
        - Put that in the corresponding position in `word`
        - Remove that character from `chars`
    - Iterate through the word from position `0` till the end, character by character
      - If the character at position `i` is an alphabet,
        - Put that in the corresponding position in `word`
        - Remove that character from `chars`
        - Break the iteration
    - Iterate through the word from the end till position `0`, character by character
      - If the character at position `i` is an alphabet,
      - Put that in the corresponding position in `word`
        - Remove that character from `chars
        - Break the iteration
    - Sort the remaining characters in `chars`, ignoring case
    - Fill the `nil` space in `word_split` in sorted order
    - Return the merged String from `word_split`
- Consider the whole String:
  - Split the String at spaces into words
  - Transform each word using the above method
  - Merge each word back to a String
  - Return the String
	
=end

# Code
def scramble_word(word)
  if word.length <= 3
    return word
  else
    word_split = []
    chars = word.split('')
    word.each_char.with_index do |char, index|
      if %w(, . - ').include?(char)
        word_split[index] = char
        chars.delete_at(chars.index(char))
      end
    end
    word.each_char.with_index do |char, index|
      if ('a'..'z').include?(char.downcase)
        word_split[index] = char
        chars.delete_at(chars.index(char))
        break
      end
    end
    word.reverse.each_char.with_index do |char, index|
      if ('a'..'z').include?(char.downcase)
        word_split[word.length - 1 - index] = char
        chars.delete_at(chars.index(char))
        break
      end
    end
    chars.sort_by! { |char| char.downcase }
    word_split.each_with_index do |space, index|
      word_split[index] = chars.shift if space.nil?
    end
    word_split.join('')
  end
end

def scramble_words(sentence)
  words = sentence.split
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
