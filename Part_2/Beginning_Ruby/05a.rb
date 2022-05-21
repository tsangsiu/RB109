# **instructions**

# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels removed.

# -------------------------------------
# **input:**
# Write a list of words: green, yellow, black, white

# **output:**
# List of modified words are:  grn, yllw, blck, white

=begin

# Problem
- Given an array of strings,
- Return the same array of the same string, but with those vowels removed
- Input: Array
- Output: The same Array

# Examples
arr = ["green", "yellow", "black", "white"]
remove_vowels!(arr)
p arr == ["grn", "yllw", "blck", "wht"]

# Algorithm
- Given an Array, iterate through the array,
  - Transform each element in place, removing all vowels
  - Return the same Array

=end

# Code
def remove_vowels!(arr)
  arr.map! do |str|
    str.gsub!(/[aeiou]/i, "")
  end
end

# if I'm not allowed to use regex
def remove_vowels!(arr)
  arr.map! do |str|
    str.delete('aeiouAEIOU')
  end
end

arr = ["green", "yellow", "black", "white"]
remove_vowels!(arr)
p arr == ["grn", "yllw", "blck", "wht"]
