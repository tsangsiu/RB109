=begin

# Problem
- Given a string, find the length of the longest substring without repeating characters
- Input: String
- Output: Integer

# Algorithm
- Return 0 if the input is an empty string
- Get all possible substrings
  - initialize an empty array called `substrings`
  - iterate through the given string with index
    - set `end_index` to the current index
    - iterate from `end_index` to the last index position
      - get the substring
      - push the substring to `substrings`
  - return `substrings`
- Select substrings that contains no repeating characters
- From the array above, return the length of the longest one.

=end

# Code
def get_all_substrings(str)
  substrings = []
  str.each_char.with_index do |char, start_index|
    index = start_index
    (index...str.length).each do |end_index|
      substrings << str[start_index..end_index]
    end
  end
  substrings
end

def length_of_longest_substring(str)
  return 0 if str == ''
  substrings = get_all_substrings(str)
  substr_uniq = substrings.select do |substr|
    substr.chars == substr.chars.uniq
  end
  substr_uniq.max_by { |substr| substr.length }.length
end

=begin

# A Faster Algorithm
Example: abcabcbb

- Initialize `lens_uniq` to an empty array
- Set `start_index` to 0
- Set `end_index` to 0
- Iterate from `start_index` to the last index position,
  - Get the substring
  - If the substring contains repeating character,
    - push the end_index - start index to `lens_uniq`
    - Increment `start_index` by 1
  - Else,
    - Increment `end_index` by 1
- Return the largest number is `lens_uniq`

=end

# Code

def length_of_longest_substring(str)
  lens_uniq = []
  start_index = 0
  end_index = 0
  loop do
    substr = str[start_index..end_index]
    if substr.chars != substr.chars.uniq
      lens_uniq << end_index - start_index
      start_index += 1
    else
      end_index += 1
    end
    break if start_index >= str.length
  end
  lens_uniq.max
end

p length_of_longest_substring('aaaabbcba') == 3
p length_of_longest_substring('aaaaaa') == 1
p length_of_longest_substring('pwwkea') == 4
p length_of_longest_substring('') == 0
p length_of_longest_substring('a') == 1
p length_of_longest_substring('robtuunop') == 5
p length_of_longest_substring('tucccaassaa') == 3
