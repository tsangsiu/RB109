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

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
