=begin

# Problem
- Given an Array of Strings,
  - Return the number of characters of each String that are in the correct alphabet position
- Ignoring Cases

# Examples
p solve(["abode","ABc","xyzD"]) == [4, 3, 1]
p solve(["abide","ABc","xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6, 5, 7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# Algorithm
- A method to determine the number of a single String, called `solve_each`:
  - Initialize an Array constant called `ALPHABETS`, where each element is an alphabet (lowercase) in alphabetical order
  - Initialize `count` to `0`
  - Iterate through each character in the String,
    - If the character (considering lowercase only) at the current position is the same as that in `alphabets` at the same position,
      - Increment `count` by `1`
  - Return `count`
- A method to determine the number of each String in an Array, called `solve`:
  - Iterate through the Array,
    - For each element, apply the above method to find the number
    - Use that number to transform the String element
  - Return the transformed Array

=end

# Code
ALPHABETS = ('a'..'z').to_a
def solve_each(str)
  count = 0
  str.each_char.with_index do |char, index|
    count += 1 if char.downcase == ALPHABETS[index]
  end
  count
end

def solve(arr)
  arr.map do |str|
    solve_each(str)
  end
end

p solve(["abode","ABc","xyzD"]) == [4, 3, 1]
p solve(["abide","ABc","xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6, 5, 7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
