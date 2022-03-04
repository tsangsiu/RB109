=begin

Problem:
- Rules
  - Given a string,
    - group the number of times each character appears in the string
    - sort descendingly by the number of occurrence
    - for the alphabets that appear the same number of times,
      - they should be sorted alphabetically
    - output as a hash
- Problem
  - Case insensitive?
    - Yes
  - What are counted as 'letters'?
    - Only alphabets and digits
- Input: String
- Output: Hash

Examples:
p get_char_count("cba") => {1=>["a", "b", "c"]}
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

Data Structures:
- Input: String
- Intermediate: Hash
- Output: Hash

Algorithm:
- Given a string,
  - initialise a hash called `count` for output
  - split the string into characters
  - remove the letters that are not alphabets or digits
  - convert all character to down case
  - iterate through the characters
    - count the number of occurrence
    - if the count does not exist as a key in `count`,
      - set the count as a key
      - set a array containing that character as its value
    - if the count exists as a key in `count`,
      - check if the character exists in the value (array) as an element
      - if yes,
        - append the character in the array
- Sort the hash by the key (count) in descending order
- Sort the value (array) for each key in ascending order
- Output the hash

=end

# Code:
def get_char_count(string)
  count = {}

  chars = string.chars.map(&:downcase)
  chars = chars.select { |char| (('0'..'9').to_a + ('a'..'z').to_a).include?(char) }
  chars.each do |char|
    occurrence = chars.count(char)
    if !count.has_key?(occurrence)
      count[occurrence] = [char]
    else
      count[occurrence] << char if !count[occurrence].include?(char)
    end
  end

  count = count.sort_by { |(key, value)| key }.reverse.to_h
  count = count.each_pair { |key, value| value.sort! }
  count
end

p get_char_count("cba") == {1=>["a", "b", "c"]}
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
