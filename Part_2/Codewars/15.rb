=begin

Problem:
- Rules
  - given an array of one-letter strings representing directions to walk (n, s, w, e)
  - each direction takes exactly one minute
  - return true if:
    - take exactly ten minutes (don't want to be early or late)
    - return to the starting position
- Input: an array of directions
- Output: boolean
- Questions
  - Will there be a mixture of all 4 durections?
    - I assume there is only two opposite directions?
    - After not passing all test cases, seems that there could be all 4 different directions

Examples:
p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

Data Structures:
- Input: array
- Intermediate: array
- Output: boolean

Algorithm:
- given an array of one-letter strings representing directions
  - check if it contains 10 elements
  - check for each pair of opposite directions (n and s, or w and e),
    they should be the same number
  - return true if all above are true, false if otherwise

=end

# Code:

OPPOSITE_DIRECTIONS = [['n', 's'], ['e', 'w']]

def is_valid_walk(directions)
  directions.size == 10 &&
  directions.count('n') == directions.count('s') &&
  directions.count('e') == directions.count('w')
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
