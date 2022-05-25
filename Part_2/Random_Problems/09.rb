=begin
  
# Problem
- Given a string, return the longest palindromic substring
- A single character is not considered a palindromic substring

# Algorithm
- Get all possible substrings of length of least 2
  - Initialize `substrings` to an empty string
  - Iterate through the string with index
    - Set the current index to `idx`
    - Iterate from the current index + 1 `idx + 1` to the last index position
      - get the substring
      - push the substring to `substrings`
  - return `substrings`
- Select all substrings that are palindromes
  - To check if a substring is a palindrome, check if the string is the same when reversed
- Return the one that is the longest

=end

def get_all_substrings(str)
  substrings = []
  str.chars.each_with_index do |char, start_index|
    idx = start_index + 1
    (idx...str.length).each do |end_index|
      substrings << str[start_index..end_index]
    end
  end
  substrings
end

def palindrome?(str)
  str == str.reverse
end

def longest_palindrome(str)
  substrings = get_all_substrings(str)
  substr_pali = substrings.select do |substr|
    palindrome?(substr)
  end
  return "" if substr_pali.empty?
  substr_pali.max_by { |substr| substr.length }
end

p longest_palindrome("babad") == "bab"
p longest_palindrome("cbbd") == "bb"
p longest_palindrome("abcd") == ""
p longest_palindrome("aa") == "aa"
p longest_palindrome("12231221") == "1221"
