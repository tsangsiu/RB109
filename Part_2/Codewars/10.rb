=begin

Problem:
- Input: a string of text
- Output: an array of top-3 most occurred words
- Rules:
  - given a string of text (properly with punctuation and line-breaks), 
    return an array of the top-3 most occurring words in descending order of occurrence
  - if a text contains fewer than 3 unique words, then either the top-2 or top-1 word should be return
  - return an empty array if a text contains no word
- Bonus:
  - avoid creating an array whose is as big as the input text
  - avoid sorting the entire array of unique words
- Questions:
  - case-sensitive?
    - case-insensitive, and the result should be lower-cased
  - what defines a word?
    - a string of letters optionally containing one or more apostrophes
  - what if ties?
    - broken arbitrarily

Examples:
p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]

Algorithm:
- given a string of words
- split the word at space
- split the word again at non-alphabet or non-apostrophes
- initalise a empty hash called `count` with default value 0
- iterate through the words
  - tally each word
- sort the hash in descending order of the word count
- return the the top-3 words

=end

# Code:

def top_3_words(string)
  counts = Hash.new(0)
  words = string.split
  words = words.map do |word|
    word.split(/[^a-zA-Z']/)
  end.flatten

  words.each do |word|
    counts[word.downcase] += 1
  end

  counts = counts.sort_by do |word, count|
    count
  end
  counts = counts.reverse!.to_h

  top_3_words = []
  counts.keys.each do |word|
    top_3_words << word if !word.empty? && !(word =~ /^'+$/)
    break if top_3_words.size == 3
  end

  top_3_words
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
