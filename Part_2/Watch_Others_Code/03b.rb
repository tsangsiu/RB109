# Write a method to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, reurn an empty string "".

# Example 1:

# Input: ["flower", "flow", "flight"]
# Output: "fl"

# Example 2:

# Input: ["dog", "racecar", "car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

# Notes:

# All given inputs are in lowercase letters a-z.

=begin

# Problem
- Given an array of strings,
- return the longest prefix string amongst all the strings in the array
- If there is no common prefix, return an empty string ""
- all strings in the given array are in lowercase letters

- Input: array
- Output: string

# Algorithm
- Take the first string from the given array as a reference
- Initialize `common_prefix` to an empty String
- From index 0 up to, but not including, the length of the first string
  - Get the prefix, from index 0 to the current index
  - Check if all strings in the array start with that prefix
  - If yes,
    - Set `common_prefix` to the prefix
  - Else,
    - Return `common_prefix`
- Return `common_prefix`

=end

# Code
def common_prefix(arr)
  first_str = arr.first
  common_prefix = ""
  (0...first_str.length).each do |index|
    prefix = first_str[0..index]
    if arr.all? { |str| str.start_with?(prefix) }
      common_prefix = prefix
    else
      return common_prefix
    end
  end
  common_prefix
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"
