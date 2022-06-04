# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

=begin

# Problem
- Given a string,
  - Turn every 2nd character in every third word to upper case
  - If the desired word has only 1 character, keep it as it is
  - For other words and letters, keep it as it is
- Input: string
- Output: string

# Algorithm
'Lorem Ipsum is simply dummy text of the printing'
-> ['Lorem', 'Ipsum', 'is', 'simply', 'dummy', 'text', 'of', 'the', 'printing']
-> ['Lorem', 'Ipsum', 'iS', 'simply', 'dummy', 'tExT', 'of', 'the', 'pRiNtInG']
-> 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'

- Given a string, split it into words at space
- Iterate through each word,
  - If the current word is the third word,
    - Iterate through each character in that word,
      - If the current character is the 2nd character,
        - Change that character to upper case
- Join the words back to a string
- Return the string

=end

# Code
def to_weird_case(str)
  words = str.split(' ')
  words = words.each_with_index do |word, index_word|
    if (index_word + 1) % 3 == 0
      index_char = 0
      loop do
        word[index_char] = word[index_char].upcase if index_char.odd?
        index_char += 1
        break if index_char >= word.length
      end
    end
  end
  words.join(' ')
end

=begin
  
# Re-do before assessment

# Algorithm
- Given a string, break it into an array individual words
- Iterate through the array with index noted,
  - If the current word is every third word,
    - Change every second character in that word to upper case
- Join the words back to a single string
- Return the string

- Helper method: change every second character in a word to upper case
  - Given a word, split it into an array of individual character
  - Iterate through the array with index noted
    - If the current character is every second character,
      - Change that character to upper case
  - Join the characters back to a single word
  - Return word

=end

# Code
def to_weird_case_word(word)
  chars = word.chars
  chars = chars.map.with_index do |char, index|
    index.odd? ? char.upcase : char
  end
  chars.join('')
end

def to_weird_case(str)
  words = str.split(' ')
  words = words.map.with_index do |word, index|
    (index + 1) % 3 == 0 ? to_weird_case_word(word) : word
  end
  words.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
