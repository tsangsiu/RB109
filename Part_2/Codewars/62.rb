=begin
  
#Find the missing letter

Write a method that takes an array of consecutive (increasing) letters as input 
and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter be 
missing. The length of the array will always be at least 2.

The array will always contain letters in only one case.

Example:

['a','b','c','d','f'] -> 'e' ['O','Q','R','S'] -> 'P'

["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"
(Use the English alphabet with 26 letters!)

# Problem
- Givan an array of consecutive letters,
- Return the letter that is missing

# Algorithm
- Get the ASCII code of the first letter
- Set `letter_taget` to the letter represented by the ASCII code
- Loop through the given array
  - If the current letter does not equal `letter_target`,
    - return `letter_taget`
  - Else,
    - set `letter_target` to the next letter

=end

# Code
def next_letter(letter)
  (letter.ord + 1).chr
end

def find_missing_letter(arr)
  letter_target = arr.first
  index = 0
  loop do
    if arr[index] != letter_target
      return letter_target
    else
      letter_target = next_letter(arr[index])
      index += 1
    end  
  end
end

def find_missing_letter(arr)
  letter_target = arr.first
  arr.each do |letter|
    if letter != letter_target
      return letter_target
    else
      letter_target = next_letter(letter)
    end
  end
end

p find_missing_letter(["a","b","c","d","f"]) #== "e"
p find_missing_letter(["O","Q","R","S"]) #== "P"
p find_missing_letter(["b","d"]) #== "c"
p find_missing_letter(["a","b","d"]) #== "c"
p find_missing_letter(["b","d","e"]) #== "c"
