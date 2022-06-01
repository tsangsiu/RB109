# I want to know the size of the longest consecutive elements of X in Y. You will receive two arguments: items and key. Return the length of the longest segment of consecutive keys in the given items.

# Notes:

# The items and the key will be either an integer or a string (consisting of letters only)
# If the key does not appear in the items, return 0
# Examples
# 90000, 0           -->  4
# "abcdaaadse", "a"  -->  3
# "abcdaaadse", "z"  -->  0

=begin

# Problem
- Given a item and a key 
- The item could be a string or an integer
- Find the longest consecutive key in the item
- Input: two integers or two strings
- Output: an integer

item: 90000, key: 4
90000
-> '90000'
-> [['9'], ['0000']]
-> [['0000'], ['000'], ['0000000']]

item: 'abcdaaadse', key: 'a'
'abcdaaadse'
-> ['a','b','c','d','aaa','d','s','e']
-> ['a', 'aaa']
-> 'aaa'
-> 3

# Algorithm
- Given an item of string/integer
- Turn it into a string
- Break the string into groups of the same character
- From the groups, select the group of character represented by the key
- Get the longest String
- Return its length

=end

# Code
def max_consective_items(item, key)
  item = item.to_s
  groups = item.chars.slice_when { |char1, char2| char1 != char2 }.to_a
  groups = groups.select { |group| group.first == key.to_s }
  groups.max_by { |group| group.size }.size
end

p max_consective_items(90000, 0) == 4 
# [['9'], ['0000']]
p max_consective_items('abcdaaadse', 'a') == 3
# [['a'], ['b'], ['c'], ['d'], ['a', 'a', 'a'], ..]
p max_consective_items('ascasdaiiiasdacasdiiiiicasdasdiiiiiiiiiiisdasdasdiii', 'i') == 11

# ~14:00, with Peter
