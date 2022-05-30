=begin

You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

# Problem
- Given a secret message, decipher it according to the following rules:
  - The second and the last letter is switched
  - The first letter is replaced by its character code
- All are letters and space, no special characters
- Input: string
- Output: string

# Algorithm
- Given a secret message, split it into words at space
- Replace the leading numbers with the character it represents
- Swap the letters between the second and the last letter
- Return the deciphered message

=end

def decipher_this(msg)
  words = msg.split(' ')
  
  words = words.map do |word|
    char_code = ""
    word.each_char do |char|
      if ('0'..'9').to_a.include?(char)
        char_code << char
      end
    end
    word.gsub(/[0-9]+/, char_code.to_i.chr)
  end
  
  words = words.each do |word|
    word[1], word[-1] = word[-1], word[1] if word.length >= 3
  end
  
  words.join(' ')
end

p decipher_this('72olle 103doo 100ya') == 'Hello good day'
p decipher_this('82yade 115te 103o') == 'Ready set go'
p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
