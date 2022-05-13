=begin

You are given a string s. It's a string consisting of letters, numbers or symbols. Your task is to find the Longest substring consisting of unique characters in s, and return the length of it. 

1 <= s.length <= 10^7
All inputs are valid.
=end


# p longestSubstring("baacab") == 3
# p longestSubstring("abcd") == 4
# p longestSubstring("hchzvfrkmlnozjk") == 11
# p longestSubstring("!@#$%^&^%$#@!") == 7\

=begin

# Problem
- Given a String `s`
- Return the length of the longest substring of unique characters
- The substring should only contain unique characters


baacab
b => 1
ba => 2
baa => 
baac
baacab

# Algorithm
- Initialize an empty Array called `lens`
- Initialize a variable called `start_idx` to `0`
- Initialize a variable called `end_idx` to `0`
- While `start_idx` < length of the given String
  - Set `end_idx` to `start_idx`
  - While `end_idx` < length of the given String
    - Get the substr `substr` from index position `start_idx` to `end_idx`
    - We get to see if `substr` contains unique characters
    - If it does,
      - count the length of the substring
      - append the length to the `lens`
    - If not,
      - go to next iteration
- Return the maximum number of `lens`

=end

# Code

def longestSubstring(str)
  lens = []
  start_idx = 0
  end_idx = 0
  while start_idx < str.length
    end_idx = start_idx
    while end_idx < str.length
      substr = str[start_idx..end_idx]
      if substr.chars.uniq == substr.chars
        lens << substr.length
      end
      end_idx += 1
    end
    start_idx += 1
  end
  lens.max
end

p longestSubstring("baacab") == 3
p longestSubstring("abcd") == 4
p longestSubstring("hchzvfrkmlnozjk") == 11
p longestSubstring("!@#$%^&^%$#@!") == 7

# 21:54, with Harold
