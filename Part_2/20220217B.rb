=begin

Problem:
- Input: string
- Output: integer, count
- Rules
  - given a string `full_text`, return the number of counts of `search_text`
- Question
  - no question for now

Examples:
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

Data Structures:
- input: string
- intermediate: (after brainstorm) integer, to accumulate the count 
- output: integer, count

Brainstorm:
- original thoughts:
  - to count occurrence, the easiest way is the split the string at the search string
  - the count would be the number substring - 1
  - for example, to count 'bb' in 'abbc',
  - 'abbc' -> ['a', 'c'] -> count = 2 - 1
  - but there are edge cases:
    - 'bbaacc', 'bbbbaacc', 'bbbbbb'
  - forgot all above, need to come up with another generic approach
- another approach
  - `full_text` = 'bbabb', `search_text` = 'bb'
  - set count = 0, index = 0
  - iterate through each character of 'bbabb'
    - if full_text[index] == search_text[index]
      - index += 1
      - count += 1 if index == search_text.length
    - else
      - reset index = 0

Algorithm:
- given the `full_text` and `search_string`
- initialise `count` to accumulate counts
- initialise an index variable `index` to 0
- iterate through each character in `full_text`
  - if full_text[index] equals search_text[index]
    - increment index by 1
    - if index equals the length of `search_string`
      - increment count by 1
      - reset index = 0
    - else
      - reset index to 0
- return count

=end

# Code:

def solution(full_text, search_string)
  count = 0
  index = 0
  full_text.chars.each do |char|
    if char == search_string[index]
      index += 1
      if index == search_string.length
        count += 1
        index = 0
      end
    else
      index = 0
    end
  end
  count
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
