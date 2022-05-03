=begin

# Problem
- Given a String,
  - Return the shortest substring and the largest value such that substring * vlaue == the given String

# Examples
p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

# Algorithm
- Iterate from `1` to the length of the given String,
  - Get the current substring
  - If the length of the given String is a multiple of the length of the current substring,
    - If current substring * (length of the given String / length of the current substring) == the given String,
	  - Return an Array with two elements: the current substring and the ratio
  - Else,
  	- Go to the next iteration

=end

def f(str)
  1.upto(str.length) do |substr_len|
    substr = str[0, substr_len]
	if str.length % substr.length == 0
	  len_ratio = str.length / substr.length
	  return [substr, len_ratio] if substr * len_ratio == str
	else
    next
	end
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
