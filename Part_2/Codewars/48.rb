=begin
  
Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.

Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".

# Problem
- Given a string containing only letters and uppercase letters are unique
- Return a string that is sorted alphabetically, where the uppercase letter comes before all its lowercase letters

# Algorithm
- Turn the string into an array of letters
- Group the letters by their uppercase
- Create the desired string based on the grouping
- Return the string

=end

def find_children(str)
  letters = str.chars
  group = letters.group_by { |letter| letter.upcase }

  output = ''
  group = group.sort_by do |key, value|
    key
  end.to_h
  group.each do |key, value|
    output << key
    (value.size - 1).times { |_| output << key.downcase }
  end
  output
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""
