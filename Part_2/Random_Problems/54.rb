=begin

Move the first letter of each word to the end of it, then add "ay" to the end of
the word. Leave punctuation marks untouched.

# Problem
- Given a sentence, transform each word to "Pig Latin" by the following rules:
  - Move the first letter to the end
  - Then add 'ay' at the end of the word
  - Leave non-word untouched
- Words are separated by space

# Algorithm
- Consider one word ony
  - Move the first letter to the end
  - Add 'ay' at the end of the word
  - Return the modified word

- The main method pig_it
  - Split the sentence into words
  - Iterate through each word
    - If the current 'word' is not punctuation,
      - Transform the word using the above defined method
    - Else
      - Leave it as it is
  - Merge the words back to a sentence
  - Return it

=end

def pig_word(word)
  "#{word[1..]}#{word[0]}ay"
end

def pig_it(sentence)
  words = sentence.split(' ')
  pig_words = words.map do |word|
    if word.chars.all? { |char| ('a'..'z').to_a.include?(char.downcase) }
      pig_word(word)
    else
      word  
    end
  end
  pig_words.join(' ')
end

p pig_it('Pig latin is cool') == "igPay atinlay siay oolcay"
p pig_it('Hello world !') == "elloHay orldway !"
