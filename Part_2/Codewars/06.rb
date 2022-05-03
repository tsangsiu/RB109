=begin

# Problem
- Given a string, find the number of substrings that are odd numbers

# Examples
- For example, for "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

# Brainstorm
- Iterate the whole string mutliple times
- Consider a substring of a fixed length at a time

# Algorithm
- Initialize `substr_len` to `1`
- Initialize `count` to `0`
- While `substr_len` <= length of the given String,
  - Iterate through the String from index position `0` to (length of the given String - 1 - `substr_len`),
    - Get the current substring (from current index position to (current index position + `substr_len`))
    - Convert the current substring to an Integer
    - If the Integer is odd,
      - Increment `count` by `1`
  - Increment `substr_len` by `1`
- Return `count`

=end

# Code
def solve(str)
  substr_len = 1
  count = 0
  while substr_len <= str.length
    0.upto(str.length - substr_len) do |index|
      substr = str[index, substr_len]
      count += 1 if substr.to_i.odd?
    end
    substr_len += 1
  end
  count
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
