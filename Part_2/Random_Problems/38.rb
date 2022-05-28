=begin

Give a binary string s, return the number of non-empty substrings that have the 
same number of 0's and 1's, and all the 0's and all the 1's in these substrings 
are grouped consecutively.

Substrings that occur multiple times are counted the number of times they occur.
  
# Problem
- Given a string containing only 0's and 1's
- Count the number of substrings that:
  - contain the same number of 0's and 1's
  - the 0's and 1's are grouped consecutively
- If some substrings are duplicated, the duplicates still count

# Algorithm
- Given a binary string, get all possible substrings
  - Initialize `substrs` to an empty array
  - Iterate from index position 0 to (the length of the string - 2)
    - Iterate from the current index position to (the length of the string - 2)
      - Get the substring
      - Push the substring to `substrs`
  - Return `substrs`
- From the array of all substrings, select those substrings that contain the same number of 0's and 1's
- Further select the substrings that the 0's and 1's are grouped consecutively
- Count the number of substring in the above result array
- Return the result

=end

def get_substrs(str)
  substrs = []
  (0...str.length).each do |start_index|
    (start_index...str.length).each do |end_index|
      substrs << str[start_index..end_index]
    end
  end
  substrs
end

def count_binary_substrings(str)
  substrs = get_substrs(str)
  substrs.select! { |substr| substr.count('0') == substr.count('1') }
  substrs.map! { |substr| substr.chars.slice_when { |digit1, digit2| digit1 != digit2 }.to_a }
  substrs.select! { |substr| substr.size == 2 }
  substrs.size
end

p count_binary_substrings('00110011') == 6
p count_binary_substrings('10101') == 4
