=begin

In this kata, you've to count lowercase letters in a given string and return the 
letter count in a hash with 'letter' as key and count as 'value'. The key must 
be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

# Problrm
- Given a string, count the lowercase letters
- Return a hash for the counts
- They key is the letter (in symbol)
- The value is the count

# Algorithm
- Given a string, remove the characters that are not lowercase letters
- Turn the result string into an array of unique lowercase letters
- Initialize an empty hash for `output`
- Iterate through the above array,
  - For each lowercase letter, count the occurrence in the given word
  - Set the lowercase letter as the key in `output` (in symbol), and the count as the corresponding value
- Return `output`

=end

def letter_count(word)
  output = {}
  chars = word.delete("^a-z").chars.uniq
  chars.each do |char|
    output[char.to_sym] = word.count(char)
  end
  output
end

p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
