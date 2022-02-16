=begin

Problem:
- Input: string
- Output: hash, letter as key, count as value
- Rules:
  - count lowercase letters in a given string
  - return the letter count in a hash with letter as key and count as value
  - the key must be a symbol instead of a string
- Questions:
  - How about the non-lowercase letters?
    - I suppose they are ignored?

Examples:
letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

Data Structures:
- Input: string
- Intermediate: an array to the each character
- Output: hash, letter as key, count as value

Algorithm:
- initialise a hash that is going to return, and set the default value to 0
- split the string into single characters
- iterate through each character
  - if it is a lowercase letter
    - convert the letter to a symbol
    - find the corresponding value into the hash initialised earlier
    - increment the value by 1
- return the hash

=end

# Code:

def letter_count(string)
  count = Hash.new(0)
  characters = string.chars
  characters.each do |character|
    if ('a'..'z').include?(character) # or character =~ /[a-z]/
      count[character.to_sym] += 1
    end
  end
  count
end

p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
