=begin

Problem:
- Rules:
  - convert a camel case string to a kebak case
- Questions:
  - what is camel case?
    - example: myCamelCasedString
  - what is kebak case?
    - example: my-kebah-case-string
  - renew a new string?
    - i assume it's no, as the question states to modify

Examples:
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

Data Structures:
- Input: string
- Intermediate: string
- Output: string

Algorithm:
- given a camel case string
  - remove all non-alphabets
  - iterate through the chars
    - if it is a capital chars
      - replcae it with and hyphen (-) and its lower case
  - return the string
  
=end

# Code:

def kebabize(string)
  string.gsub!(/[^A-Z]/i, "")
  string.each_char do |char|
    if char.match?(/[A-Z]/)
      string.gsub!(char, "-#{char.downcase}")
    end
  end
  string
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
