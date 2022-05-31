=begin

Your task is to Reverse and Combine Words.
 
Input: String containing different "words" separated by spaces
 
1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
  (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result

# Problem
- Given a string of words, separated by space
- Until there is only one word,
  - Reverse each word and combine the first and second words, the third and the fourth and so on..
- Return the result

# Algorithm
- Return the string if there is only one word
- Given a string of words separated by space
- Until there is only word word
  - Split the string into words
  - Reverse each word
  - Combine the 1st and 2nd words, 3rd and 4th words, and so on
- Return the string

=end

def reverse_and_combine_text(str)
  return str if str.count(' ') == 0
  
  loop do
    str = str.split(' ')
    str = str.map { |word| word.reverse }

    str_combined = []
    index = 0
    loop do
      str_combined << str[index..(index + 1)].join('')
      index += 2
      break if index >= str.size
    end
    str = str_combined.join(' ')
    
    break if str.count(' ') == 0 
  end
  
  str
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12 44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
