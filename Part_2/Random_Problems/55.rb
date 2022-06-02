=begin

Gandalf's writings have long been available for study, but no one has yet 
figured out what language they are written in. Recently, due to programming work
by a hacker known only by the code name ROT13, it has been discovered that 
Gandalf used nothing but a simple letter substitution scheme, and further, that
it is its own inverse the same operation scrambles the message as unscrambles it.

This operation is performed by replacing vowels in the sequence
'a' 'i' 'y' 'e' 'o' 'u' with the vowel three advanced, cyclicly, while 
preserving case (i.e., lower or upper).

Similarly, consonants are replaced from the sequence 
'b' 'k' 'x' 'z' 'n' 'h' 'd' 'c' 'w' 'g' 'p' 'v' 'j' 'q' 't' 's' 'r' 'l' 'm' 'f'
by advancing ten letters.

So for instance the phrase 'One ring to rule them all.' translates to 'Ita dotf ni dyca nsaw ecc.'

The fascinating thing about this transformation is that the resulting language
yields pronounceable words. For this problem, you will write code to translate 
Gandalf's manuscripts into plain text.

Your job is to write a function that decodes Gandalf's writings.

# Problem
- Given a string about Gandalf's writing
- Consider each character in the string,
  - If the character is a vowel (a, i, y, e, o, u),
    - Move it 3 chars forward in this sequence: ['a' 'i' 'y' 'e' 'o' 'u']
  - Else if the character is a consonents,
    - Move it 10 chars forward in this sequence: 
      ['b' 'k' 'x' 'z' 'n' 'h' 'd' 'c' 'w' 'g' 'p' 'v' 'j' 'q' 't' 's' 'r' 'l' 'm' 'f']
- Keep the original case

# Algorithm
- Given a string, split it into an array of individual characters
- Iterate through the above array
  - If the current character is a vowel,
    - transform it by moving it 3 chars forward in the given sequence
  - Else if the current character is a consonant,
    - transform it by moving it 10 chars forward in the given sequence
- Join the characters back to a string
- Return the string

# Subtask: transform_vowel(vowel)
- Initialize a constant called `VOWELS` to ['a' 'i' 'y' 'e' 'o' 'u']
- Get the index position of the vowel in `VOWELS`
- add 3 to that index
- Take that index modulo the size of `VOWELS`
- For the new index, get the corresponding vowel in `VOWELS`
- If the given vowel is in upper case, return the transformed vowel in upper case
- Else, return the lower case vowel

# Subtask: transform_consonant(consonant)
- Initialize a constant called `CONSONANTS` to 
  ['b' 'k' 'x' 'z' 'n' 'h' 'd' 'c' 'w' 'g' 'p' 'v' 'j' 'q' 't' 's' 'r' 'l' 'm' 'f']
- Get the index position of the consonant in `CONSONANTS
- Add 10 to that index
- Take that index modulo the size of `CONSONANTS`
- For the new index, get the corresponding consonant in `CONSONANTS`
- If the given consonant is in upper case, return the transformed consonant in upper case
- Else, return the lower case consonant

# subtask: to check if a letter is in upcase
- Given a letter,
  - If the given letter upcased is the case as the given letter,
    - return true

=end

VOWELS = %w(a i y e o u)
CONSONANTS = %w(b k x z n h d c w g p v j q t s r l m f)

def upcase?(letter)
  letter.upcase == letter
end

def transform_consonant(consonant)
  index = (CONSONANTS.index(consonant.downcase) + 10) % CONSONANTS.size
  consonant_transformed = CONSONANTS[index]
  upcase?(consonant) ? consonant_transformed.upcase : consonant_transformed
end

def transform_vowel(vowel)
  index = (VOWELS.index(vowel.downcase) + 3) % VOWELS.size
  vowel_transformed = VOWELS[index]
  upcase?(vowel) ? vowel_transformed.upcase : vowel_transformed
end

def tongues(str)
  chars = str.chars
  chars_transformed = chars.map do |char|
    if VOWELS.include?(char.downcase)
      transform_vowel(char)
    elsif CONSONANTS.include?(char.downcase)
      transform_consonant(char)
    else
      char
    end
  end
  chars_transformed.join('')
end

p tongues('Ita dotf ni dyca nsaw ecc.') == 'One ring to rule them all.'
p tongues('Tim oh nsa nowa gid ecc fiir wat ni liwa ni nsa eor ig nsaod liytndu.') == 'Now is the time for all good men to come to the aid of their country.'
p tongues('Giydhlida etr hakat uaedh efi iyd gidagensadh pdiyfsn ytni nsoh') == 'Fourscore and seven years ago our forefathers brought unto this'
p tongues('litnotatn e tam tenoit.') == 'continent a new nation.'
p tongues('Nsa zyolv pdimt gij xywbar ikad nsa cequ rifh.') == 'The quick brown fox jumped over the lazy dogs.'
