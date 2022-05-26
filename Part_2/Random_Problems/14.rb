=begin

Given a string s, reverse only all the vowels in the string and return it.

The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both cases.

# Problem
- Given a string, reverse all vowels in the string only
- Vowels are a, e, i, o, u
- They can be in both cases
- Input: string
- Output: string

# Algorithm
"abeqpio" -> ['a', 'b', 'e', 'q', 'p', 'i', 'o']
['a', 'e', 'i', 'o'], [nil, 'b', nil, 'q', 'p', nil, nil]
['o', 'i', 'e', 'a'], [nil, 'b', nil, 'q', 'p', nil, nil]
['o', 'b', 'i', 'q', 'p', 'e', 'a']
obiqpea

- Given a string, turn it into an array of individual characters
- From the array, select all vowels from it and save it to a new array
- Replace all vowels in the array to `nil`
- Reverse the vowel array
- For each vowel in the array,
  - put them in order to the character array where the element is `nil`
- Join the array to form a string
- Return the string

=end

VOWELS = %w(a e i o u A E I O U)
def reverse_vowels(str)
  characters = str.chars
  vowels = characters.select { |character| VOWELS.include?(character) }
  characters = characters.map { |character| VOWELS.include?(character) ? nil : character }
  vowels = vowels.reverse
  characters = characters.map { |character| character.nil? ? vowels.shift : character }
  characters.join('')
end

p reverse_vowels("casa") == "casa"
p reverse_vowels("xwl") == "xwl"
p reverse_vowels("") == ""
p reverse_vowels("hello") == "holle"
p reverse_vowels("abeqpio") == "obiqpea"
p reverse_vowels("leEtcode") == "leotcEde"
