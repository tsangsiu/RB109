=begin

Given a string s, return the length of the longest substring between two equal 
characters, excluding the two characters. If there is no such substring return -1.

A substring is a contiguous sequence of characters within a string.

# Problem
- Given a string,
- Return the length of the longest substring between two equal characters
- If there is no such substring, return -1

# Algorithm
- Given a string, get all its possible substrings of length >= 2
- Select the substrings that start end end with the same character
- If the result selected array is empty, return -1
- Else, return the length of the longest string - 2

=end

def get_substrs(str)
  substrs = []
  (0...(str.length - 1)).each do |start_index|
    ((start_index + 1)..(str.length - 1)).each do |end_index|
      substrs << str[start_index..end_index]
    end
  end
  substrs
end

def max_length_between_equal_characters(str)
  substrs = get_substrs(str)
  substrs = substrs.select { |substr| substr[0] == substr[-1] }
  return -1 if substrs.empty?
  substrs.max_by { |substr| substr.length }.length - 2
end

p max_length_between_equal_characters('aa') == 0
p max_length_between_equal_characters('abca') == 2
p max_length_between_equal_characters('cbzxy') == -1