=begin

# Problem
- To determine if a word is a palindrome, without using the `reverse` method

# Examples
p palindrome?('abcba') == true
p palindrome?('abba') == true
p palindrome?('Abcba') == false # case-sensitive

# Brainstorm
- 'abcba'
  - char at index 0 == char at index 4
  - char at index 1 == char at index 3
- 'abba'
  - char at index 0 == char at index 3
  - char at index 1 == char at index 2
- A String is palindrome if the char at position i == char at position (str.length - 1 - i)
- Do the iteration up to the half-way of the String

# Algorithm
- Initialize `index` to `0`
- While (`index` + 1) <= the length of the given String / 2,
  - If the char at position `index` is not equal to that at position (the length of String - 1 - `index`),
    - Return `false`
  - Increment `index` by 1
- Return `true`

=end

# Code
def palindrome?(str)
  index = 0
  while index + 1 <= str.length / 2
    return false if str[index] != str[str.length - 1 - index]
    index += 1
  end
  true
end

p palindrome?('abcba') == true
p palindrome?('abba') == true
p palindrome?('Abcba') == false

=begin

# Follow-Up Questions

# 1. What if we want a ignore cases?
# Brainstorm
- In that case, when we check the char at position `index` and that at position (the length of String - 1 - `index`),
  - We convert both chars to lowercase first before comparison

=end

def palindrome?(str)
  index = 0
  while index + 1 <= str.length / 2
    return false if str[index].downcase != str[str.length - 1 - index].downcase
    index += 1
  end
  true
end

p palindrome?('abcba') == true
p palindrome?('abba') == true
p palindrome?('Abcba') == true
