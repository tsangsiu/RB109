=begin

Given a certain string, create a hash with each character in string as key and
all possible substrings in string starting at each character as value.

# Examples:
-'abcd'
key1 == index 0
  - 'a' [0, 1]
  - 'ab'[0, 2]
  - 'abc'[0, 3]
  -'abcd' [0, 4] 
  - starting at the current index moving up the length of this particular
    substring
key2 = index 1
  - 'b' [1, 1]
  - 'bc' [1, 2]
  - 'bcd' [1, 3]
...etc

# Problem
- Given a String, return a Hash
- The Hash's key is each character in the String
- The value of each key is all the possible substrings starting from the character represented by the key

# Approach
- Iterate through each character
- For each character, set it as the key
- Get all characters starting from that character, put them in an Array, and set it as value

# Algorithm
- Initialize `output` to an empty Hash for output
- Given a String, iterate through each character (with index)
  - Set the current character as the key
  - Get all the substrings starting from the current character
  - Put them in an Array as value
- Return `output`

=end

def substr_hash(str)
  output = {}
  str.each_char.with_index do |char, start_index|
    output[char] = []
    end_index = start_index
    while end_index < str.length
      output[char] << str[start_index..end_index]
      end_index += 1
    end
  end
  output
end

p substr_hash('abcd') == { "a"=>["a", "ab", "abc", "abcd"],
                           "b"=>["b", "bc", "bcd"],
                           "c"=>["c", "cd"],
                           "d"=>["d"] }
