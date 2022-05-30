=begin

The input is a string str of digits. Cut the string into chunks (a chunk here is
a substring of the initial string) of size sz (ignore the last chunk if its size
is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is 
divisible by 2, reverse that chunk; otherwise rotate it to the left by one
position. Put together these modified chunks and return the result as a string.

If

sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

# Problem
- Given a string representing an integer
- Split the string into groups of `sz` digits
- For each group,
  - If the sum of cubes of digits is even, reverse the string
  - Else shift the leftmost digit to the right
- Join the group back to a string and return it
- If `sz` is 0 or longer than the given string, return an empty string
- If the length of the last group is less than `sz`, ignore it

# Algorithm
- Return an empty string if `sz` is 0 or `sz` is longer than the given string
- Split the given string into groups of length `sz`
- For each group of string,
  - If the sum of cubes of digits is even, reverse the string
  - Else shift the leftmost digit to the right
- Join the group back to a single string
- Return the string

- A method to split the string into groups of strings of length `sz`:
  - Given a string `str` and size `sz`,
    - Initialize `chunks` to an empty array
    - Initialize `index` to 0
    - While index < length of the given string
      - Get the substring from `index` of length `sz`
      - Push that to `chunks` if the length of the substring is `sz`
      - Increment `index` by `sz`
    - Return `chunks`

=end

def split_str(str, sz)
  chunks = []
  index = 0
  while index < str.length
    substr = str[index, sz]
    chunks << substr if substr.length == sz
    index += sz
  end
  chunks
end

def sum_of_cubes_of_digits(num)
  num.digits.map { |digit| digit ** 3 }.sum
end

def revrot(str, sz)
  return "" if sz == 0 || sz > str.length
  chunks = split_str(str, sz)
  chunks = chunks.map do |chunk|
    if sum_of_cubes_of_digits(chunk.to_i).even?
      chunk.reverse
    else
      chunk[1..] + chunk[0]
    end
  end
  chunks.join('')
end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
