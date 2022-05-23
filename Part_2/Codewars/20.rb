=begin

# Problem
- Given a string,
- return a hash for counts
- the keys are the numbers of occurrence
- the values are arrays of characters of that number of occurrence
- The hash is sorted in descending order by the keys (count)
- The value (array of character) are sorted in ascending order
- Just count the alphabets and numbers, ignore all other characters
- Cases are not important here
- Input: string
- Output: hash

# Examples
p get_char_count("cba") == {1=>["a", "b", "c"]}
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

# Algorithm
- Given a string,
- Turn the whole string to lowercase
- Delete all non-alphabets and non-digits
- Initialize `count` to an empty Hash
- Create an array of unique characters
- Iterate through the array
  - count the number of current character in the given string
  - If the count appears as a key in `count`,
    - push the current character to the value (array) of the corresponding key
  - Else,
    - Create the key
    - Set the value of that key as an array of the current character
- Sort `count` in descending order by the key
- Sort each value (array) in alphabetical order
- Return `count`

=end

# Code
def get_char_count(str)
  counts = {}
  str = str.downcase.delete("^a-zA-z1-90")
  chars = str.chars.uniq

  chars.each do |char|
    count = str.count(char)
    if counts.has_key?(count)
      counts[count] << char
    else
      counts[count] = [char]
    end
  end
  
  counts = counts.sort_by do |key, value|
    key
  end.reverse.to_h

  counts.each do |_, value|
    value.sort!
  end
end

p get_char_count("cba") == {1=>["a", "b", "c"]}
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
