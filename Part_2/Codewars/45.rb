=begin
  
Problem
Rules/Requirements
- Re-order the characters of a string in "case-insensitively-alphabetical-order-of-appearance" order
- Remove the whitespace and punctuation
- The input contains only English alphabets
Input: String
Output: String

Examples
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

Data Structure
Input: String
Intermediate: Array
Output: String

Algorithm
- Given a string, remove all non-alphabets
- Convert the string into an array of characters
- Sort the character by the order of the lowercase of that character
- Merge the array of characters back to a string
- Return the string
rub
=end

# Code
def alphabetized(string)
  string = string.delete("^a-zA-Z")
  chars = string.chars.sort_by { |char| char.downcase }
  chars.join
end

p alphabetized("The Holy Bible") #== "BbeehHilloTy"
p alphabetized("") #== ""
p alphabetized(" ") #== ""
p alphabetized(" a") #== "a"
p alphabetized("a ") #== "a"
p alphabetized(" a ") #== "a"
p alphabetized("A b B a") #== "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") #== "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
