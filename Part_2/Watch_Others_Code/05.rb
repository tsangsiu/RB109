# Find the length of the longest substring in the given string that is the same in reverse.

# As an exmaple, if the input was "I like racecars that go fast", the substring (racecar) length would be 7.

# If the length of the input string is 0, return value must be 0.

# Example:
# "a" -> 1
# "aab" -> 2
# "abcde" -> 1
# "zzbaabcd" -> 4
# "" -> 0

=begin

# Problem
- Given a String, find the length of the longest substring that is a palindrome
- A String is a palindrome when it reads the same in reverse
- If the given String is an empty String, return 0
- A palindrome can be of length 1

- Input: String
- Output: Integer

# Algorithm
- Define a method for palindrome called `palindrome?`:
  - The method returns true when a string is the same when it is reversed
  - If the method `reverse` cannot be used,
    - Iterate from the beginning char to the middle char,
      - check if str[index] == str[-(index + 1)]

- The main method `longest_palindrome`
  - Return 0 if the length of the given string is 0
  - Initialize an empty array called `palindromes` to store all palindromes
  - Consider all the substrings in the given String:
  - Iterate through the strings with index
    - Set the current index as the start index
    - From the start index upto the last index (length of the given string - 1),
      - Get the current substring
      - Check if it is a palindrome
      - If yes, push the substring to `palindromes`
  - Find the longest palindrome in `palindromes`
  - Return its length

=end

# Code
def palindrome?(str)
  str == str.reverse  
end

def palindrome?(str)
  (0...(str.length / 2)).each do |index|
    return false if str[index] != str[-(index + 1)]
  end
  true
end

def longest_palindrome(str)
  return 0 if str.length == 0
  palindromes = []
  str.each_char.with_index do |char, index|
    start_index = index
    (start_index...str.length).each do |end_index|
      substr = str[start_index..end_index]
      palindromes << substr if palindrome?(substr)
    end
  end
  palindromes.max_by { |substr| substr.length }.length
end

puts longest_palindrome('') == 0
puts longest_palindrome('a') == 1
puts longest_palindrome('aa') == 2
puts longest_palindrome('baa') == 2
puts longest_palindrome('aab') == 2
puts longest_palindrome('baabcd') == 4
puts longest_palindrome('baab1kj12345432133d') == 9
puts longest_palindrome("I like racecars that go fast") == 7
