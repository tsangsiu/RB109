=begin

You are given a string s and an integer k, a k duplicate removal consists of 
choosing k adjacent and equal letters from s and removing them, causing the left 
and the right side of the deleted substring to concatenate together.

We repeatedly make k duplicate removals on s until we no longer can.

Return the final string after all such duplicate removals have been made.

# Problem
- Given a string, and an integer k
- Repeatedly remove k consecutive alphbets until it is not possible to do so

# Algorithm
- Initialize `index` to 0
- Initialize `same_alphabet_count` by 0
- Iterate through the String,
  - If the current character is the same as the one to the left,
    - increment `same_alphabet_count` by 1
    - If `same_alphabet_count` is equal to k,
      - set the past k characters to empty string (removed)
      - Set `index` to 0
      - Set `same_alphabet_count` to 0
      - Go to next iteration
    - Else,
      - Increment `index` by 1
  - Else,
    - Set `same_alphabet_count` to 1
    - Increment `index` by 1
  - break if we get to the end of the string
- Return the given string

=end

# Code

def remove_dup(str, k)
  str = str.dup # to make the method non-mutating
  index = 0
  same_alphabet_count = 0
  loop do
    if str[index] == str[index - 1] && index != 0
      same_alphabet_count += 1
      if same_alphabet_count == k
        str[(index - k + 1)..index] = ''
        index = 0
        same_alphabet_count = 0
        next
      end
    else
      same_alphabet_count = 1
    end
    index += 1
    break if index >= str.length
  end
  str
end

p remove_dup("abcd", 2) == "abcd"
p remove_dup("deeedbbcccbdaa", 3) == "aa"
p remove_dup("pbbcggttciiippooaais", 2) == "ps"
