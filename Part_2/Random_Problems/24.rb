=begin


You are given a string num representing a large integer. An integer is good if it meets the following conditions:

   It is a substring of num with length 3.
   It consists of only one unique digit.

Return the maximum good integer as a string or an empty string "" if no such integer exists.

Note:

   A substring is a contiguous sequence of characters within a string.
   There may be leading zeroes in num or a good integer.

# Problem
- Given a string of a large number
- Return the largest good integer in string
- Return an empty string is there isn't a good integer
- A good integer is a string of length 3 and all digits are the same

# Algorithm
- Given a string of a large number
- Slice the string into an array of substrings of equal numbers
- From the above array, select the strings that are of length 3 and are all the same digits
- If the result array is empty, return an empty string
- Else, return the 'maximum' one from the above array

=end

def largest_good_integer(str)
  groups = str.chars.slice_when { |digit1, digit2| digit1 != digit2 }.to_a
  groups.map! { |group| group.join('') }
  good_nums = groups.select do |str_num|
    str_num.length == 3 && str_num.chars.uniq.size == 1
  end
  if good_nums.empty?
    ""
  else
    good_nums.sort.last
  end
end

p largest_good_integer('13455587222') == "555"
p largest_good_integer('456987') == ""
p largest_good_integer("11458000") == "000"
p largest_good_integer("111") == "111"
p largest_good_integer("111222333444555666") == "666"
p largest_good_integer("42352338") == ""
