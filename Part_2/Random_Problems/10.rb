=begin

# Problem
- Given an array of strings,
- return the longest prefix among the strings.
- If there isn't one, return ''

# Algorithm
- Initialize `longest_common_prefix` to an empty string
- Iterate through the shortest string in the array,
  - If the current character appears in other strings in the same position
    - push the current character to `longest_common_prefix`
  - Else
    - return `longest_common_prefix`
- Return `longest_common_prefix`

=end

def longest_common_prefix(arr_str)
  longest_common_prefix = ''
  shortest_string = arr_str.min_by { |str| str.length }
  shortest_string.each_char.with_index do |char, index|
    if arr_str.all? { |str| str[index] == char }
      longest_common_prefix << char
    else
      return longest_common_prefix
    end
  end
  longest_common_prefix
end

p longest_common_prefix(["house", "home", "hotel"]) == "ho"
p longest_common_prefix(["abc", "def", "hij"]) == ""
p longest_common_prefix(["flower","flow","flight"]) == "fl"
p longest_common_prefix(["absolute", "abstract" "absent"]) == "abs"
p longest_common_prefix(["metal", "metallurgy","metamorphosis"]) == "meta"
p longest_common_prefix(["dog","racecar","car"]) == ""
p longest_common_prefix(["aabcd", "aacde", "bdsa"]) == ""
