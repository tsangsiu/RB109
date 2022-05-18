# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You wil return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

=begin

# Problem
- Given two strings,
  - Return true if they have a substring that appears in both strings
  - Return false if otherwise
- We only consider substrings that are of length greater than 1
- We ignore cases - uppercase and lowercase letters are treated the same

- Input: Two strings
- Output: Boolean

# Algorithm
- Get the string that is shorter
- Iterate the string to get all the possible substring
  - If the substring appears in the other string
    - Return true
- Return false

- Algorithm to get all substrings from a string:
  - Iterate through each character with index
    - Set `start_index` to the current index
    - From the (current index + 1) to (length of the string - 1),
      - Get the substring
      - Check if the substring appears in the other string
      - If yes, return true

=end

# Code
def substring_test(str1, str2)
  str1.length < str2.length ? str = str1 : str = str2
  (0..(str.length - 2)).each do |start_index|
    ((start_index + 1)...str.length).each do |end_index|
      substr = str[start_index..end_index]
      return true if [str1, str2].all? { |string| string.downcase.include?(substr) }
    end
  end
  false
end

p substring_test('Something', 'Fun') == false 
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false 
p substring_test('Something', '') == false 
p substring_test('', 'Something') == false 
p substring_test('BANANA', 'banana') == true 
p substring_test('', '') == false 
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
