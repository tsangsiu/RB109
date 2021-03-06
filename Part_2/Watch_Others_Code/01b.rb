# Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates). For example, if a character occurs 3 times in all string but not 4 times, you need to include that character three times in the final answer

# Data Structure
# Input: Array of Strings
# Intermediate: Array of Array of character
# Output: Array of common characters

# Algorithm
# Initialize `output` to an empty Array
# Create an Array, which contains arrays of characters of each String
# Iterate through each character of the first String
  # Check if that character exist in all other Strings
  # If yes,
    # Push that character to `output`
    # Delete that character in all other Strings in `str_longest`
# Reutn `output`

# Code
def common_chars(array_strings)
  output = []
  array_strings_chars = array_strings.map { |string| string.chars }
  array_strings[0].chars.each do |char|
    exist_in_all_strings = array_strings_chars.all? { |array_strings_chars| array_strings_chars.include?(char) }
    if exist_in_all_strings
      output << char
      array_strings_chars.each { |array_chars| array_chars.delete_at(array_chars.index(char)) }
    end
  end
  output
end

# Algorithm 2
# Initialize `output` to an empty Array
# Create a deep copy of the given Array
# Iterate through each characters in the first String
  # If the character exists in all Strings in the Array,
    # Push that character to `output`
    # Delete that character in all Strings in the Array
# Return `output`

# Note
# This algorithm is basically the same as the above, just that we are working on Strings here rather than Arrays

# Code 2
def common_chars(arr)
  output = []
  arr_copy = arr.dup.map { |str| str.dup }
  arr.first.each_char do |char|
    if arr_copy.all? { |str| str.include?(char) }
      output << char
      arr_copy.each { |str| str.sub!(char, '') }
    end
  end
  output
end

# A clever solution from the video which I don't think I can come up with.
def common_chars(arr)
  arr_copy = arr.dup.map { |str| str.dup }
  arr[0].chars.select do |char|
    # this do the selection and deletion at the same time
    # if `char` exists, `str.sub!(char, '')` returns the String after deletion is done
    # if `char` does not exist, `str.sub!(char, '')` returns `nil`
    arr_copy.all? { |str| str.sub!(char, '') }
  end
end

=begin

# New Algorithm
- Initialize `output` to an empty array
- Find the shortest string
- Turn it into an array of unique individual characters
- Iterate through the above array,
  - Find the numbers of the current character in other strings
  - Find the minimum (`count_min`) of the above number
  - For `count_min` times,
    - Push the current character to `output`
- Return `output`

=end

def common_chars(arr_str)
  output = []
  str_shortest = arr_str.min_by { |str| str.length }
  chars_shortest = str_shortest
  chars_shortest.chars.uniq.each do |char|
    count_min = arr_str.map { |str| str.count(char) }.min
    count_min.times { |_| output << char }
  end
  output  
end

p common_chars(["bella", "label", "roller"]) #== ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) #== ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) #== ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) #== []
