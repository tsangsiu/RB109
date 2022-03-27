=begin

Problem
Rules/Requirements
- Given a string,
  - return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once
- The input string contains only alphabets (both uppercase and lowercase) and numeric digits
Input: String
Output: Integer

Examples
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

Data Structures
- Input: String
- Intermediate: String 
- Output: Integer

Algorithm
- Initialise an integer call `count` to 0 for output
- Given the string, convert all characters to lowercase
- Create an array containing the lowercase of all distinct characters
- Iterate through each character in the array,
  - if that character appears more than once in the given string (lowercased),
    - increment `count` by 1
- Return `count`

=end

# Code

def duplicate_count(str)
  count = 0
  str_lowercase = str.downcase
  distinct_chars = str_lowercase.chars.uniq
  distinct_chars.each do |char|
    count += 1 if str_lowercase.count(char) > 1
  end
  count
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
