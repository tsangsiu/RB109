=begin

Problem
- Rules
  - Given a string, return a hashtag for it
  - It must start with a hashtag (#)
  - All words must have the first letter capitalized
  - If the result is longer than 140, return false
  - If the input or result is an empty string, return false
- Input: String
- Output: String or Boolean, depends on the input

Examples
p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false

Data Structures
- Input: String
- Intermediate: Array
- Output: String or Boolean

Algorithm
- Given a string, split it into words at space
- Iterate through each word
  - Capitalize that word and replace the original
- Combine the transformed words
- If the result is a null string or its length is longer than 140, return false
- Prepend it with a hashtag
- Return the result
  
=end

# Code
def generateHashtag(string)
  words = string.split
  words = words.map do |word|
    word.capitalize
  end
  words = words.join('')
  return false if words == '' || words.length > 139
  words.prepend('#')
end

p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false
