=begin

Goat Latin

You are given a string sentence that consist of words separated by spaces. 
Each word consists of lowercase and uppercase letters only.

We would like to convert the sentence to "Goat Latin" (a made-up language 
similar to Pig Latin.) The rules of Goat Latin are as follows:

   If a word begins with a vowel ('a', 'e', 'i', 'o', or 'u'), append "ma" to the end of the word.
       For example, the word "apple" becomes "applema".
   If a word begins with a consonant (i.e., not a vowel), remove the first letter and append it to the end, then add "ma".
       For example, the word "goat" becomes "oatgma".
   Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
       For example, the first word gets "a" added to the end, the second word gets "aa" added to the end, and so on.

Return the final sentence representing the conversion from sentence to Goat Latin.

# Problem
- Given a sentence, convert it to "Goat Latin" based on the following rules:
  - For each word, if it starts with a vowel, add 'ma' to the end of the word
  - Else, move the first letter to the end of the word and then add 'ma'
  - For each word at index position k, add (k + 1) 'a' at the end of each word
  
# Algorithm
- Consider one word only,
  - If the word starts with a vowels
    - add 'ma' at the end of the word
  - Else,
    - move the first letter to the end of the word
    - add 'ma'
  - return the word
  
- Consider a sentence
  - Split the sentence into words
  - Iterate through each word
    - Apply the above method to transform each word
    - With the current index noted, add the corresponding amount of a's at the end of each word
  - Join the words back to a string
  - Return the string

=end

def word_to_goat_latin(word)
  %w(a e i o u).include?(word[0].downcase) ? "#{word}ma" : "#{word[1..]}#{word[0]}ma"
end

def to_goat_latin(sentence)
  words = sentence.split(' ')
  words = words.map.with_index do |word, index|
    word_to_goat_latin(word) + 'a' * (index + 1)
  end
  words.join(' ')
end

p to_goat_latin("The quick brown fox jumped over the lazy dog") == "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
p to_goat_latin("I speak Goat Latin") == "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
