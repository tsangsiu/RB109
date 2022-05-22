# Write a method that will return a substring based on specified indices.
def substring(str, start, stop = start)
  str[start..stop]
end

p substring("honey", 0, 2) == "hon"
p substring("honey", 1, 2) == "on"
p substring("honey", 3, 9) == "ey"
p substring("honey", 2) == "n"

# Write a method that finds all substrings in a string, no 1 letter words.
def substrings(str)
  substrings = []
  (0..(str.length - 2)).each do |start_index|
    stop_index = start_index + 1
    ((stop_index)..(str.length - 1)).each do |end_index|
      substrings << str[start_index..end_index]
    end
  end
  substrings
end

p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']

# Write a method that will return all palindromes within a string.
def palindrome?(str)
  (0...(str.length / 2)).each do |index|
    return false if str[index] != str[-(index + 1)]
  end
  true
end

def palindromes(str)
  substrs = substrings(str)
  substrs.select do |substr|
    palindrome?(substr)
  end
end

p palindromes('ppop') == ['pp', 'pop']

# Write a method that finds the longest substring that is a palindrome within a string.
def longest_palindrome(str)
  palindromes = palindromes(str)
  palindromes.max_by { |palindrome| palindrome.length }
end

p longest_palindrome("ppop") == 'pop'
