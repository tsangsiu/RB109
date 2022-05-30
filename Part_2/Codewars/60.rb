=begin
  
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical 
order of the strings of a1 which are substrings of strings of a2.

#Example 1: a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.

In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

Beware: r must be without duplicates.
Don't mutate the inputs.

# Problem
- Given two arrays of strings `a1` and `a2`,
- Return a sorted array `r` containing elements in `a1` which are substrings of any strings in `a2`
- Do not mutate the inputs
- The return `r` must be without duplicates

# Algorithm
- Initailize `r` to an empty array
- Iterate through `array1`
  - If the current string happens to be a substring of anystring string in `array2`
  - Push it to `r`
- Return the sorted array `r`

=end

def in_array(array1, array2)
  r = []
  array1.each do |str_arr1|
    r << str_arr1 if array2.any? { |str_arr2| str_arr2.include?(str_arr1) }
  end
  r.sort
end

p in_array(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
p in_array(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
