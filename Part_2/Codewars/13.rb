=begin

# Problem
- given a string a camel case, turn it into a kebab case and return it
- a kebab case are words in lowercase letters, separated by a hypen (-)
- all non-alphabets are deleted
- Input: string
- Output: string

# Examples
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

# Algorithm
- given a string in camel case, remove all non-alphabets
- initialize `words` to an empty array
- initialize `word` to an empty string
- iterate through the given string,
  - if the current character is a capital letter
    - push `word` to `words`
    - set `word` to an empty string
    - push the current letter (in lower case) to `word`
  - else,
    - push the current character to `word`
- push `word` to `words`
- Join `words` with hypen
- Return the result

=end

# Code
def kebabize(str)
  str = str.gsub(/[^a-z]/i, "")
  words = []
  word = ""
  str.each_char do |char|
    if ('A'..'Z').to_a.include?(char)
      words << word
      word = ""
      word << char.downcase
    else
      word << char  
    end
  end
  words << word
  words.join('-')
end

# my previous solution
def kebabize(string)
  string.gsub!(/[^A-Z]/i, "")
  string.each_char do |char|
    if char.match?(/[A-Z]/)
      string.gsub!(char, "-#{char.downcase}")
    end
  end
  string
end

p kebabize('myCamelCasedString') #== 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') #== 'my-camel-has-humps'
