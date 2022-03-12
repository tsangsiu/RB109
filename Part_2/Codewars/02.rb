=begin

Problem:
- Input: array of integers
- Output: integer, the number of pairs
- Rules:
  - For empty array and single-value array, return 0
  - If there are more pair of a certain number, count each pair only one,
    e.g., [0, 0, 0, 0] => 2
- Questions:
  - There may be more than 1 possible combination of pairs,
    how to determine if they are a pair?
    - Later when I fully understand more the question, this is not a question

Examples:
[1, 2, 5, 6, 5, 2] => 2 (2 pairs of 2 and 5)
[1, 2, 2, 20, 6, 20, 2, 6, 2] => 4 (4 pairs of [2, 20] or [6, 2]])

Brainstorm (Ding!!):
- Knowing that pairs must come in two
- To find the number of pair
  - get rid of one of the integers which appear odd number of times (how?)
  - the result is the number of the remaining integers divided by 2

Data Structure:
- Input: array
- Intermediate: array to keep track of the numbers that are in pairs
- Output: integer

Algorithm:
- given an array
- initialise an array called `pairs` to store the integers that are in pairs
- iterate through the given array
  - if the number occurs odd numbers of times in the given array, say n times, and `pairs` does not contain that number
    - add (n - 1) copies of that number to `pairs`
  - if the number oddurs even numbers of time in the given array, say m times, and `pairs` does not contain that number
    - add m copies of that number to `pairs`
- find the number of elements in `pairs` divided by 2
- return the result

=end

# Code:

def pairs(array)
  pairs = []
  array.each do |integer|
    if !pairs.include?(integer)
      count = array.count(integer)
      if count.odd?
        pairs = pairs + [integer] * (count - 1)
      else
        pairs = pairs + [integer] * count
      end
    end
  end
  pairs.size / 2
end

p pairs([1, 2, 5, 6, 5, 2])
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
