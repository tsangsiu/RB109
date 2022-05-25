=begin
Given a binary string s, return true if the longest contiguous segment of 1's is strictly longer than the longest contiguous segment of 0's in s, or return false otherwise.

   For example, in s = "110100010" the longest continuous segment of 1s has length 2, and the longest continuous segment of 0s has length 3.

Note that if there are no 0's, then the longest continuous segment of 0's is considered to have a length 0. The same applies if there is no 1's.

# length 1 > length 0 True
# length 1 <= length 0 false
# 1's: 2
# 0's: 1

Example 1:

Input: s = "1101"
Output: true
Explanation:
The longest contiguous segment of 1s has length 2: "1101"
The longest contiguous segment of 0s has length 1: "1101"
The segment of 1s is longer, so return true.

Example 2:

Input: s = "111000"
Output: false
Explanation:
The longest contiguous segment of 1s has length 3: "111000"
The longest contiguous segment of 0s has length 3: "111000"
The segment of 1s is not longer, so return false.

Example 3:

Input: s = "110100010"
Output: false
Explanation:
The longest contiguous segment of 1s has length 2: "110100010"
The longest contiguous segment of 0s has length 3: "110100010"
The segment of 1s is not longer, so return false.


check_zero_ones("110") == true
check_zero_ones("0011") == false
check_zero_ones("1") == true
check_zero_ones("0") == false
check_zero_ones("110100010") == false
check_zero_ones("1101") == true
check_zero_ones("11010111100") == true



=end


=begin

# Problem
- Given a string of 0's and 1's
- If the continuous segment of 1 is strictly greater that of 0's, return true 
- Else, return False 
# length 1 > length 0 True
# length 1 <= length 0 false
- Input: String
- Output: boolean

# Algorithm
- Initialize an array called 'length1'
- Initialize an array called 'length0'
- If the given string is all 0's,
  - push 0 to `length1`
- If the given string is all 1's,
  - push 0 to `length0`
- Initialize `last_digit` to nil
- Initialize `length` to 0
- Iterate through the given String
  - if the current digit is the same as the last one,
    - increment `length` by 1
  - if the current digit is not the same as the last one,
    - if the current digit is 1
      - push `length` to `length0`
    - if the current digit is 0
      - push `length` to `length1`
    - reset length to 1
    - set `last_digit` to the current digit

- if the current digit is 1
  - push `length` to `length1`
- if the current digit is 0
  - push `length` to `length0`

- compare the max in `length0` and `length1`
- if the max of `length1` > that of `length0`
  - return true
- else 
  - return false

length1 [2, 1, 4]
length0 [1, 1, 2]

=end

# Code
def check_zero_ones(str)
  length0 = []
  length1 = []
  length0 << 0 if str.chars.uniq.first == '1'
  length1 << 0 if str.chars.uniq.first == '0'
  last_digit = nil
  length = 0

  str.each_char do |digit|
    if digit == last_digit
      length += 1
    else
      if digit == '1'
        length0 << length
      elsif digit == '0'
        length1 << length
      end
      length = 1
      last_digit = digit
    end
  end

  if str[-1] == '1'
    length1 << length
  elsif str[-1] == '0'
    length0 << length
  end

  length1.max > length0.max
  # p length0
  # p length1
end

p check_zero_ones("110") == true
p check_zero_ones("0011") == false
p check_zero_ones("1") == true
p check_zero_ones("0") == false
p check_zero_ones("110100010") == false
p check_zero_ones("1101") == true
p check_zero_ones("11010111100") == true

# ~27:30, with Harold

# Re-Do

=begin

"000011101111101"
"0000|[1]1101111101"
"[1]1101111101", length0 = [4], length1 = []
"111|[0]1111101"
"0|[1]111101", length0 = [4], length1 = [3]
"[1]111101", length0 = [4, 1], length1 = [3]
...

# Algorithm
- Initialize two empty arrays `length0` and `length1` to store the lengths of consecutive 0's and 1's

- Initialize `index` to 0
- Slice the str into groups of 0's and 1's
  - Iterate through the string,
    - If the current digit is not the same as the last one and not the first digit,
      - Slice the string from the start upto, but not including the current position
      - Find the length
      - Push the length to `length0` or `length1` based on the digit
      - Remove the digits from start to the current position
      - Reset `index` to 0
    - Else
      - Increment `index` by 1

- Count the lengths of each group of 0's and 1's and put the result to the above respective arrays
- If `length0` or `length1` is empty, set it to `[0]`
- Return true if the max in `length1` is greater than that of `length0`

=end

def check_zero_ones(str)
  length0 = [0]
  length1 = [0]
  
  index = 0
  loop do
    if str[index] != str[index - 1] && index != 0
      digit_gp = str[0...index]
      length = digit_gp.length
      digit_gp[0] == "0" ? length0 << length : length1 << length
      str = str[index..]
      index = 0
    else
      index += 1
    end
    break if str == ""
  end
  
  length1.max > length0.max
end

# using `slice_when`
def check_zero_ones(str)
  length0 = [0]
  length1 = [0]
  digit_grp = str.chars.slice_when { |a, b| a != b }.to_a
  digit_grp.each { |grp| grp.first == "0" ? length0 << grp.length : length1 << grp.length }
  length1.max > length0.max
end

p check_zero_ones("110") #== true
p check_zero_ones("0011") == false
p check_zero_ones("1") == true
p check_zero_ones("0") == false
p check_zero_ones("110100010") == false
p check_zero_ones("1101") == true
p check_zero_ones("11010111100") == true
