=begin

Given a string s, reverse the string according to the following rules:

All the characters that are not English letters remain in the same position.
All the English letters (lowercase or uppercase) should be reversed.
Return s after reversing it.

# Problem
- Given a string, reverse only the English letters
- Characters that are not letters should be stayed at the same place

# Algorithm
- Given a string, turn it into an array of individual characters
- Select all letters in the array and put them to a new array `letters`
- Reverse the array `letters`
- Replace the array of letters with `nil`
- Iterate through the array of letters,
  - If the current element is `nil`
  - Take the first element in `letters` and replace it
  - Remove the first element in `letters`
- Turn the array back to a string and return it

=end

def reverse_only_letters(str)
  chars = str.chars
  letters = chars.select { |char| ('a'..'z').include?(char.downcase) }.reverse
  chars = chars.map { |char| ('a'..'z').include?(char.downcase) ? nil : char }
  chars = chars.map { |char| char == nil ? letters.shift : char }
  chars.join('')
end

p reverse_only_letters('ab-cd') == "dc-ba"
p reverse_only_letters('a-bC-dEf-ghIj') == "j-Ih-gfE-dCba"
p reverse_only_letters('Test1ng-Leet=code-Q!') == "Qedo1ct-eeLg=ntse-T!"
