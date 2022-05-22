# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase. You may assume that words are any sequence of non-blank characters.

def word_cap(str)
  words = str.split
  words.each do |word|
    word.capitalize!
  end
  words.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap!(str)
  str.downcase!
  str.each_char.with_index do |char, index|
    if index == 0
      str[index] = str[index].capitalize
    elsif char == ' '
      str[index + 1] = str[index + 1].capitalize
    end
  end
end

word = 'four score and seven'
word_cap!(word)
p word == 'Four Score And Seven'

word = 'the javaScript language'
word_cap!(word)
p word == 'The Javascript Language'

word = 'this is a "quoted" word'
word_cap!(word)
p word == 'This Is A "quoted" Word'
