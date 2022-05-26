=begin
  
given a string, return the maximum length of a non-empty substring made of a single repeated character

# Problem
- Given a string, 
- return the length of the longest substring that contains the same single character
- Input: string
- Output: integer

# Algorithm
- Initialize an empty array called `substrs`
- Initialize an empty string called `substr`
- Iterate through the string
  - push the current character to `substr`
  - if the next character is not the same as the current one,
    - push `substr` to `substrs`
    - set `substr` to an empty string
- Replace the strings in `substrs` with the individual lengths
- Return the maximum number

=end

def max_repeated_substring_length(str)
  substrs = []
  substr = ''
  str.each_char.with_index do |char, index|
    substr << char
    if char != str[index + 1]
      substrs << substr
      substr = ''
    end
  end

  substrs.map do |substr|
    substr.length
  end.max
end

def max_repeated_substring_length(str)
  groups = str.chars.slice_when { |str1, str2| str1 != str2 }.to_a
  groups.map { |group| group.size }.max
end

p max_repeated_substring_length("aappplee") == 3
p max_repeated_substring_length("abbcccddddeeeeedcba") == 5
p max_repeated_substring_length("abcd") == 1
p max_repeated_substring_length("greencode") == 2
p max_repeated_substring_length("rruunn") == 2
