# Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only.

# Example 1:
# Input: "abab"
# Output: true
# Explanation: It's the substring "ab" twice.

# Example 2:
# Input: "aba"
# Output: false

# Data Structure
# Input: String
# Intermediate: String
# Output: Boolean

# Algorithm
# Initialize the variable `index` to 0
# While `index` <= length of the given string / 2,
  # Set `substr` to the substring from position `0` to `index`, inclusively
  # If length of the given string % length of the substring == 0,
    # Calculate `multiple` = length of the given string / length of the substring
    # If `substr` * `multiple` == `str`
      # Return `true`
  # Increment `index` by 1
# Return `false`

# Coding

def repeated_string_pattern(str)
  index = 0
  while index <= str.length / 2
    substr = str[0..index]
    if str.length % substr.length == 0
      multiple = str.length / substr.length
      if substr * multiple == str
        return true
      end
    end
    index += 1
  end
  return false
end

p repeated_string_pattern("abab") == true
p repeated_string_pattern("aba") == false
p repeated_string_pattern("aabaaba") == false
p repeated_string_pattern("abaababaab") == true
p repeated_string_pattern("abcabcabcabc") == true
