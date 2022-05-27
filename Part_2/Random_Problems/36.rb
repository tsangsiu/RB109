=begin

Given a string array words, return an array of all characters that show up in 
all strings within the words (including duplicates). You may return the answer
in any order.

# Problem
- Given an array of words `words`
- Return an array containing characters that appears in all words in `words` (including duplicates)

# Algorithm
- Initialize `output` to an empty array
- Get the shortest word from `words`
- Turn it into an array of unique individual characters
- Iterate through the array
  - If the current character appears in all other words,
    - find the minimum number of occurrence among all words
    - Push that number of the current character to `output`
- Return `output`

=end

def common_chars(words)
  output = []
  word_shortest = words.min_by { |word| word.length }
  chars_shortest = word_shortest.chars.uniq
  chars_shortest.each do |char|
    if words.all? { |word| word.include?(char) }
      occurrence_min = words.map { |word| word.count(char) }.min
      occurrence_min.times { |_| output << char }
    end
  end
  output
end

p common_chars(["bella","label","roller"]) == ["e","l","l"]
p common_chars(["cool","lock","cook"]) == ["c","o"]
