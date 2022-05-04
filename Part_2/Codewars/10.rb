=begin

# Problem
- Given a String of words, return an Array of the top 3 most occurred words in descending order
- Assumptions
  - A word is a string of letters (A to Z), may or may not contain an apostrophes (')
  - No need to handle punctuation
  - Case-insensitive
  - Ties maybe broken arbitrarily
  - If a text contains fewer than three unique words, return either the top-2 or top-1

# Examples
p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]

# Algorithm
- Split the String into an array of words at space, or non-apostrophes and -letters
- Initialize `count` to an empty Hash, with a default value `0`
- Iterate through the Array,
  - Tally each word and record the result in `count`
- Sort the Hash `count` in descending order according to the value
- Return the first three keys (the top 3 word in an Array)

=end

# Code
def top_3_words(str)
  count = Hash.new(0)
  words = str.scan(/[a-z]+'?[a-z]*/i)
  words.each do |word|
    count[word.downcase] += 1 if word != " "
  end
  count = count.sort { |pair1, pair2| pair2.last <=> pair1.last }
  count = count.map do |pair|
    pair.first
  end
  count[0..2]
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
