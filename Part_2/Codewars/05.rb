=begin

# Problem
- Given a lowercase String that contains only alphabets and no space,
  - Return the longest vowel substring

# Examples
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

# Brainstorm
- Use iteration
- Iterate from the alphabet at index position `0` to the end
- If the current alphabet is a vowel,
  - Increment `count` by `1`
- Else,
  - Reset `count` to `0`
- Need an Array to store all the `count`s

# Algorithm
- Initialize a constant Array `VOWELS` to `%w(a e i o u)`
- Initialize `counts` to an empty Array
- Initialize `count` to 0
- Iterate through each alphabet in the given String,
  - If the current alphabet is a vowel,
    - Increment `count` by `1`
  - Else,
    - Push `count` to `counts` if `count` is not equal to `0`
    - Reset `count` to `0`
- Return the maximum value in `counts`

=end

VOWELS = %w(a e i o u)
def solve(str)
  counts = []
  count = 0
  str.each_char do |alphabet|
    if VOWELS.include?(alphabet)
      count += 1
    else
      counts << count if count != 0
      count = 0
    end
  end
  counts << count if count != 0
  counts.max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") #== 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
