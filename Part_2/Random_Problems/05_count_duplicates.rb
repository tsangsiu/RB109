=begin

Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic 
characters and numeric digits that occur more than once in the input string. 
The input string can be assumed to contain only alphabets (both uppercase and 
lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

# Problem
- Given a String, return the number of characters that appears more than once.
- Ignore case
- The given String contains only alphabets and numeric digits

# Algorithm
- Initialize `count` to 0
- Get an array of unique characters (consider lowercase only)
- Iterate through the array,
  - Count the number of the current character in the given String
  - If the count is more than 1,
    - Increment `count` by 1
- Return `count`

=end

def count_duplicates(str)
  count = 0
  uniq_chars = str.downcase.chars.uniq
  uniq_chars.each do |char|
    count += 1 if str.downcase.count(char) > 1
  end
  count
end

p count_duplicates("abcde") == 0
p count_duplicates("aabbcde") == 2
p count_duplicates("aabBcde") == 2
p count_duplicates("indivisibility") == 1
p count_duplicates("Indivisibilities") == 2
p count_duplicates("aA11") == 2
p count_duplicates("ABBA") == 2
